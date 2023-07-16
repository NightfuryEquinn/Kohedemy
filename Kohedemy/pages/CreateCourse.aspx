<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCourse.aspx.cs" Inherits="Kohedemy.Pages.CreateCourse" %>

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
    <title>Kohedemy - Create / Edit Course</title>
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
        <img class="hero-banner" src="../Assets/images/businessman.jpg" />

        <h2 class="banner-quote">CREATING / EDITING COURSE</h2>
      </div>

      <!--Management Container-->
      <div class="management-container">
        <div class="single-management">
          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>TITLE</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="CourseTitle" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>DIFFICULTY</h3>
            </div>

            <asp:DropDownList CssClass="management-textbox" ID="CourseDifficulty" runat="server">
              <asp:ListItem Value="Beginner">Beginner</asp:ListItem>
              <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
              <asp:ListItem Value="Advanced">Advanced</asp:ListItem>
              <asp:ListItem Value="Masterclass">Masterclass</asp:ListItem>
            </asp:DropDownList>
          </div>

          <div class="single-wrapper management-thrid-col">
            <div class="divider">
              <h3>FEATURED IMAGE</h3>
            </div>
            
            <asp:FileUpload CssClass="management-file-upload" ID="FeaturedImage" runat="server" />
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>DESCRIPTION</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="CourseDescription" runat="server"></asp:TextBox>
          </div>

          <hr class="single-management-hr" />

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>EXCERPT 1</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Excerpt1" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>EXCERPT SUBHEADING 1</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="ExcerptSubheading1" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-thrid-col">
            <div class="divider">
              <h3>EXCERPT IMAGE</h3>
            </div>
            
            <asp:FileUpload CssClass="management-file-upload" ID="ExcerptImage1" runat="server" />
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>EXCERPT CONTENT 1</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="ExcerptContent1" runat="server"></asp:TextBox>
          </div>

          <hr class="single-management-hr" />

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>EXCERPT 2</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Excerpt2" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>EXCERPT SUBHEADING 2</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="ExcerptSubheading2" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-thrid-col">
            <div class="divider">
              <h3>EXCERPT IMAGE</h3>
            </div>
            
            <asp:FileUpload CssClass="management-file-upload" ID="ExcerptImage2" runat="server" />
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>EXCERPT CONTENT 2</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="ExcerptContent2" runat="server"></asp:TextBox>
          </div>

          <hr class="single-management-hr" />

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>EXCERPT 3</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Excerpt3" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>EXCERPT SUBHEADING 3</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="ExcerptSubheading3" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-thrid-col">
            <div class="divider">
              <h3>EXCERPT IMAGE</h3>
            </div>
            
            <asp:FileUpload CssClass="management-file-upload" ID="ExcerptImage3" runat="server" />
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>EXCERPT CONTENT 3</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="ExcerptContent3" runat="server"></asp:TextBox>
          </div>

          <hr class="single-management-hr" />

          <div class="single-wrapper management-first-col">
            <div class="divider">
              <h3>EXCERPT 4</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="Excerpt4" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-second-col">
            <div class="divider">
              <h3>EXCERPT SUBHEADING 4</h3>
            </div>

            <asp:TextBox CssClass="management-textbox" ID="ExcerptSubheading4" runat="server"></asp:TextBox>
          </div>

          <div class="single-wrapper management-thrid-col">
            <div class="divider">
              <h3>EXCERPT IMAGE</h3>
            </div>
            
            <asp:FileUpload CssClass="management-file-upload" ID="ExcerptImage4" runat="server" />
          </div>

          <div class="single-wrapper management-full-span">
            <div class="divider">
              <h3>EXCERPT CONTENT 4</h3>
            </div>

            <asp:TextBox TextMode="MultiLine" CssClass="management-textarea" ID="ExcerptContent4" runat="server"></asp:TextBox>
          </div>
        </div>

        <div class="cancel-save-container">
          <button class="cancel-save-button">
            <p>Cancel</p>
          </button>

          <asp:Button CssClass="cancel-save-button" ID="CourseSaveButton" runat="server" Text="Save" OnClick="CourseSaveButton_Click" />
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
