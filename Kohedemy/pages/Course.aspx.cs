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
  public partial class Course : System.Web.UI.Page
  {
    public class ExcerptData
    {
      public int ExcerptId { get; set; }
      public string ExcerptTitle { get; set; }
      public string ExcerptSubheading { get; set; }
      public string ExcerptContent { get; set; }
      public byte[] ExcerptImage { get; set; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      int courseId = Convert.ToInt32(Request.QueryString["CourseId"]);

      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        string courseQuery = "SELECT Title FROM [Course] WHERE CourseID = @CourseID";
        SqlCommand courseCmd = new SqlCommand(courseQuery, con);
        courseCmd.Parameters.AddWithValue("@CourseID", courseId);

        SqlDataReader sdr = courseCmd.ExecuteReader();

        while (sdr.Read())
        {
          BannerQuote.Text = sdr["Title"].ToString();
        }

        sdr.Close();

        string excerptQuery = @"
                              SELECT * FROM [Excerpt] AS e 
                              INNER JOIN [Content] AS ct ON e.ContentID = ct.ContentID 
                              INNER JOIN [Course] AS c ON ct.CourseID = c.CourseID 
                              WHERE c.CourseID = @CourseID
                              ";
        SqlCommand excerptCmd = new SqlCommand(excerptQuery, con);
        excerptCmd.Parameters.AddWithValue("@CourseID", courseId);

        SqlDataReader sdr2 = excerptCmd.ExecuteReader();

        List<ExcerptData> excerptDatas = new List<ExcerptData>();

        while(sdr2.Read())
        {
          ExcerptData excerptData = new ExcerptData
          {
            ExcerptId = Convert.ToInt32(sdr2["ExcerptID"]),
            ExcerptTitle = sdr2["Title"].ToString(),
            ExcerptSubheading = sdr2["Subheading"].ToString(),
            ExcerptContent = sdr2["Content"].ToString(),
            ExcerptImage = (byte[])sdr2["Image"]
          };

          excerptDatas.Add(excerptData);
        }

        sdr2.Close();

        con.Close();

        CourseRepeater.DataSource = excerptDatas;
        CourseRepeater.DataBind();
      }
      catch(Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}