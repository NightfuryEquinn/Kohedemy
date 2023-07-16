<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Kohedemy.Pages.ContactUs" %>

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
    <title>Kohedemy - Contact Us</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <!--Navigation Bar-->
      <nav>
        <img id="nav-logo" src="../Assets/icons/kohedemy_logo.png" />

        <div class="nav-container">
          <a href="Home.aspx">Home</a>
          <a href="AboutUs.aspx">About Us</a>
          <% if (Session["Username"] as string != "Kohemin") { %>
            <a href='CourseSelection.aspx'>Course</a>
          <% } else { %>
            <a href='AdminCourseSelection.aspx'>Course</a>
          <% } %>
          <a href="ContactUs.aspx">Contact Us</a>
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <a href='UserProfile.aspx'>Profile</a>
            <% } else { %>
              <a href='AdminDashboard.aspx'>Dashboard</a>
            <% } %>
          <% } else { %>
            <a href='Login.aspx'>Login</a>
          <% } %>
        </div>
      </nav>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/latte.jpg" />

        <h2 class="banner-quote">HAVE SOME QUESTIONS? FEEL FREE TO DROP US A MESSAGE</h2>
      </div>
    
      <!--Divider-->
      <div class="divider">
        <h3>CONTACT US</h3>

        <p>We will respond as soon as possible</p>
      </div>

      <!--Contact Container-->
      <div class="contact-container">
        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/phone-call.png" />
          </div>

          <p>05-2437596</p>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/mail.png" />
          </div>

          <p>enquiry@kohedemy.com</p>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/location.png" />
          </div>

          <p>Block C, Lot 5A, Level 7, Jalan Bangsar South, 52100 Kuala Lumpur, Malaysia.</p>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/linkedin.png" />
          </div>

          <a href="https://www.linkedin.com/">Kohedemy Inc.</a>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/facebook.png" />
          </div>

          <a href="https://www.facebook.com/">Kohedemy</a>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/twitter.png" />
          </div>

          <a href="https://twitter.com/">kohedemy_2021</a>
        </div>

        <div class="single-contact">
          <div class="contact-icon">
            <img class="icon" src="../Assets/icons/instagram.png" />
          </div>

          <a href="https://www.instagram.com/">kohedemy_2021</a>
        </div>
      </div>

      <!--Footer-->
        <footer>
          <div class="footer-container">
            <div class="footer-nav">
              <a href="Home.aspx">Home</a>
              <a href="AboutUs.aspx">About Us</a>
              <% if (Session["Username"] as string != "Kohemin") { %>
                <a href='CourseSelection.aspx'>Course</a>
              <% } else { %>
                <a href='AdminCourseSelection.aspx'>Course</a>
              <% } %>
              <% if (Session["Username"] as string != "Kohemin") { %>
                <a href="PersonalCourse.aspx">Assessment</a>
              <% } else { %>
                <a href='AdminDashboard.aspx'>Report</a>
              <% } %>
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
