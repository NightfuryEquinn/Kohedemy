<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Kohedemy.Pages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <!--How code being decoded-->
    <meta charset = "utf-8" />

    <!--How page being display based on viewport-->
    <meta name = "viewport" content = "width = device-width, initial-scale = 1 shrink-to-fit = no" />

    <!--Link to CSS-->
    <link rel = "stylesheet" href = "../Css/main.css" />

    <!--Link to Javascript-->
    <script src="../Javascript/main.js" async></script>

    <!--Link to Google Font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Just+Another+Hand&family=Source+Sans+3:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <!--Link to Pictures file-->
    <link rel = "icon" type = "image/png" href = "../Assets/icons/kohedemy_logo.png" />

    <!--Title-->
    <title>Kohedemy - Register</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <!--Navigation Bar-->
      <nav>
        <img id="nav-logo" src="../Assets/icons/kohedemy_logo.png" />

        <div class="nav-container">
          <a>Home</a>
          <a>About Us</a>
          <a>Course</a>
          <a>Contact Us</a>
          <a>Log In</a>
        </div>
      </nav>

      <!--Login Content-->
      <div class="container-with-bg">
        <div class="login-form-container">
          <h3>JOIN KOHEDEMY</h3>

          <div class="login-form">
            <div class="login-wrap">
              <p>Email Address</p>
              <asp:TextBox CssClass="textbox" ID="EmailBox" runat="server"></asp:TextBox>
            </div>
            <div class="login-wrap">
              <p>Username</p>
              <asp:TextBox CssClass="textbox" ID="UsernameBox" runat="server"></asp:TextBox>
            </div>
            <div class="login-wrap">
              <p>Password</p>
              <asp:TextBox CssClass="textbox" TextMode="Password" ID="PasswordBox" runat="server"></asp:TextBox>
            </div>
            <div class="login-wrap">
              <p>Confirm Password</p>
              <asp:TextBox CssClass="textbox" TextMode="Password" ID="ConfirmBox" runat="server"></asp:TextBox>
            </div>
          </div>

          <asp:Button CssClass="login-button" ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
        </div>
      </div>

      <!--Footer-->
      <footer>
        <div class="footer-container">
          <div class="footer-nav">
            <a>Home</a>
            <a>About Us</a>
            <a>Course</a>
            <a>Assessment</a>
          </div>

          <div class="footer-contact">
            <h2>CONTACT US</h2>
            <p>Office Number: 05-2437596</p>
            <p>Company Email: enquiry@kohedemy.com</p>
            <p>Address: Block C, Lot 5A, Level 7, Jalan Bangsar South, 52100 Kuala Lumpur, Malaysia.</p>
          </div>
        </div>

        <h5>COPYRIGHT 2023 @ KOHEDEMY</h5>
      </footer>
    </form>
  </body>
</html>
