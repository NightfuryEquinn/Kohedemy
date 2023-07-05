<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Kohedemy.Pages.UserProfile" %>

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
    <title>Kohedemy - Profile</title>
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

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/five.jpg" />

        <h2 class="banner-quote">YOUR KOHEDEMY PROFILE</h2>
      </div>

      <!--Side by side Divider-->
      <div class="side-by-side-container">
        <div class="inner-side-by-side">
          <!--Divider-->
          <div class="divider">
            <h3>PROFILE</h3>

            <p>Your privacy is our priority</p>
          </div>

          <!--Content-->
          <div class="side-by-side-content">
            <div class="profile-container">
              <img class="profile-icon" src="../Assets/icons/id-card.png" />

              <p>John Doe</p>
            </div>

            <div class="profile-container">
              <img class="profile-icon" src="../Assets/icons/mail.png" />

              <p>johndoe@example.com</p>
            </div>

            <div class="profile-container">
              <img class="profile-icon" src="../Assets/icons/padlock.png" />

              <p>**********</p>
            </div>
          </div>
        </div>

        <div class="inner-side-by-side">
          <!--Divider-->
          <div class="divider">
            <h3>FUNCTIONS</h3>

            <p>Do as you wished</p>
          </div>

          <!--Content-->
          <div class="side-by-side-content">
            <div class="function-container">
              <img class="function-icon" src="../Assets/icons/edit.png" />

              <button class="function-button">
                <p>Edit</p>
              </button>
            </div>

            <div class="function-container">
              <img class="function-icon" src="../Assets/icons/online-learning.png" />

              <button class="function-button">
                <p>Your Courses</p>
              </button>
            </div>
          </div>
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
