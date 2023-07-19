using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Kohedemy.Pages
{
  public partial class Course : System.Web.UI.Page
  {
    public class ExcerptData
    {
      public int ExcerptId { get; set; }
      public string ExcerptTitle { get; set; }
      public string ExcerptSubheading { get; set; }
      public string ExcerptContent { get; set; }
      public byte[] ExcerptImage { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string != null)
      {
        int courseId = Convert.ToInt32(Request.QueryString["CourseId"]);

        try
        {
          SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
          con.Open();

          string courseQuery = "SELECT Title FROM [Course] WHERE CourseID = @CourseID";
          SqlCommand courseCmd = new SqlCommand(courseQuery, con);
          courseCmd.Parameters.AddWithValue("@CourseID", courseId);

          SqlDataReader sdr = courseCmd.ExecuteReader();

          while (sdr.Read())
          {
            BannerQuote.Text = sdr["Title"].ToString();
          }

          sdr.Close();

          string excerptQuery = @"
                                SELECT * FROM [Excerpt] AS e 
                                INNER JOIN [Content] AS ct ON e.ContentID = ct.ContentID 
                                INNER JOIN [Course] AS c ON ct.CourseID = c.CourseID 
                                WHERE c.CourseID = @CourseID
                                ";
          SqlCommand excerptCmd = new SqlCommand(excerptQuery, con);
          excerptCmd.Parameters.AddWithValue("@CourseID", courseId);

          SqlDataReader sdr2 = excerptCmd.ExecuteReader();

          List<ExcerptData> excerptDatas = new List<ExcerptData>();

          while(sdr2.Read())
          {
            ExcerptData excerptData = new ExcerptData
            {
              ExcerptId = Convert.ToInt32(sdr2["ExcerptID"]),
              ExcerptTitle = sdr2["Title"].ToString(),
              ExcerptSubheading = sdr2["Subheading"].ToString(),
              ExcerptContent = sdr2["Content"].ToString(),
              ExcerptImage = (byte[])sdr2["Image"]
            };

            excerptDatas.Add(excerptData);
          }

          sdr2.Close();

          con.Close();

          CourseRepeater.DataSource = excerptDatas;
          CourseRepeater.DataBind();
        }
        catch(Exception ex)
        {
          Debug.WriteLine(ex.Message);
        }
      }
      else
      {
        Response.Write(
          "<script>alert('Please register a Kohedemy account or login to Kohedemy before accessing your course'); document.location.href='./Login.aspx'</script>"
        );
      }
    }

    protected void FinishCourseButton_Click(object sender, EventArgs e)
    {
      int courseId = Convert.ToInt32(Request.QueryString["CourseId"]);

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string getUserID = "SELECT * FROM [User] WHERE Username = @Username";
        SqlCommand getUserIDCmd = new SqlCommand(getUserID, con);
        getUserIDCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

        SqlDataReader sdr = getUserIDCmd.ExecuteReader();
        int theUserID = 0;

        if (sdr.Read())
        {
          theUserID = Convert.ToInt32(sdr["UserID"]);
        }

        sdr.Close();

        string checkFinish = "SELECT count(*) FROM [Enrolled] WHERE DateComplete IS NULL AND DateAssessmentComplete IS NULL AND UserID = @UserID1 AND CourseID = @CourseID1";
        SqlCommand checkFinishCmd = new SqlCommand(checkFinish, con);
        checkFinishCmd.Parameters.AddWithValue("@UserID1", theUserID);
        checkFinishCmd.Parameters.AddWithValue("@CourseID1", courseId);

        string checkFinishBoth = "SELECT count(*) FROM [Enrolled] WHERE DateComplete IS NOT NULL AND DateAssessmentComplete IS NULL AND UserID = @UserID2 AND CourseID = @CourseID2";
        SqlCommand checkFinishBothCmd = new SqlCommand(checkFinishBoth, con);
        checkFinishBothCmd.Parameters.AddWithValue("@UserID2", theUserID);
        checkFinishBothCmd.Parameters.AddWithValue("@CourseID2", courseId);

        int checkFinishCount = Convert.ToInt32(checkFinishCmd.ExecuteScalar());
        int checkFinishBothCount = Convert.ToInt32(checkFinishBothCmd.ExecuteScalar());

        if (checkFinishCount == 1)
        {
          string saveFinish = @"
                            UPDATE [Enrolled] 
                            SET
                            Complete = 1, DateComplete = CURRENT_TIMESTAMP
                            WHERE UserID = @UserID3 AND CourseID = @CourseID3
                            ";
          SqlCommand saveFinishCmd = new SqlCommand(saveFinish, con);
          saveFinishCmd.Parameters.AddWithValue("@UserID3", theUserID);
          saveFinishCmd.Parameters.AddWithValue("@CourseID3", courseId);

          saveFinishCmd.ExecuteNonQuery();

          Response.Write(
            "<script>alert('Congrats. Now, you take your assessment'); document.location.href='./PersonalCourse.aspx'</script>"
          );
        }
        else if(checkFinishBothCount == 1)
        {
          Response.Write(
            "<script>alert('You have completed the course but not the assessment. Please take your assessment.'); document.location.href='./PersonalCourse.aspx'</script>"
          );
        }
        else
        {
          Response.Write(
            "<script>alert('You have completed the course and assessment in the past.'); document.location.href='./PersonalCourse.aspx'</script>"
          );
        }

        con.Close();
      }
      catch(Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}