using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Kohedemy.Pages
{
  public partial class CreateCourse : System.Web.UI.Page
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

    protected void CourseSaveButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        byte[] featuredImageByte = FeaturedImage.FileBytes;

        string createQuery = "INSERT INTO [Course] (Title, Description, Difficulty, FeaturedImage) VALUES (@Title, @Description, @Difficulty, @FeaturedImage)";
        SqlCommand cmdCreate = new SqlCommand(createQuery, con);

        cmdCreate.Parameters.AddWithValue("@Title", CourseTitle.Text);
        cmdCreate.Parameters.AddWithValue("@Description", CourseDescription.Text);
        cmdCreate.Parameters.AddWithValue("@Difficulty", CourseDifficulty.SelectedValue.ToString());

        SqlParameter imageParam = new SqlParameter("@FeaturedImage", SqlDbType.VarBinary);
        imageParam.Value = featuredImageByte;
        cmdCreate.Parameters.Add(imageParam);

        cmdCreate.ExecuteNonQuery();

        Response.Write(
          "<script>alert('Course added. Please review.'); document.location.href='./AdminCourseSelection.aspx'</script>"
        );

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}