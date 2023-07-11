using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class UserProfile : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] != null)
      {
        Response.Write("<script>alert('Welcome, " + Session["Username"].ToString() + "')</script>");
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