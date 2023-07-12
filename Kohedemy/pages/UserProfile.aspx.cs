using System;
using System.Diagnostics;

namespace Kohedemy.Pages
{
  public partial class UserProfile : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      Debug.WriteLine("UserProfile");

      if (Session["Username"] as String != null)
      {
        Response.Write(
          "<script>alert('Welcome, " + Session["Username"].ToString() + "')</script>"
        );
      }
      else
      {
        Response.Write(
          "<script>alert('Unable to access your profile. Please log in again.'); document.location.href='./Login.aspx'</script>"
        );
      }
    }

    protected void LogOutButton_Click(object sender, EventArgs e)
    {
      Session.Abandon();
      Request.Cookies.Clear();

      Response.Redirect("Login.aspx");
    }
  }
}