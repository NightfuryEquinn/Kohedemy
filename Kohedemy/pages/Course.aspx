<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Kohedemy.Pages.Course" %>

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
    <script src="../Javascript/main.js" defer></script>

    <!--Link to Google Font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Just+Another+Hand&family=Source+Sans+3:wght@200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <!--Link to Pictures file-->
    <link rel = "icon" type = "image/png" href = "../Assets/icons/kohedemy_logo.png" />

    <!--Title-->
    <title>Kohedemy - Course</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <!--Navigation Bar-->
      <nav>
        <img id="nav-logo" src="../Assets/icons/kohedemy_logo.png" />

        <div class="nav-container">
          <a href="Home.aspx">Home</a>
          <a href="AboutUs.aspx">About Us</a>
          <a href="CourseSelection.aspx">Course</a>
          <a href="ContactUs.aspx">Contact Us</a>
          <a href="UserProfile.aspx">Profile</a>
        </div>
      </nav>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/businessman.jpg" />

        <h2 class="banner-quote">
          <asp:Label ID="BannerQuote" runat="server" Text=""></asp:Label>
        </h2>
      </div>

      <asp:Repeater ID="CourseRepeater" runat="server">
        <ItemTemplate>
          <!--Divider-->
          <div class="divider">
            <h3><%# Eval("ExcerptTitle") %></h3>

            <p><%# Eval("ExcerptSubheading") %></p>
          </div>

          <!--Excerpt Content-->
          <div class="single-excerpt">
            <img class="excerpt-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("ExcerptImage")) %>" />

            <div class="excerpt-content">
              <p><%# Eval("ExcerptContent") %></p>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>

      <!--Footer-->
      <footer>
        <div class="footer-container">
          <div class="footer-nav">
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="CourseSelection.aspx">Course</a>
            <a href="PersonalCourse.aspx">Assessment</a>
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
