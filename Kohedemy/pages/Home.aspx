<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Kohedemy.Pages.Testing" %>

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
    <title>Kohedemy - Home</title>
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
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './CourseSelection.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Beginner’s Guide to Milk</h4>
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './CourseSelection.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>The Chosen Coffee Bean</h4>
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './CourseSelection.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
        </div>
      </div>

      <!--Hero Banner with Button-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/hot.jpg" />

        <div class="in-hero-banner">
          <div class="in-wrapper">
            <h2 class="banner-quote">SOME BARISTA GET TOGETHER WISH TO SPREAD THE LOVE FOR COFFEE</h2>
          
            <button onclick="document.location.href = './AboutUs.aspx'; return false" class="banner-button">
              <p>Learn More About Us</p>
            </button>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>READY TO BREW SOME COFFEE?</h3>

        <p>Deemed yourself as a veteran in barista? Try our Masterclass courses.</p>
      </div>

      <!--Cards-->
      <div class="card-container">
        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/closeup.jpg" />
          </div>

          <h4>The Ultimate Coffee Course</h4>
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './PersonalCourse.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/prepare.jpg" />
          </div>

          <h4>Golden Thumb Rule Of Milk</h4>
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './PersonalCourse.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
        </div>

        <div class="cards">
          <div class="card-image-container">
             <img class="card-image" src="../Assets/images/female.jpg" />
          </div>

          <h4>Fine-Grounded Coffee. Fresh</h4>
          
          <% if (Session["Username"] as string != null) { %>
            <% if (Session["Username"] as string != "Kohemin") { %>
              <button onclick="document.location.href = './PersonalCourse.aspx'; return false" class="card-button">
                <p>Enroll</p>
              </button>
            <% } else { %>
              <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="card-button">
                <p>Preview</p>
              </button>
            <% } %>
          <% } else { %>
            <button onclick="document.location.href = './Login.aspx'; return false" class="card-button">
              <p>Enroll</p>
            </button>
          <% } %>
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
