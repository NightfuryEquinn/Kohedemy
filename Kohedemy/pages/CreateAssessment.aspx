<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAssessment.aspx.cs" Inherits="Kohedemy.Pages.CreateAssessment" %>

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
    <title>Kohedemy - Create / Edit Assessment</title>
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
          <a href="UserProfile.aspx">Profile</a>
        </div>
      </nav>

      <!--Hero Banner-->
      <div class="hero-banner-container">
        <img class="hero-banner" src="../Assets/images/businessman.jpg" />

        <h2 class="banner-quote">CREATING / EDITING ASSESSMENT</h2>
      </div>

      <!--Assessment Container-->
      <div class="assessment-container">
        <div class="single-question">
          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 1</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question1" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question1A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question1B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question1C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question1D" runat="server"></asp:TextBox>
          </div>

          <hr class='single-management-hr' />

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 2</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question2" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question2A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question2B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question2C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question2D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 3</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question3" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question3A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question3B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question3C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question3D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 4</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question4" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question4A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question4B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question4C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question4D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 5</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question5" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question5A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question5B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question5C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question5D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 6</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question6" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question6A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question6B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question6C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question6D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 7</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question7" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question7A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question7B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question7C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question7D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 8</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question8" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question8A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question8B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question8C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question8D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 9</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question9" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question9A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question9B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question9C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question9D" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>QUESTION 10</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="Question10" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE A</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question10A" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE B</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question10B" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>CHOICE C</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question10C" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>CHOICE D</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Question10D" runat="server"></asp:TextBox>
          </div>
        </div>

        <div class="cancel-save-container">
          <button class="cancel-save-button">
            <p>Cancel</p>
          </button>

          <button class="cancel-save-button">
            <p>Save</p>
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
