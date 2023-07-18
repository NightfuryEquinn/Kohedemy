using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.Pages
{
  public partial class CourseAssessment : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if (Session["Username"] as string != null)
      {

      }
      else
      {
        Response.Write(
          "<script>alert('Please register a Kohedemy account or login to Kohedemy before taking your assessment'); document.location.href='./Login.aspx'</script>"
        );
      }
    }
  }
}