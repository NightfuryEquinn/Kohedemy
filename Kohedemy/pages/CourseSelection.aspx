<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseSelection.aspx.cs" Inherits="Kohedemy.Pages.CourseSelection" %>

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
    <title>Kohedemy - Course Selection</title>
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
        <img class="hero-banner" src="../Assets/images/barista.jpg" />

        <h2 class="banner-quote">COURSE SELECTION</h2>
      </div>

      <!--Search Bar-->
      <div class="search-bar-container">
        <asp:TextBox CssClass="search-bar" ID="SearchBar" placeholder="Search..." runat="server"></asp:TextBox>
      </div>

      <!--Modal Popup-->
      <div class="modal">
        <div class="modal-wrap" data-id="">
          <img class="modal-image" src="../Assets/images/tasty.jpg" />

          <div class="modal-container">
            <img class="modal-icon" src="../Assets/icons/close.png" />

            <h3 class="modal-title"></h3>

            <p class="modal-difficulty"></p>

            <p class="modal-description"></p>
      
            <asp:Button CssClass="enroll-button" ID="EnrollButton" runat="server" Text="Enroll" OnClick="EnrollButton_Click" />
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>BEGINNER</h3>

        <p>Learn the basics of coffee</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <asp:Repeater ID="BeginnerRepeater" runat="server">
          <ItemTemplate>
            <div class="cards" data-id="<%# Eval("CourseId") %>" data-description="<%# Eval("CourseDescription") %>" data-difficulty="<%# Eval("CourseDifficulty") %>">
              <div class="card-image-container">
                <img class="card-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("CourseImage")) %>" />
              </div>

              <h4><%# Eval("CourseTitle") %></h4>
          
              <button onclick="return false" class="card-button">
                <p>More</p>
              </button>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>INTERMEDIATE</h3>

        <p>Learn more about coffee</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <asp:Repeater ID="IntermediateRepeater" runat="server">
          <ItemTemplate>
            <div class="cards" data-id="<%#Eval("CourseId") %>" data-description="<%# Eval("CourseDescription") %>" data-difficulty="<%# Eval("CourseDifficulty") %>">
              <div class="card-image-container">
                <img class="card-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("CourseImage")) %>" />
              </div>

              <h4><%# Eval("CourseTitle") %></h4>
          
              <button onclick="return false" class="card-button">
                <p>More</p>
              </button>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>Advanced</h3>

        <p>Start to be a pro in coffee</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <asp:Repeater ID="AdvancedRepeater" runat="server">
          <ItemTemplate>
            <div class="cards" data-id="<%#Eval("CourseId") %>" data-description="<%# Eval("CourseDescription") %>" data-difficulty="<%# Eval("CourseDifficulty") %>">
              <div class="card-image-container">
                <img class="card-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("CourseImage")) %>" />
              </div>

              <h4><%# Eval("CourseTitle") %></h4>
          
              <button onclick="return false" class="card-button">
                <p>More</p>
              </button>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>MASTERCLASS</h3>

        <p>Learn how to brew your coffee the master way, with style</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <asp:Repeater ID="MasterclassRepeater" runat="server">
          <ItemTemplate>
            <div class="cards" data-id="<%#Eval("CourseId") %>" data-description="<%# Eval("CourseDescription") %>" data-difficulty="<%# Eval("CourseDifficulty") %>">
              <div class="card-image-container">
                <img class="card-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("CourseImage")) %>" />
              </div>

              <h4><%# Eval("CourseTitle") %></h4>
          
              <button onclick="return false" class="card-button">
                <p>More</p>
              </button>
            </div>
          </ItemTemplate>
        </asp:Repeater>
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
