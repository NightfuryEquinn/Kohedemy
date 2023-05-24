using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kohedemy.pages
{
  public partial class testing : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      answerLabel.Text = "";
    }

    protected void AddBtn_Click(object sender, EventArgs e)
    {
      int a = 0;
      int b = 0;
      a = Convert.ToInt16(FirstNum.Text);
      b = Convert.ToInt16(SecondNum.Text);

      int ans = a + b;
      answerLabel.Text = "The answer is " + ans.ToString();
    }

    protected void SubBtn_Click(object sender, EventArgs e)
    {
      int a = Convert.ToInt16(FirstNum.Text);
      int b = Convert.ToInt16(SecondNum.Text);

      int ans = a - b;
      answerLabel.Text = "The answer is " + ans.ToString();
    }

    protected void MulBtn_Click(object sender, EventArgs e)
    {
      int a = Convert.ToInt16(FirstNum.Text);
      int b = Convert.ToInt16(SecondNum.Text);

      int ans = a * b;
      answerLabel.Text = "The answer is " + ans.ToString();
    }

    protected void DivBtn_Click(object sender, EventArgs e)
    {
      int a = Convert.ToInt16(FirstNum.Text);
      int b = Convert.ToInt16(SecondNum.Text);

      int ans = a / b;
      answerLabel.Text = "The answer is " + ans.ToString();
    }
  }
}