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
    <script src="../Javascript/main.js" defer></script>

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
          <a href="Home.aspx">Home</a>
          <a href="AboutUs.aspx">About Us</a>
          <a href="CourseSelection.aspx">Course</a>
          <a href="ContactUs.aspx">Contact Us</a>
          <asp:LinkButton ID="LogOutButton" runat="server" OnClick="LogOutButton_Click">Log Out</asp:LinkButton>
        </div>
      </nav>

      <!--Edit Modal-->
      <div class="modal">
        <div class="edit-modal-wrap">
          <div class="editing-container">
            <div class="single-editing">
              <label>Email Address:</label>
              <asp:TextBox CssClass="textbox" ID="editEmail" runat="server"></asp:TextBox>
            </div>

            <div class="single-editing">
              <label>Username:</label>
              <asp:TextBox CssClass="textbox" ID="editUsername" runat="server"></asp:TextBox>
            </div>

            <div class="single-editing">
              <label>Password:</label>
              <asp:TextBox TextMode="Password" CssClass="textbox" ID="editPassword" runat="server"></asp:TextBox>
            </div>

            <div class="single-editing">
              <label>Confirm Password:</label>
              <asp:TextBox TextMode="Password" CssClass="textbox" ID="editConfirm" runat="server"></asp:TextBox>
            </div>

            <div class="cancel-save-container">
              <button id="cancel-button" class="cancel-save-button">
                <p>Cancel</p>
              </button>

              <asp:Button CssClass="cancel-save-button" ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
            </div>
          </div>
        </div>
      </div>

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

              <p><asp:Label ID="ProfileName" runat="server" Text=""></asp:Label></p>
            </div>

            <div class="profile-container">
              <img class="profile-icon" src="../Assets/icons/mail.png" />

              <p><asp:Label ID="ProfileEmail" runat="server" Text=""></asp:Label></p>
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

              <button onclick="return false" id="edit-button" class="function-button">
                <p>Edit</p>
              </button>
            </div>

            <div class="function-container">
              <img class="function-icon" src="../Assets/icons/online-learning.png" />

              <button onclick="document.location.href = './PersonalCourse.aspx'; return false" class="function-button">
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
