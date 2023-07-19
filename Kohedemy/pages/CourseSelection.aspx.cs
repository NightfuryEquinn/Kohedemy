using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class CourseSelection : System.Web.UI.Page
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
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string beginnerQuery = "SELECT * FROM [Course] WHERE Difficulty = 'Beginner'";
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

    protected void EnrollButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        if (Session["Username"] != null)
        {
          string theUsername = Session["Username"].ToString();
          Button enrollButton = (Button)sender;
          int theCourse = Convert.ToInt32(enrollButton.CommandArgument);

          Debug.WriteLine(theCourse);

          string checkCourse = @"
                               SELECT count(*) FROM [Enrolled] AS en 
                               INNER JOIN [User] AS u ON u.UserID = en.UserID
                               INNER JOIN [Course] AS c On c.CourseID = en.CourseID
                               WHERE u.Username = @Username AND c.CourseID = @CourseID
                               ";
          SqlCommand checkCourseCmd = new SqlCommand(checkCourse, con);
          checkCourseCmd.Parameters.AddWithValue("@Username", theUsername);
          checkCourseCmd.Parameters.AddWithValue("@CourseID", theCourse);

          int check = Convert.ToInt32(checkCourseCmd.ExecuteScalar().ToString());

          if (check > 0)
          {
            Response.Write(
              "<script>alert('You have already enrolled in this course'); document.location.href = './PersonalCourse.aspx'</script>"
            );
          }
          else
          {
            string getTheUserID = "SELECT UserID FROM [User] WHERE Username = @Username";
            SqlCommand getTheUserIDCmd = new SqlCommand(getTheUserID, con);
            getTheUserIDCmd.Parameters.AddWithValue("@Username", theUsername);

            SqlDataReader sdr = getTheUserIDCmd.ExecuteReader();
            int theUserID = 0;

            if (sdr.Read())
            {
              theUserID = Convert.ToInt32(sdr["UserID"].ToString());
            }

            string insertCourse = @"
                                  INSERT INTO [Enrolled] (DateEnroll, UserID, CourseID)
                                  VALUES (CURRENT_TIMESTAMP, @UserID, (SELECT CourseID FROM [Course] WHERE CourseID = @CourseID))
                                  ";
            SqlCommand insertCourseCmd = new SqlCommand(insertCourse, con);
            insertCourseCmd.Parameters.AddWithValue("@UserID", theUserID);
            insertCourseCmd.Parameters.AddWithValue("@CourseID", theCourse);

            sdr.Close();

            insertCourseCmd.ExecuteNonQuery();

            Response.Write(
              "<script>alert('You have sucessfully enrolled. You can start anytime now.'); document.location.href = './PersonalCourse.aspx'</script>"
            );
          }
        }
        else
        {
          Response.Write(
            "<script>alert('Please register a Kohedemy account or login to Kohedemy before enrolling to a course.'); document.location.href='./Login.aspx'</script>"
          );
        }

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}