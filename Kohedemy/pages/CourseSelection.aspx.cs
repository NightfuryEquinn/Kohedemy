using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
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

        String beginnerQuery = "SELECT * from [Course] WHERE Difficulty = 'Beginner'";
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

        con.Close();

        BeginnerRepeater.DataSource = beginnerCourses;
        BeginnerRepeater.DataBind();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}