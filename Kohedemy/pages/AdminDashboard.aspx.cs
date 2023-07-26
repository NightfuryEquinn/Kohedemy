using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class AdminDashboard : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string == "Kohemin")
      {
        try
        {
          SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
          con.Open();

          // Total Trainee
          string totalTrainee = "SELECT count(*) FROM [User]";
          SqlCommand totalTraineeCmd = new SqlCommand(totalTrainee, con);
          int totalTraineeCount = Convert.ToInt32(totalTraineeCmd.ExecuteScalar().ToString());

          TotalTrainee.Text = totalTraineeCount.ToString();

          // Total Course based on Difficulty
          string totalBegin = "SELECT count(*) FROM [Course] WHERE Difficulty = 'Beginner'";
          SqlCommand totalBeginCmd = new SqlCommand(totalBegin, con);
          int totalBeginCount = Convert.ToInt32(totalBeginCmd.ExecuteScalar().ToString());

          TotalBegin.Text = totalBeginCount.ToString();

          string totalInter = "SELECT count(*) FROM [Course] WHERE Difficulty = 'Intermediate'";
          SqlCommand totalInterCmd = new SqlCommand(totalInter, con);
          int totalInterCount = Convert.ToInt32(totalInterCmd.ExecuteScalar().ToString());

          TotalInter.Text = totalInterCount.ToString();

          string totalAdv = "SELECT count(*) FROM [Course] WHERE Difficulty = 'Advanced'";
          SqlCommand totalAdvCmd = new SqlCommand(totalAdv, con);
          int totalAdvCount = Convert.ToInt32(totalAdvCmd.ExecuteScalar().ToString());

          TotalAdv.Text = totalAdvCount.ToString();

          string totalMaster = "SELECT count(*) FROM [Course] WHERE Difficulty = 'Masterclass'";
          SqlCommand totalMasterCmd = new SqlCommand(totalMaster, con);
          int totalMasterCount = Convert.ToInt32(totalMasterCmd.ExecuteScalar().ToString());

          TotalMaster.Text = totalMasterCount.ToString();

          // Most Popular Course
          string popular = @"
                           SELECT count(*) AS EnrolledCount, c.CourseId, c.Title
                           FROM Enrolled AS en
                           INNER JOIN Course AS c ON en.CourseID = c.CourseID
                           GROUP BY c.CourseID, c.Title
                           ORDER BY EnrolledCount DESC
                           ";
          SqlCommand popularCmd = new SqlCommand(popular, con);
          SqlDataReader sdr = popularCmd.ExecuteReader();

          if (sdr.Read())
          {
            MostPopular.Text = sdr["Title"].ToString();
          }

          sdr.Close();

          // Number of Trainee Enrolled
          string totalEnrolled = "SELECT count(*) FROM [Enrolled]";
          SqlCommand totalEnrolledCmd = new SqlCommand(totalEnrolled, con);
          int totalEnrolledCount = Convert.ToInt32(totalEnrolledCmd.ExecuteScalar().ToString());

          TotalEnrolled.Text = totalEnrolledCount.ToString();

          // Number of Trainee Completed
          string totalCompleted = "SELECT count(*) FROM [Enrolled] WHERE Complete = 1";
          SqlCommand totalCompletedCmd = new SqlCommand(totalCompleted, con);
          int totalCompletedCount = Convert.ToInt32(totalCompletedCmd.ExecuteScalar().ToString());

          TotalCompleted.Text = totalCompletedCount.ToString();

          // Number of Trainee Assessed
          string totalAssessed = "SELECT count(*) FROM [Enrolled] WHERE Complete = 1 AND Assessment = 1";
          SqlCommand totalAssessedCmd = new SqlCommand(totalAssessed, con);
          int totalAssessedCount = Convert.ToInt32(totalAssessedCmd.ExecuteScalar().ToString());

          TotalAssessed.Text = totalAssessedCount.ToString();

          // Pending Assessment Course
          string pending = @"
                           SELECT * FROM [Course] AS c
                           LEFT JOIN [Assessment] AS a ON a.CourseID = c.CourseID
                           WHERE a.CourseID IS NULL;
                           ";
          SqlCommand pendingCmd = new SqlCommand(pending, con);

          DataTable pendingAssessmentsTable = new DataTable();

          SqlDataReader sdr2 = pendingCmd.ExecuteReader();
          pendingAssessmentsTable.Load(sdr2);

          if (pendingAssessmentsTable.Rows.Count == 0)
          {
            NoPendingAssessment.Visible = true;
            PendingAssessments.Visible = false;
          }
          else
          {
            PendingAssessments.DataSource = pendingAssessmentsTable;
            PendingAssessments.DataBind();
          }

          sdr2.Close();

          con.Close();
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

    protected void PendingAssessments_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
          Label pendingAssessmentLabel = (Label)e.Item.FindControl("PendingAssessment");

          DataRowView dataItem = (DataRowView)e.Item.DataItem;
          string courseTitle = dataItem["Title"].ToString();

          pendingAssessmentLabel.Text = courseTitle;
        }

        con.Close();
      }
      catch (Exception ex)
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