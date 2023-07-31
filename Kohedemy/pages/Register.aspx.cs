using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

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
        if((UsernameBox.Text != "") && (PasswordBox.Text != "") && (EmailBox.Text != ""))
        {
          if(PasswordBox.Text == ConfirmBox.Text)
          {
            if (PasswordBox.Text.Length > 9)
            {
              SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RegisterString"].ConnectionString);
              con.Open();

              string query = "SELECT count(*) from [User] where EmailAddress = @Email";
              SqlCommand cmd = new SqlCommand(query, con);
              cmd.Parameters.AddWithValue("@Email", EmailBox.Text);

              int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());

              if (check > 0)
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

                Response.Write("<script>alert('Your account is created. Please login.'); document.location.href = './Login.aspx'</script>");

                con.Close();
              }
            }
            else
            {
              Response.Write("<script>alert('Password must be more than 10 characters'); document.location.href = './Register.aspx'</script>");
            }
          }
          else
          {
            Response.Write("<script>alert('Password and confirm password are not the same.'); document.location.href = './Register.aspx'</script>");
          }
        }
        else
        {
          Response.Write("<script>alert('Please fill in all input fields.'); document.location.href = './Register.aspx'</script>");
        }
      }
      catch (Exception ex)
      {
        Debug.WriteLine(ex.Message);
      }
    }
  }
}