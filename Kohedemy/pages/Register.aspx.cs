﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class Register : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        String query = "SELECT count(*) from [User] where EmailAddress = @Email";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@Email", EmailBox.Text);

        int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

        if(check > 0)
        {
          Response.Write("<script>alert('Email address already in use.');</script>");
        }
        else
        {
          string insertQuery = "INSERT INTO [User] (Username, EmailAddress, Password) VALUES (@Username, @Email, @Password)";
          SqlCommand cmd1 = new SqlCommand(insertQuery, con);
          cmd1.Parameters.AddWithValue("@Username", UsernameBox.Text);
          cmd1.Parameters.AddWithValue("@Email", EmailBox.Text);
          cmd1.Parameters.AddWithValue("@Password", PasswordBox.Text);

          cmd1.ExecuteNonQuery();

          Response.Write("<script>alert('Your account is created. Please login.')</script>");
        }

        con.Close();
      }
      catch (Exception ex)
      {
        Response.Write("<script>alert('Failed to register your account. Please try again." + ex + ")</script>");
      }
    }
  }
}