﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Kohedemy.Pages.Testing" %>

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
    <title>Kohedemy - Home</title>
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
        <img class="hero-banner" src="../Assets/images/bean.jpg" />

        <h2 class="banner-quote">THE BEST WEBSITE TO ENHANCE COFFEE BREWING SKILL</h2>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>NEW TO COFFEE BREWING?</h3>

        <p>Try out these beginner courses! They are free!</p>
      </div>

      <!--Cards-->
      <div class="card-container">
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
             <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Beginner’s Guide to Milk</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>The Chosen Coffee Bean</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>
      </div>

      <!--Hero Banner with Button-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/hot.jpg" />

        <div class="in-hero-banner">
          <div class="in-wrapper">
            <h2 class="banner-quote">SOME BARISTA GET TOGETHER WISH TO SPREAD THE LOVE FOR COFFEE</h2>
          
            <button class="banner-button">
              <p>Learn More About Us</p>
            </button>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>READY TO BREW SOME COFFEE?</h3>

        <p>Complete our test for coffee brewing knowledge and secure an official certification.</p>
      </div>

      <!--Cards-->
      <div class="card-container">
        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/closeup.jpg" />
          </div>

          <h4>First Coffee Assessment</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/prepare.jpg" />
          </div>

          <h4>Milk Assessment for Beginner</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/female.jpg" />
          </div>

          <h4>Knowledge for Coffee Bean</h4>
          
          <button class="card-button">
            <p>Get Started</p>
          </button>
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