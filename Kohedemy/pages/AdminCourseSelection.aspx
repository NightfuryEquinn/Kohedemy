<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCourseSelection.aspx.cs" Inherits="Kohedemy.Pages.AdminCourseSelection" %>

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
    <title>Kohedemy - Course Management</title>
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
          <a href="AdminDashboard.aspx">Dashboard</a>
        </div>
      </nav>

      <!--Fixed Add Course Button-->
      <button onclick="document.location.href='./CreateCourse.aspx'; return false;" class="fixed-add-button">
        <div class="fixed-icon-container">
          <img class="fixed-icon" src="../Assets/icons/add.png" />
        </div>
      </button>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/barista.jpg" />

        <h2 class="banner-quote">COURSE MANAGEMENT</h2>
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

            <h3 class="modal-title">Beginner's Guide to First Coffee</h3>

            <p class="modal-difficulty">Difficulty: Beginner</p>

            <p class="modal-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      
            <div class="modal-button-container">
              <button class="modal-button">
                <p>Edit Course</p>
              </button>

              <button class="modal-button">
                <p>Edit Assessment</p>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>COFFEE</h3>

        <p>Learn the types of coffee</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/vertical.jpg" />
          </div>

          <h4>Beginner’s Guide to First Coffee</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>Free</p>
            </button>

            <div class="inner-edit-delete">
              <button onclick="return false" class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button onclick="return false" class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/vertical.jpg" />
          </div>

          <h4>The Best Way to Brew Espresso</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 130</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/vertical.jpg" />
          </div>

          <h4>Essence of A Cup of Latte</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 150</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/vertical.jpg" />
          </div>

          <h4>Single Shot? Double Shot!</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 110</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>MILK</h3>

        <p>Learn the types of milk</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Beginner’s Guide to Milk</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>Free</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Mix and Match, Coffee and Milk</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 45</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/pouring.jpg" />
          </div>

          <h4>Da Perfect Skimmed Milk</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 70</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>COFFEE BEANS</h3>

        <p>Learn the types of coffee beans</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>The Chosen Coffee Bean</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>Free</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>Knowing Arabica Beans</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 230</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/dark.jpg" />
          </div>

          <h4>Intensity, Bitterness, Sourness</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 280</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>
      </div>

      <!--Divider-->
      <div class="divider">
        <h3>BREWING METHODS</h3>

        <p>Learn how to brew your coffee the right way, with style</p>
      </div>

      <!--Flex Cards-->
      <div class="flex-card-container">
        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/tasty.jpg" />
          </div>

          <h4>Brew it Right, Drink it Nice</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>Free</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/tasty.jpg" />
          </div>

          <h4>Patience in Drip Coffee</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 80</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/tasty.jpg" />
          </div>

          <h4>Pressure and Steam</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 140</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
              </button>
            </div>
          </div>
        </div>

        <div class="cards">
          <div class="card-image-container">
              <img class="card-image" src="../Assets/images/tasty.jpg" />
          </div>

          <h4>Brew in Sand, Turkish Style</h4>
          
          <div class="edit-delete-container">
            <button class="card-button">
              <p>RM 60</p>
            </button>

            <div class="inner-edit-delete">
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/edit.png" />
              </button>
              <button class="inner-button">
                <img class="inner-image" src="../Assets/icons/delete.png" />
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
