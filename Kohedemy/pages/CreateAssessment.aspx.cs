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
          cmdCreate.Parameters.AddWithValue($"@Answer{i + 1}", ((TextBox)Page.FindControl($"Question{i + 1}Answer")).Text);

        }

        cmdCreate.ExecuteNonQuery();

        Response.Write(
          "<script>alert('Assessment added. Please review.'); document.location.href='./AdminCourseSelection.aspx'</script>"
        );

        con.Close();
      }
      catch(Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}