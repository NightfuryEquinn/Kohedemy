using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        String query = "SELECT count(*) from [User] where EmailAddress = @Email AND Password = @Password";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@Email", EmailBox.Text);
        cmd.Parameters.AddWithValue("@Password", PasswordBox.Text);

        int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

        if (check == 1)
        {
        
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
        Response.Write("<script>alert('Failed to login. Please try again." + ex + ")</script>");
      }
    }
  }
}