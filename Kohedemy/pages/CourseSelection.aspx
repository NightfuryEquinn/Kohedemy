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
        <a href="CourseSelection.aspx">Course</a>
        <a href="ContactUs.aspx">Contact Us</a>
        <% if (Session["Username"] as String != null) { %>
          <a href='UserProfile.aspx'>Profile</a>
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
      <div class="modal-wrap">
        <img class="modal-image" src="../Assets/images/tasty.jpg" />

        <div class="modal-container">
          <img class="modal-icon" src="../Assets/icons/close.png" />

          <h3 class="modal-title">Lorem ipsum dolor sit amet</h3>

          <p class="modal-difficulty">Lorem ipsum dolor sit amet</p>

          <p class="modal-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      
          <button class="enroll-button">
            <p>Enroll</p>
          </button>
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
          <div class="cards" data-id="<%#Eval("CourseId") %>" data-description="<%# Eval("CourseDescription") %>" data-difficulty="<%# Eval("CourseDifficulty") %>">
            <div class="card-image-container">
              <img class="card-image" src="data:image/jpeg;base64,<%# Convert.ToBase64String((byte[])Eval("CourseImage")) %>" />
            </div>

            <h4><%# Eval("CourseTitle") %></h4>
          
            <button onclick="return false" class="card-button">
              <p>Enroll</p>
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
      <div class="cards">
        <div class="card-image-container">
          <img class="card-image" src="../Assets/images/pouring.jpg" />
        </div>

        <h4>Beginner’s Guide to Milk</h4>
          
        <button onclick="return false" class="card-button">
          <p>Free</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/pouring.jpg" />
        </div>

        <h4>Mix and Match, Coffee and Milk</h4>
          
        <button class="card-button">
          <p>RM 45</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/pouring.jpg" />
        </div>

        <h4>Da Perfect Skimmed Milk</h4>
          
        <button class="card-button">
          <p>RM 70</p>
        </button>
      </div>
    </div>

    <!--Divider-->
    <div class="divider">
      <h3>Advanced</h3>

      <p>Start to be a pro in coffee</p>
    </div>

    <!--Flex Cards-->
    <div class="flex-card-container">
      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/dark.jpg" />
        </div>

        <h4>The Chosen Coffee Bean</h4>
          
        <button class="card-button">
          <p>Free</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/dark.jpg" />
        </div>

        <h4>Knowing Arabica Beans</h4>
          
        <button class="card-button">
          <p>RM 230</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/dark.jpg" />
        </div>

        <h4>Intensity, Bitterness, Sourness</h4>
          
        <button class="card-button">
          <p>RM 280</p>
        </button>
      </div>
    </div>

    <!--Divider-->
    <div class="divider">
      <h3>MASTERCLASS</h3>

      <p>Learn how to brew your coffee the master way, with style</p>
    </div>

    <!--Flex Cards-->
    <div class="flex-card-container">
      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/tasty.jpg" />
        </div>

        <h4>Brew it Right, Drink it Nice</h4>
          
        <button class="card-button">
          <p>Free</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/tasty.jpg" />
        </div>

        <h4>Patience in Drip Coffee</h4>
          
        <button class="card-button">
          <p>RM 80</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/tasty.jpg" />
        </div>

        <h4>Pressure and Steam</h4>
          
        <button class="card-button">
          <p>RM 140</p>
        </button>
      </div>

      <div class="cards">
        <div class="card-image-container">
            <img class="card-image" src="../Assets/images/tasty.jpg" />
        </div>

        <h4>Brew in Sand, Turkish Style</h4>
          
        <button class="card-button">
          <p>RM 60</p>
        </button>
      </div>
    </div>

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
