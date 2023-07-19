using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Kohedemy.Pages
{
  public partial class Login : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
      try
      {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT count(*) FROM [User] WHERE EmailAddress = @Email AND Password = @Password", con);
        cmd.Parameters.AddWithValue("@Email", EmailBox.Text);
        cmd.Parameters.AddWithValue("@Password", PasswordBox.Text);

        int check = Convert.ToInt32(cmd.ExecuteScalar());

        if (check == 1)
        {
          SqlCommand cmdCheck = new SqlCommand("SELECT Username FROM [User] WHERE EmailAddress = @Email AND Password = @Password", con);
          cmdCheck.Parameters.AddWithValue("@Email", EmailBox.Text);
          cmdCheck.Parameters.AddWithValue("@Password", PasswordBox.Text);

          SqlDataReader sdr = cmdCheck.ExecuteReader();

          string username = "";

          while (sdr.Read())
          {
            username = sdr["Username"].ToString().Trim();
          }

          sdr.Close();

          Session["Username"] = username;

          if (Session["Username"] as string != "Kohemin")
          {
            Response.Redirect("UserProfile.aspx");
          }
          else
          {
            Response.Redirect("AdminDashboard.aspx");
          }
        }
        else
        {
          Response.Write(
            "<script>alert('Invalid credentials. Please try again.'); document.location.href='./Login.aspx'</script>"
          );
        }

        con.Close();
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}