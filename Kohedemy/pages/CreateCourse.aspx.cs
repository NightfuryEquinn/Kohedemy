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
        byte[] image1Byte = ExcerptImage1.FileBytes;
        byte[] image2Byte = ExcerptImage2.FileBytes;
        byte[] image3Byte = ExcerptImage3.FileBytes;
        byte[] image4Byte = ExcerptImage4.FileBytes;

        string createQuery = @"
                             INSERT INTO [Course] (Title, Description, Difficulty, FeaturedImage) VALUES (@Title, @Description, @Difficulty, @FeaturedImage); 
                             
                             DECLARE @CourseID INT = SCOPE_IDENTITY();

                             INSERT INTO [Content] (CourseID) VALUES (@CourseID);

                             DECLARE @ContentID INT = SCOPE_IDENTITY();

                             INSERT INTO [Excerpt] (Title, Subheading, Content, Image, ContentID) VALUES (@Title1, @Subheading1, @Content1, @Image1, @ContentID);

                             INSERT INTO [Excerpt] (Title, Subheading, Content, Image, ContentID) VALUES (@Title2, @Subheading2, @Content2, @Image2, @ContentID);

                             INSERT INTO [Excerpt] (Title, Subheading, Content, Image, ContentID) VALUES (@Title3, @Subheading3, @Content3, @Image3, @ContentID);

                             INSERT INTO [Excerpt] (Title, Subheading, Content, Image, ContentID) VALUES (@Title4, @Subheading4, @Content4, @Image4, @ContentID);
                             ";

        SqlCommand cmdCreate = new SqlCommand(createQuery, con);

        cmdCreate.Parameters.AddWithValue("@Title", CourseTitle.Text);
        cmdCreate.Parameters.AddWithValue("@Description", CourseDescription.Text);
        cmdCreate.Parameters.AddWithValue("@Difficulty", CourseDifficulty.SelectedValue.ToString());
        SqlParameter featuredParam = new SqlParameter("@FeaturedImage", SqlDbType.VarBinary)
        {
          Value = featuredImageByte
        };
        cmdCreate.Parameters.Add(featuredParam);

        cmdCreate.Parameters.AddWithValue("@Title1", Excerpt1.Text);
        cmdCreate.Parameters.AddWithValue("@Subheading1", ExcerptSubheading1.Text);
        cmdCreate.Parameters.AddWithValue("@Content1", ExcerptContent1.Text);
        SqlParameter image1Param = new SqlParameter("@Image1", SqlDbType.VarBinary)
        {
          Value = image1Byte
        };
        cmdCreate.Parameters.Add(image1Param);

        cmdCreate.Parameters.AddWithValue("@Title2", Excerpt2.Text);
        cmdCreate.Parameters.AddWithValue("@Subheading2", ExcerptSubheading2.Text);
        cmdCreate.Parameters.AddWithValue("@Content2", ExcerptContent2.Text);
        SqlParameter image2Param = new SqlParameter("@Image2", SqlDbType.VarBinary)
        {
          Value = image2Byte
        };
        cmdCreate.Parameters.Add(image2Param);

        cmdCreate.Parameters.AddWithValue("@Title3", Excerpt3.Text);
        cmdCreate.Parameters.AddWithValue("@Subheading3", ExcerptSubheading3.Text);
        cmdCreate.Parameters.AddWithValue("@Content3", ExcerptContent3.Text);
        SqlParameter image3Param = new SqlParameter("@Image3", SqlDbType.VarBinary)
        {
          Value = image3Byte
        };
        cmdCreate.Parameters.Add(image3Param);

        cmdCreate.Parameters.AddWithValue("@Title4", Excerpt4.Text);
        cmdCreate.Parameters.AddWithValue("@Subheading4", ExcerptSubheading4.Text);
        cmdCreate.Parameters.AddWithValue("@Content4", ExcerptContent4.Text);
        SqlParameter image4Param = new SqlParameter("@Image4", SqlDbType.VarBinary)
        {
          Value = image4Byte
        };
        cmdCreate.Parameters.Add(image4Param);

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