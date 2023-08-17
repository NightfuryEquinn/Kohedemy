<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Kohedemy.Pages.AboutUs" %>

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
    <title>Kohedemy - About Us</title>
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
        <img class="hero-banner" src="../Assets/images/breakfast.jpg" />

        <h2 class="banner-quote">WE BRING THE BEST FROM US TO YOU EXCLUSIVELY</h2>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>ABOUT US</h3>

        <p>Want to know more about how we start?</p>
      </div>

      <!--Left Content Banner-->
      <div class="image-content-container">
        <div class="image-container">
          <img class="left-image" src="../Assets/images/milk.jpg" />
        </div>

        <div class="content-container">
          <h2>Since 2021</h2>

          <p>At Kohedemy, we believe that crafting the perfect cup of coffee is an art form that deserves the utmost dedication and skill. Since our inception in 2021, we have been on a relentless journey to transform passionate coffee enthusiasts into true maestros of the bean, imparting the knowledge, techniques, and nuances that make every sip a symphony of flavor. At Kohedemy, we understand that true coffee craftsmanship encompasses more than just brewing methods.</p> 
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>OUR COURSES</h3>

        <p>We create the best course with well-known baristas across the world</p>
      </div>

      <!--Right Content Banner-->
      <div class="image-content-container">
        <div class="content-container">
          <h2>Rich. Flavorful . Just like coffee.</h2>

          <p>Every cup of coffee tells a story – a tale of carefully nurtured beans, expertly roasted, ground, and brewed to perfection. Just like coffee, Kohedemy embodies richness and flavor in every aspect of our academy. Kohedemy takes pride in its roster of seasoned coffee experts, each with a wealth of experience in the coffee industry. Our instructors not only possess deep knowledge but also an unquenchable passion for sharing the craft.</p>
        </div>

        <div class="image-container">
          <img class="right-image" src="../Assets/images/mockup.jpg" />
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>TESTIMONIALS</h3>

        <p>Still in doubt? Hear from our students</p>
      </div>

      <!--Testimonials-->
      <div class="test-card-container">
        <div class="test-card">
          <div class="test-image-container">
            <img class="test-image" src="../Assets/images/tender.jpg" />
          </div>

          <div class="test-card-content">
            <p>“Best courses I ever need” -- Kate Spade</p>
          </div>
        </div>

        <div class="test-card">
          <div class="test-image-container">
            <img class="test-image" src="../Assets/images/chest-up.jpg" />
          </div>

          <div class="test-card-content">
            <p>“Clean and simple” -- Johnny Walker</p>
          </div>
        </div>

        <div class="test-card">
          <div class="test-image-container">
            <img class="test-image" src="../Assets/images/fashionable.jpg" />
          </div>

          <div class="test-card-content">
            <p>“Haven’t register? Try it. You will love it” -- Tiger Woods</p>
          </div>
        </div>

        <div class="test-card">
          <div class="test-image-container">
            <img class="test-image" src="../Assets/images/young.jpg" />
          </div>

          <div class="test-card-content">
            <p>“Now I can be a barista if I wished to” -- Louis Smith</p>
          </div>
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
