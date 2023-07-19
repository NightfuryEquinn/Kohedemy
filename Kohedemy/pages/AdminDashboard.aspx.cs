using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class AdminDashboard : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string == "Kohemin")
      {
        
      }
      else
      {
        Response.Write(
          "<script>alert('You are forbidden to access this page.'); document.location.href='./Home.aspx'</script>"
        );
      }
    }
  }
}