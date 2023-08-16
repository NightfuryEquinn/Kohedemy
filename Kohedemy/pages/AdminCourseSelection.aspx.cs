using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Text;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class AdminCourseSelection : System.Web.UI.Page
  {
    public class CourseData
    {
      public int CourseId { get; set; }
      public string CourseTitle { get; set; }
      public string CourseDescription { get; set; }
      public string CourseDifficulty { get; set; }
      public byte[] CourseImage { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string == "Kohemin")
      {
        try
        {
          SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
          con.Open();

          // For Beginner Course
          string beginnerQuery = "SELECT * from [Course] WHERE Difficulty = 'Beginner'";
          SqlCommand beginnerCmd = new SqlCommand(beginnerQuery, con);

          SqlDataReader sdr = beginnerCmd.ExecuteReader();

          List<CourseData> beginnerCourses = new List<CourseData>();

          while (sdr.Read())
          {
            CourseData beginnerCourse = new CourseData
            {
              CourseId = Convert.ToInt32(sdr["CourseID"]),
              CourseTitle = sdr["Title"].ToString(),
              CourseDescription = sdr["Description"].ToString(),
              CourseDifficulty = sdr["Difficulty"].ToString(),
              CourseImage = (byte[])sdr["FeaturedImage"]
            };

            beginnerCourses.Add(beginnerCourse);
          }

          sdr.Close();

          // For Intermediate Course
          string intermediateQuery = "SELECT * from [Course] WHERE Difficulty = 'Intermediate'";
          SqlCommand intermediateCmd = new SqlCommand(intermediateQuery, con);

          SqlDataReader sdr2 = intermediateCmd.ExecuteReader();

          List<CourseData> intermediateCourses = new List<CourseData>();

          while (sdr2.Read())
          {
            CourseData intermediateCourse = new CourseData
            {
              CourseId = Convert.ToInt32(sdr2["CourseID"]),
              CourseTitle = sdr2["Title"].ToString(),
              CourseDescription = sdr2["Description"].ToString(),
              CourseDifficulty = sdr2["Difficulty"].ToString(),
              CourseImage = (byte[])sdr2["FeaturedImage"]
            };

            intermediateCourses.Add(intermediateCourse);
          }

          sdr2.Close();

          // For Advanced Course
          string advancedQuery = "SELECT * from [Course] WHERE Difficulty = 'Advanced'";
          SqlCommand advancedCmd = new SqlCommand(advancedQuery, con);

          SqlDataReader sdr3 = advancedCmd.ExecuteReader();

          List<CourseData> advancedCourses = new List<CourseData>();

          while (sdr3.Read())
          {
            CourseData advancedCourse = new CourseData
            {
              CourseId = Convert.ToInt32(sdr3["CourseID"]),
              CourseTitle = sdr3["Title"].ToString(),
              CourseDescription = sdr3["Description"].ToString(),
              CourseDifficulty = sdr3["Difficulty"].ToString(),
              CourseImage = (byte[])sdr3["FeaturedImage"]
            };

            advancedCourses.Add(advancedCourse);
          }

          sdr3.Close();

          // For Masterclass Course
          string masterclassQuery = "SELECT * from [Course] WHERE Difficulty = 'Masterclass'";
          SqlCommand masterclassCmd = new SqlCommand(masterclassQuery, con);

          SqlDataReader sdr4 = masterclassCmd.ExecuteReader();

          List<CourseData> masterclassCourses = new List<CourseData>();

          while (sdr4.Read())
          {
            CourseData masterclassCourse = new CourseData
            {
              CourseId = Convert.ToInt32(sdr4["CourseID"]),
              CourseTitle = sdr4["Title"].ToString(),
              CourseDescription = sdr4["Description"].ToString(),
              CourseDifficulty = sdr4["Difficulty"].ToString(),
              CourseImage = (byte[])sdr4["FeaturedImage"]
            };

            masterclassCourses.Add(masterclassCourse);
          }

          sdr4.Close();

          con.Close();

          BeginnerRepeater.DataSource = beginnerCourses;
          BeginnerRepeater.DataBind();

          IntermediateRepeater.DataSource = intermediateCourses;
          IntermediateRepeater.DataBind();

          AdvancedRepeater.DataSource = advancedCourses;
          AdvancedRepeater.DataBind();

          MasterclassRepeater.DataSource = masterclassCourses;
          MasterclassRepeater.DataBind();
        }
        catch (Exception ex)
        {
          Debug.WriteLine(ex.Message);
        }
      }
      else
      {
        Response.Write(
          "<script>alert('You are forbidden to access this page.'); document.location.href='./Home.aspx'</script>"
        );
      }
    }

    protected void EditButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
      ImageButton editButton = (ImageButton)sender;
      string courseId = editButton.CommandArgument;

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string excerptQuery = @"
                              SELECT e.ExcerptID, ct.ContentID, c.CourseID FROM [Excerpt] AS e
                              INNER JOIN [Content] AS ct ON e.ContentID = ct.ContentID
                              INNER JOIN [Course] AS c ON ct.CourseID = c.CourseID
                              WHERE c.CourseID = @CourseID
                              ";
        SqlCommand excerptCmd = new SqlCommand(excerptQuery, con);
        excerptCmd.Parameters.AddWithValue("@CourseID", courseId);

        SqlDataReader sdr = excerptCmd.ExecuteReader();

        StringBuilder sb = new StringBuilder("CreateCourse.aspx?CourseId=" + courseId);
        int count = 1;

        while (sdr.Read())
        {
          int excerptId = (int)sdr["ExcerptID"];
          sb.Append("&ExcerptId" + count + "=" + excerptId);
          count++;
        }

        Response.Redirect(sb.ToString());

        sdr.Close();

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void AssessmentButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
      ImageButton assessmentButton = (ImageButton)sender;
      string courseId = assessmentButton.CommandArgument;

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string checkQuestion = "SELECT COUNT(*) FROM [Assessment] WHERE CourseID = @CourseID";
        SqlCommand cmdCheck = new SqlCommand(checkQuestion, con);
        cmdCheck.Parameters.AddWithValue("@CourseID", courseId);

        int check = Convert.ToInt32(cmdCheck.ExecuteScalar());

        if (check != 1)
        {
          StringBuilder sb = new StringBuilder("CreateAssessment.aspx?CourseId=" + courseId);

          Response.Redirect(sb.ToString());
        }
        else
        {
          string getQuestion = @"
                               SELECT q.QuestionID, a.AssessmentID, c.CourseID FROM [Question] AS q
                               INNER JOIN [Assessment] AS a ON q.AssessmentID = a.AssessmentID
                               INNER JOIN [Course] AS c ON c.CourseID = a.CourseID
                               WHERE c.CourseID = @CourseID
                               ";
          SqlCommand getQuestionCmd = new SqlCommand(getQuestion, con);
          getQuestionCmd.Parameters.AddWithValue("@CourseID", courseId);

          SqlDataReader sdr = getQuestionCmd.ExecuteReader();

          StringBuilder sb = new StringBuilder("CreateAssessment.aspx?CourseId=" + courseId);
          int count = 1;

          while (sdr.Read())
          {
            int questionId = (int)sdr["QuestionID"];
            sb.Append("&QId" + count + "=" + questionId);
            count++;
          }

          Response.Redirect(sb.ToString());

          sdr.Close();
        }

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void DeleteButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
      ImageButton deleteButton = (ImageButton)sender;
      string courseId = deleteButton.CommandArgument;

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string deleteQuery = @"
                             DELETE e FROM [Excerpt] AS e
                             JOIN [Content] AS ct ON ct.ContentID = e.ContentID
                             JOIN [Course] AS c ON c.CourseID = ct.CourseID
                             WHERE c.CourseID = @CourseID

                             DELETE q FROM [Question] AS q
                             JOIN [Assessment] AS a ON a.AssessmentID = q.AssessmentID
                             JOIN [Course] AS c ON c.CourseID = a.CourseID
                             WHERE c.CourseID = @CourseID

                             DELETE ct FROM [Content] AS ct
                             JOIN [Course] AS c ON c.CourseID = ct.CourseID
                             WHERE c.CourseID = @CourseID

                             DELETE a FROM [Assessment] AS a
                             JOIN [Course] AS c ON c.CourseID = a.CourseID
                             WHERE c.CourseID = @CourseID

                             DELETE en FROM [Enrolled] AS en
                             JOIN [Course] AS c ON c.CourseID = en.CourseID
                             WHERE c.CourseID = @CourseID
 
                             DELETE FROM [Course] WHERE CourseID = @CourseID
                             ";
        SqlCommand cmdDelete = new SqlCommand(deleteQuery, con);
        cmdDelete.Parameters.AddWithValue("@CourseID", courseId);

        cmdDelete.ExecuteNonQuery();

        Response.Write(
          "<script>alert('All content and assessment related has been deleted permenantly.'); document.location.href='./AdminCourseSelection.aspx'</script>"
        );

        con.Close();
      }
      catch(Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Request.Cookies.Clear();

      Response.Redirect("Login.aspx");
    }
  }
}
