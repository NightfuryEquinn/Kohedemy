using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class PersonalCourse : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      Debug.WriteLine("PersonalCourse");

      try
      {
        if (Session["Username"] as String != null)
        {
          Debug.WriteLine("Pass");
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
  }
}