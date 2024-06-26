﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Kohedemy.Pages
{
  public partial class UserProfile : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      try
      {
        if (Session["Username"] as string != null)
        {
          if (Session["Username"] as string != "Kohemin")
          {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
            con.Open();

            SqlCommand cmdCheck = new SqlCommand("SELECT * FROM [User] WHERE Username = '" + Session["Username"] + "'", con);

            SqlDataReader sdr = cmdCheck.ExecuteReader();

            while (sdr.Read())
            {
              ProfileName.Text = sdr["Username"].ToString().Trim();
              ProfileEmail.Text = sdr["EmailAddress"].ToString().Trim();
            }

            sdr.Close();

            con.Close();
          }
          else
          {
            Response.Redirect("AdminDashboard.aspx");
          }
        }
        else
        {
          Response.Write(
            "<script>alert('Unable to access your profile. Please log in again.'); document.location.href='./Login.aspx'</script>"
          );
        }
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

    protected void SaveButton_Click(object sender, EventArgs e)
    {
      try
      {
        if ((editUsername.Text != "") && (editPassword.Text != "") && (editEmail.Text != ""))
        {
          if (editPassword.Text == editConfirm.Text)
          {
            if (editPassword.Text.Length > 9)
            {
              SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
              con.Open();

              SqlCommand cmdCheck = new SqlCommand("SELECT * FROM [User] WHERE Username = '" + Session["Username"] + "'", con);

              SqlDataReader sdr = cmdCheck.ExecuteReader();

              string compareEmail = "";

              while (sdr.Read())
              {
                compareEmail = sdr["EmailAddress"].ToString().Trim();
              }

              sdr.Close();

              string query = "SELECT count(*) from [User] where EmailAddress = @Email";
              SqlCommand cmd = new SqlCommand(query, con);
              cmd.Parameters.AddWithValue("@Email", editEmail.Text);

              int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

              if (check > 0 && (ProfileEmail.Text != compareEmail))
              {
                Response.Write("<script>alert('Email address already in use.');</script>");
              }
              else
              {
                SqlCommand cmdSave = new SqlCommand("UPDATE [User] SET Username ='" + editUsername.Text + "', EmailAddress = '" + editEmail.Text + "', Password = '" + editPassword.Text + "' WHERE Username = '" + Session["Username"] + "'", con);
                cmdSave.ExecuteNonQuery();

                con.Close();

                Session["Username"] = editUsername.Text;

                Response.Write(
                  "<script>alert('Your personal detail has been updated successfully.'); document.location.href='./UserProfile.aspx'</script>"
                );
              }
            }
            else
            {
              Response.Write("<script>alert('Password must be more than 10 characters'); document.location.href = './UserProfile.aspx'</script>");
            }
          }
          else
          {
            Response.Write("<script>alert('Password and confirm password are not the same.'); document.location.href = './UserProfile.aspx'</script>");
          }
        }
        else
        {
          Response.Write("<script>alert('Please fill in all input fields.'); document.location.href = './UserProfile.aspx'</script>");
        }
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}