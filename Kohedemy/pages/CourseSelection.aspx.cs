﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
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
  }
}