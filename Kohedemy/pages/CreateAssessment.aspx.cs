using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class CreateAssessment : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string == "Kohemin")
      {
        Debug.WriteLine("Admin");
      }
      else
      {
        Response.Write(
          "<script>alert('You are forbidden to access this page.'); document.location.href='./Home.aspx'</script>"
        );
      }
    }

    protected void AssessmentSaveButton_Click(object sender, EventArgs e)
    {
      int courseId = Convert.ToInt32(Request.QueryString["CourseId"]);

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        if(Request.QueryString["QId1"] == null)
        {
          string createQuery = @"
                             INSERT INTO [Assessment] (CourseID) VALUES (@CourseID)

                             DECLARE @AssessmentID INT = SCOPE_IDENTITY();

                             INSERT INTO [Question] (Question, ChoiceA, ChoiceB, ChoiceC, ChoiceD, Answer, AssessmentID)
                             VALUES (@Question1, @ChoiceA1, @ChoiceB1, @ChoiceC1, @ChoiceD1, @Answer1, @AssessmentID),
                                    (@Question2, @ChoiceA2, @ChoiceB2, @ChoiceC2, @ChoiceD2, @Answer2, @AssessmentID),
                                    (@Question3, @ChoiceA3, @ChoiceB3, @ChoiceC3, @ChoiceD3, @Answer3, @AssessmentID),
                                    (@Question4, @ChoiceA4, @ChoiceB4, @ChoiceC4, @ChoiceD4, @Answer4, @AssessmentID),
                                    (@Question5, @ChoiceA5, @ChoiceB5, @ChoiceC5, @ChoiceD5, @Answer5, @AssessmentID),
                                    (@Question6, @ChoiceA6, @ChoiceB6, @ChoiceC6, @ChoiceD6, @Answer6, @AssessmentID),
                                    (@Question7, @ChoiceA7, @ChoiceB7, @ChoiceC7, @ChoiceD7, @Answer7, @AssessmentID),
                                    (@Question8, @ChoiceA8, @ChoiceB8, @ChoiceC8, @ChoiceD8, @Answer8, @AssessmentID),
                                    (@Question9, @ChoiceA9, @ChoiceB9, @ChoiceC9, @ChoiceD9, @Answer9, @AssessmentID),
                                    (@Question10, @ChoiceA10, @ChoiceB10, @ChoiceC10, @ChoiceD10, @Answer10, @AssessmentID)
                             ";

          SqlCommand cmdCreate = new SqlCommand(createQuery, con);

          cmdCreate.Parameters.AddWithValue("@CourseID", courseId);

          for (int i = 0; i < 10; i++)
          {
            cmdCreate.Parameters.AddWithValue($"@Question{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}")).Text);
            cmdCreate.Parameters.AddWithValue($"@ChoiceA{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}A")).Text);
            cmdCreate.Parameters.AddWithValue($"@ChoiceB{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}B")).Text);
            cmdCreate.Parameters.AddWithValue($"@ChoiceC{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}C")).Text);
            cmdCreate.Parameters.AddWithValue($"@ChoiceD{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}D")).Text);
            cmdCreate.Parameters.AddWithValue($"@Answer{i + 1}", ((DropDownList)Page.FindControl($"Question{i + 1}Answer")).SelectedValue.ToString());
          }

          cmdCreate.ExecuteNonQuery();

          Response.Write(
            "<script>alert('Assessment added. Please review.'); document.location.href='./AdminCourseSelection.aspx'</script>"
          );
        }
        else
        {
          int q1 = Convert.ToInt32(Request.QueryString["QId1"]);
          int q2 = Convert.ToInt32(Request.QueryString["QId2"]);
          int q3 = Convert.ToInt32(Request.QueryString["QId3"]);
          int q4 = Convert.ToInt32(Request.QueryString["QId4"]);
          int q5 = Convert.ToInt32(Request.QueryString["QId5"]);

          int q6 = Convert.ToInt32(Request.QueryString["QId6"]);
          int q7 = Convert.ToInt32(Request.QueryString["QId7"]);
          int q8 = Convert.ToInt32(Request.QueryString["QId8"]);
          int q9 = Convert.ToInt32(Request.QueryString["QId9"]);
          int q10 = Convert.ToInt32(Request.QueryString["QId10"]);

          string updateQuery = @"
                               UPDATE [Question]
                               SET 
                               Question = CASE QuestionID
                                   WHEN @QuestionID1 THEN @Question1
                                   WHEN @QuestionID2 THEN @Question2
                                   WHEN @QuestionID3 THEN @Question3
                                   WHEN @QuestionID4 THEN @Question4
                                   WHEN @QuestionID5 THEN @Question5
                                   WHEN @QuestionID6 THEN @Question6
                                   WHEN @QuestionID7 THEN @Question7
                                   WHEN @QuestionID8 THEN @Question8
                                   WHEN @QuestionID9 THEN @Question9
                                   WHEN @QuestionID10 THEN @Question10
                               END,
                               ChoiceA = CASE QuestionID
                                   WHEN @QuestionID1 THEN @ChoiceA1
                                   WHEN @QuestionID2 THEN @ChoiceA2
                                   WHEN @QuestionID3 THEN @ChoiceA3
                                   WHEN @QuestionID4 THEN @ChoiceA4
                                   WHEN @QuestionID5 THEN @ChoiceA5
                                   WHEN @QuestionID6 THEN @ChoiceA6
                                   WHEN @QuestionID7 THEN @ChoiceA7
                                   WHEN @QuestionID8 THEN @ChoiceA8
                                   WHEN @QuestionID9 THEN @ChoiceA9
                                   WHEN @QuestionID10 THEN @ChoiceA10
                               END,
                               ChoiceB = CASE QuestionID
                                   WHEN @QuestionID1 THEN @ChoiceB1
                                   WHEN @QuestionID2 THEN @ChoiceB2
                                   WHEN @QuestionID3 THEN @ChoiceB3
                                   WHEN @QuestionID4 THEN @ChoiceB4
                                   WHEN @QuestionID5 THEN @ChoiceB5
                                   WHEN @QuestionID6 THEN @ChoiceB6
                                   WHEN @QuestionID7 THEN @ChoiceB7
                                   WHEN @QuestionID8 THEN @ChoiceB8
                                   WHEN @QuestionID9 THEN @ChoiceB9
                                   WHEN @QuestionID10 THEN @ChoiceB10
                               END,
                               ChoiceC = CASE QuestionID
                                   WHEN @QuestionID1 THEN @ChoiceC1
                                   WHEN @QuestionID2 THEN @ChoiceC2
                                   WHEN @QuestionID3 THEN @ChoiceC3
                                   WHEN @QuestionID4 THEN @ChoiceC4
                                   WHEN @QuestionID5 THEN @ChoiceC5
                                   WHEN @QuestionID6 THEN @ChoiceC6
                                   WHEN @QuestionID7 THEN @ChoiceC7
                                   WHEN @QuestionID8 THEN @ChoiceC8
                                   WHEN @QuestionID9 THEN @ChoiceC9
                                   WHEN @QuestionID10 THEN @ChoiceC10
                               END,
                               ChoiceD = CASE QuestionID
                                   WHEN @QuestionID1 THEN @ChoiceD1
                                   WHEN @QuestionID2 THEN @ChoiceD2
                                   WHEN @QuestionID3 THEN @ChoiceD3
                                   WHEN @QuestionID4 THEN @ChoiceD4
                                   WHEN @QuestionID5 THEN @ChoiceD5
                                   WHEN @QuestionID6 THEN @ChoiceD6
                                   WHEN @QuestionID7 THEN @ChoiceD7
                                   WHEN @QuestionID8 THEN @ChoiceD8
                                   WHEN @QuestionID9 THEN @ChoiceD9
                                   WHEN @QuestionID10 THEN @ChoiceD10
                               END,
                               Answer = CASE QuestionID
                                   WHEN @QuestionID1 THEN @Answer1
                                   WHEN @QuestionID2 THEN @Answer2
                                   WHEN @QuestionID3 THEN @Answer3
                                   WHEN @QuestionID4 THEN @Answer4
                                   WHEN @QuestionID5 THEN @Answer5
                                   WHEN @QuestionID6 THEN @Answer6
                                   WHEN @QuestionID7 THEN @Answer7
                                   WHEN @QuestionID8 THEN @Answer8
                                   WHEN @QuestionID9 THEN @Answer9
                                   WHEN @QuestionID10 THEN @Answer10
                               END
                               WHERE QuestionID IN (@QuestionID1, @QuestionID2, @QuestionID3, @QuestionID4, @QuestionID5, @QuestionID6, @QuestionID7, @QuestionID8, @QuestionID9, @QuestionID10)
                               ";

          SqlCommand cmdUpdate = new SqlCommand(updateQuery, con);

          cmdUpdate.Parameters.AddWithValue("@QuestionID1", q1);
          cmdUpdate.Parameters.AddWithValue("@QuestionID2", q2);
          cmdUpdate.Parameters.AddWithValue("@QuestionID3", q3);
          cmdUpdate.Parameters.AddWithValue("@QuestionID4", q4);
          cmdUpdate.Parameters.AddWithValue("@QuestionID5", q5);

          cmdUpdate.Parameters.AddWithValue("@QuestionID6", q6);
          cmdUpdate.Parameters.AddWithValue("@QuestionID7", q7);
          cmdUpdate.Parameters.AddWithValue("@QuestionID8", q8);
          cmdUpdate.Parameters.AddWithValue("@QuestionID9", q9);
          cmdUpdate.Parameters.AddWithValue("@QuestionID10", q10);

          for (int i = 0; i < 10; i++)
          {
            cmdUpdate.Parameters.AddWithValue($"@Question{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}")).Text);
            cmdUpdate.Parameters.AddWithValue($"@ChoiceA{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}A")).Text);
            cmdUpdate.Parameters.AddWithValue($"@ChoiceB{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}B")).Text);
            cmdUpdate.Parameters.AddWithValue($"@ChoiceC{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}C")).Text);
            cmdUpdate.Parameters.AddWithValue($"@ChoiceD{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}D")).Text);
            cmdUpdate.Parameters.AddWithValue($"@Answer{i + 1}", ((DropDownList)Page.FindControl($"Question{i + 1}Answer")).SelectedValue.ToString());
          }

          cmdUpdate.ExecuteNonQuery();

          Response.Write(
            "<script>alert('Assessment edited. Please review.'); document.location.href='./AdminCourseSelection.aspx'</script>"
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