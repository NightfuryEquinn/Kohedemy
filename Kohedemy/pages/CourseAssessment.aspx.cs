using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class CourseAssessment : System.Web.UI.Page
  {
    public class McqData
    {
      public int QuestionID { get; set; }
      public string QuestionNumber { get; set; }
      public string Question { get; set; }
      public string ChoiceA { get; set; }
      public string ChoiceB { get; set; }
      public string ChoiceC { get; set; }
      public string ChoiceD { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string != null)
      {
        try
        {
          SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
          con.Open();

          int theCourseId = Convert.ToInt32(Request.QueryString["CourseId"]);

          string fetchQuestionQuery = @"
                                      SELECT * FROM [Question] as q
                                      INNER JOIN [Assessment] as a ON q.AssessmentID = a.AssessmentID
                                      INNER JOIN [Course] as c ON a.CourseID = c.CourseID
                                      WHERE c.CourseID = @CourseID;
                                      ";
          SqlCommand fetchQuestionQueryCmd = new SqlCommand(fetchQuestionQuery, con); ;
          fetchQuestionQueryCmd.Parameters.AddWithValue("@CourseID", theCourseId);

          SqlDataReader sdr = fetchQuestionQueryCmd.ExecuteReader();

          List<McqData> mcqQuestions = new List<McqData>();
          int count = 1;

          while(sdr.Read())
          {
            McqData mcqQuestion = new McqData
            {
              QuestionID = Convert.ToInt32(sdr["QuestionID"]),
              QuestionNumber = count.ToString(),
              Question = sdr["Question"].ToString(),
              ChoiceA = sdr["ChoiceA"].ToString(),
              ChoiceB = sdr["ChoiceB"].ToString(),
              ChoiceC = sdr["ChoiceC"].ToString(),
              ChoiceD = sdr["ChoiceD"].ToString(),
            };

            count++;
            mcqQuestions.Add(mcqQuestion);
          }

          sdr.Close();

          con.Close();

          if (!IsPostBack)
          {
            MCQRepeater.DataSource = mcqQuestions;
            MCQRepeater.DataBind();
          }
        }
        catch (Exception ex)
        {
          Debug.WriteLine(ex.Message);
        }
      }
      else
      {
        Response.Write(
          "<script>alert('Please register a Kohedemy account or login to Kohedemy before taking your assessment'); document.location.href='./Login.aspx'</script>"
        );
      }
    }

    protected void FinishAssessmentButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        int theCourseId = Convert.ToInt32(Request.QueryString["CourseId"]);

        int totalCorrectAnswers = 0;

        foreach (RepeaterItem item in MCQRepeater.Items)
        {
          RadioButton ChoiceA = item.FindControl("ChoiceA") as RadioButton;
          RadioButton ChoiceB = item.FindControl("ChoiceB") as RadioButton;
          RadioButton ChoiceC = item.FindControl("ChoiceC") as RadioButton;
          RadioButton ChoiceD = item.FindControl("ChoiceD") as RadioButton;

          int theQuestionID = Convert.ToInt32(ChoiceA.GroupName.ToString());
          string correctAnswer = GetCorrectAnswerFromDatabase(theQuestionID);

          if (ChoiceA.Checked && correctAnswer == "A")
          {
            totalCorrectAnswers++;
          }
          else if (ChoiceB.Checked && correctAnswer == "B")
          {
            totalCorrectAnswers++;
          }
          else if (ChoiceC.Checked && correctAnswer == "C")
          {
            totalCorrectAnswers++;
          }
          else if (ChoiceD.Checked && correctAnswer == "D")
          {
            totalCorrectAnswers++;
          }
        }

        if (totalCorrectAnswers > 7)
        {
          string getUserID = "SELECT * FROM [User] WHERE Username = @Username";
          SqlCommand getUserIDCmd = new SqlCommand(getUserID, con);
          getUserIDCmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

          SqlDataReader sdr = getUserIDCmd.ExecuteReader();
          int theUserId = 0;

          if (sdr.Read())
          {
            theUserId = Convert.ToInt32(sdr["UserID"]);
          }

          sdr.Close();

          string saveAssessmentFinish = @"
                                        UPDATE [Enrolled]
                                        SET
                                        Assessment = 1, DateAssessmentComplete = CURRENT_TIMESTAMP
                                        WHERE UserID = @UserID AND CourseID = @CourseID
                                        ";
          SqlCommand saveAssessmentFinishCmd = new SqlCommand(saveAssessmentFinish, con);
          saveAssessmentFinishCmd.Parameters.AddWithValue("@UserID", theUserId);
          saveAssessmentFinishCmd.Parameters.AddWithValue("@CourseID", theCourseId);

          saveAssessmentFinishCmd.ExecuteNonQuery();

          Response.Write(
            "<script>alert('You have passed the assessment. Total Correct Answers: " + totalCorrectAnswers + "'); document.location.href = './PersonalCourse.aspx'</script>"
          );
        }
        else
        {
          Response.Write(
            "<script>alert('You have failed the assessment. Please retake. Total Correct Answers: " + totalCorrectAnswers + "'); document.location.href = './PersonalCourse.aspx'</script>"
          );
        }

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }

    public string GetCorrectAnswerFromDatabase(int theQuestionId)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string correctAnswer = "";

        int theCourseId = Convert.ToInt32(Request.QueryString["CourseId"]);

        string getCorrectQuery = @"
                                 SELECT Answer FROM [Question] as q
                                 INNER JOIN [Assessment] as a ON q.AssessmentID = a.AssessmentID
                                 INNER JOIN [Course] as c ON a.CourseID = c.CourseID
                                 WHERE c.CourseID = @CourseID AND q.QuestionID = @QuestionID
                                 ";
        SqlCommand getCorrectQueryCmd = new SqlCommand(getCorrectQuery, con);
        getCorrectQueryCmd.Parameters.AddWithValue("@CourseID", theCourseId);
        getCorrectQueryCmd.Parameters.AddWithValue("@QuestionID", theQuestionId);

        correctAnswer = (string) getCorrectQueryCmd.ExecuteScalar();

        con.Close();

        return correctAnswer;
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
        throw;
      }
    }
  }
}