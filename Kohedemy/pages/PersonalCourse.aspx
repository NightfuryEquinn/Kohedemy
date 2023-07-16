<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalCourse.aspx.cs" Inherits="Kohedemy.Pages.PersonalCourse" %>

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
    <title>Kohedemy - Personal Course</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <!--Navigation Bar-->
      <nav>
        <img id="nav-logo" src="../Assets/icons/kohedemy_logo.png" />

        <div class="nav-container">
          <a href="Home.aspx">Home</a>
          <a href="AboutUs.aspx">About Us</a> 
          <a href='CourseSelection.aspx'>Course</a>
          <a href="ContactUs.aspx">Contact Us</a>
          <% if (Session["Username"] as string != null) { %>
            <a href='UserProfile.aspx'>Profile</a>
          <% } else { %>
            <a href='Login.aspx'>Login</a>
          <% } %>
        </div>
      </nav>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/five.jpg" />

        <h2 class="banner-quote">ENROLLED COURSES</h2>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>ENROLLED</h3>

        <p>Time to brew some coffee yourself</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/vertical.jpg" />
          </div>

          <h4>Beginner’s Guide to First Coffee</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>The Best Way to Brew Espresso</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/tasty.jpg" />
          </div>

          <h4>Essence of A Cup of Latte</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Single Shot? Double Shot!</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>ASSESSMENT</h3>

        <p>Always be a student. Always be a coffee lover</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/closeup.jpg" />
          </div>

          <h4>First Coffee Assessment</h4>
          
          <p class="complete-error-message">Complete “Beginner’s Guide to First Coffee” First</p>
        </div>

        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/prepare.jpg" />
          </div>

          <h4>Milk Assessment for Beginner</h4>
          
          <img class="complete-icon" src="../Assets/icons/check.png" />
        </div>

        <div class="cards">
          <div class="card-image-container">
            <img class="card-image" src="../Assets/images/female.jpg" />
          </div>

          <h4>Knowledge for Coffee Bean</h4>
          
          <button class="card-button">
            <p>Take Exam</p>
          </button>
        </div>
      </div>

      <!--Footer-->
      <footer>
        <div class="footer-container">
          <div class="footer-nav">
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href='CourseSelection.aspx'>Course</a>
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