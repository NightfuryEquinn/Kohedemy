<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Kohedemy.Pages.AdminDashboard" %>

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
    <title>Kohedemy - Admin Dashboard</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <!--Navigation Bar-->
      <nav>
        <img id="nav-logo" src="../Assets/icons/kohedemy_logo.png" />

        <div class="nav-container">
          <a href="Home.aspx">Home</a>
          <a href="AboutUs.aspx">About Us</a>
          <a href="AdminCourseSelection.aspx">Course</a>
          <a href="ContactUs.aspx">Contact Us</a>
          <a href="AdminDashboard.aspx">Dashboard</a>
        </div>
      </nav>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/five.jpg" />

        <h2 class="banner-quote">ADMIN DASHBOARD</h2>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>FUNCTIONS</h3>

        <p>Do as you wished</p>
      </div>

      <!--Admin Function-->
      <div class="admin-function-container">
        <div class="single-admin-container">
          <img class="admin-icon" src="../Assets/icons/edit.png" />

          <button onclick="document.location.href = './AdminCourseSelection.aspx'; return false" class="function-button">
            <p>Edit Course</p>
          </button>
        </div>

        <div class="single-admin-container">
          <img class="admin-icon" src="../Assets/icons/online-learning.png" />

          <button onclick="document.location.href = './CreateCourse.aspx'; return false" class="function-button">
            <p>Add New Course</p>
          </button>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>DATA ANALYTICS</h3>

        <p>Observe and evaluate the whole website</p>
      </div>

      <!--Data Analytics-->
      <div class="data-container">
        <div class="data-graph-container">
          <h3>TOTAL BARISTA TRAINEE TO DATE</h3>
          <p><asp:Label ID="TotalTrainee" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="data-graph-container">
          <h3>TOTAL COURSE AVAILABLE</h3>
          <p>Beginner: <asp:Label ID="TotalBegin" runat="server" Text=""></asp:Label></p>
          <p>Intermediate: <asp:Label ID="TotalInter" runat="server" Text=""></asp:Label></p>
          <p>Advanced: <asp:Label ID="TotalAdv" runat="server" Text=""></asp:Label></p>
          <p>Masterclass: <asp:Label ID="TotalMaster" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="data-graph-container">
          <h3>MOST POPULAR COURSE</h3>
          <p><asp:Label ID="MostPopular" runat="server" Text=""></asp:Label></p>          
        </div>

        <div class="data-graph-container">
          <h3>NUMBER OF TRAINEE ENROLLED COURSES</h3>
          <p><asp:Label ID="TotalEnrolled" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="data-graph-container">
          <h3>NUMBER OF TRAINEE COMPLETED COURSES</h3>
          <p><asp:Label ID="TotalCompleted" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="data-graph-container">
          <h3>NUMBER OF TRAINEE COMPLETED ASSESSMENT</h3>
          <p><asp:Label ID="TotalAssessed" runat="server" Text=""></asp:Label></p>
        </div>

        <div class="data-graph-container">
          <h3>COURSE PENDING ASSESSMENT</h3>
          <asp:Repeater ID="PendingAssessments" runat="server" OnItemDataBound="PendingAssessments_ItemDataBound">
            <ItemTemplate>
              <p><asp:Label ID="PendingAssessment" runat="server" Text=""></asp:Label></p>
            </ItemTemplate>
          </asp:Repeater>
          <p><asp:Label ID="NoPendingAssessment" runat="server" Text="All courses have assessment included."></asp:Label></p>
        </div>
      </div>

      <!--Footer-->
      <footer>
        <div class="footer-container">
          <div class="footer-nav">
            <a href="Home.aspx">Home</a>
            <a href="AboutUs.aspx">About Us</a>
            <a href="AdminCourseSelection.aspx">Course</a>
            <a href="AdminDashboard.aspx">Report</a>
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
