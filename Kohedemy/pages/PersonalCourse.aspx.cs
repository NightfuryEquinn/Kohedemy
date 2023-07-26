using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Text;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class PersonalCourse : System.Web.UI.Page
  {
    public class PersonalCourseData
    {
      public int CourseId { get; set; }
      public string CourseTitle { get; set; }
      public string CourseDifficulty { get; set; }
      public byte[] CourseImage { get; set; }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
      try
      {
        if (Session["Username"] as string != null)
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

          string courseQuery = @"
                               SELECT * FROM [Enrolled] AS en
                               INNER JOIN [Course] AS c ON c.CourseID = en.CourseID
                               WHERE en.DateComplete IS NULL AND en.DateAssessmentComplete IS NULL AND en.UserID = @UserID1
                               ";
          SqlCommand courseQueryCmd = new SqlCommand(courseQuery, con);
          courseQueryCmd.Parameters.AddWithValue("@UserID1", theUserID);

          SqlDataReader sdr2 = courseQueryCmd.ExecuteReader();

          List<PersonalCourseData> newCourses = new List<PersonalCourseData>();

          while (sdr2.Read())
          {
            PersonalCourseData newCourse = new PersonalCourseData
            {
              CourseId = Convert.ToInt32(sdr2["CourseID"]),
              CourseTitle = sdr2["Title"].ToString(),
              CourseDifficulty = sdr2["Difficulty"].ToString(),
              CourseImage = (byte[])sdr2["FeaturedImage"]
            };

            newCourses.Add(newCourse);
          }

          sdr2.Close();

          string assessmentQuery = @"
                               SELECT * FROM [Enrolled] AS en
                               INNER JOIN [Course] AS c ON c.CourseID = en.CourseID
                               WHERE en.DateComplete IS NOT NULL AND en.DateAssessmentComplete IS NULL AND en.UserID = @UserID2
                               ";
          SqlCommand assessmentQueryCmd = new SqlCommand(assessmentQuery, con);
          assessmentQueryCmd.Parameters.AddWithValue("@UserID2", theUserID);

          SqlDataReader sdr3 = assessmentQueryCmd.ExecuteReader();

          List<PersonalCourseData> assessmentCourses = new List<PersonalCourseData>();

          while (sdr3.Read())
          {
            PersonalCourseData assessmentCourse = new PersonalCourseData
            {
              CourseId = Convert.ToInt32(sdr3["CourseID"]),
              CourseTitle = sdr3["Title"].ToString(),
              CourseDifficulty = sdr3["Difficulty"].ToString(),
              CourseImage = (byte[])sdr3["FeaturedImage"]
            };

            assessmentCourses.Add(assessmentCourse);
          }

          sdr3.Close();

          string reviseQuery = @"
                               SELECT * FROM [Enrolled] AS en
                               INNER JOIN [Course] AS c ON c.CourseID = en.CourseID
                               WHERE en.DateComplete IS NOT NULL AND en.DateAssessmentComplete IS NOT NULL AND en.UserID = @UserID3
                               ";
          SqlCommand reviseQueryCmd = new SqlCommand(reviseQuery, con);
          reviseQueryCmd.Parameters.AddWithValue("@UserID3", theUserID);

          SqlDataReader sdr4 = reviseQueryCmd.ExecuteReader();

          List<PersonalCourseData> reviseCourses = new List<PersonalCourseData>();

          while (sdr4.Read())
          {
            PersonalCourseData reviseCourse = new PersonalCourseData
            {
              CourseId = Convert.ToInt32(sdr4["CourseID"]),
              CourseTitle = sdr4["Title"].ToString(),
              CourseDifficulty = sdr4["Difficulty"].ToString(),
              CourseImage = (byte[])sdr4["FeaturedImage"]
            };

            reviseCourses.Add(reviseCourse);
          }

          sdr4.Close();

          con.Close();

          EnrolledRepeater.DataSource = newCourses;
          EnrolledRepeater.DataBind();

          AssessmentRepeater.DataSource = assessmentCourses;
          AssessmentRepeater.DataBind();

          CompletedRepeater.DataSource = reviseCourses;
          CompletedRepeater.DataBind();
        }
        else
        {
          Response.Write(
            "<script>alert('Unable to access your profile. Please log in again.'); document.location.href='./Login.aspx'</script>"
          );
        }
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void GetStartedButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string courseId = "";
        Button startButton = (Button)sender;
        if (startButton.ID == "GetStartedButton")
        {
          courseId = startButton.CommandArgument;
        }

        StringBuilder sb = new StringBuilder("Course.aspx?CourseId=" + courseId);

        Response.Redirect(sb.ToString());

        con.Close();
      } 
      catch(Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void TakeAssessmentButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string courseId = "";
        Button takeButton = (Button)sender;
        if (takeButton.ID == "TakeAssessmentButton")
        {
          courseId = takeButton.CommandArgument;
        }

        StringBuilder sb = new StringBuilder("CourseAssessment.aspx?CourseId=" + courseId);

        Response.Redirect(sb.ToString());

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    protected void ReviseButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string courseId = "";
        Button reviseButton = (Button)sender;
        if (reviseButton.ID == "ReviseButton")
        {
          courseId = reviseButton.CommandArgument;
        }

        StringBuilder sb = new StringBuilder("Course.aspx?CourseId=" + courseId);

        Response.Redirect(sb.ToString());

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}