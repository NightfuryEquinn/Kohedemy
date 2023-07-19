<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="CourseAssessment.aspx.cs" Inherits="Kohedemy.Pages.CourseAssessment" %>

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
    <title>Kohedemy - Course Assessment</title>
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
        <img class="hero-banner" src="../Assets/images/five.jpg" />

        <h2 class="banner-quote">FOCUS IS THE KEY TO A DIVINE COFFEE</h2>
      </div>

      <!--MCQ Template-->
      <asp:Repeater ID="MCQRepeater" runat="server" EnableViewState="true">
        <ItemTemplate>
          <div class="mcq-container">
            <div class="single-mcq">
              <h6 class="question-divider">QUESTION <%# Eval("QuestionNumber") %></h6>

              <div class="question-container">
                <p><%# Eval("Question") %></p>

                <div class="question-selection">
                  <asp:RadioButton AutoPostBack="true" EnableViewState="true" GroupName='<%# Eval("QuestionID") %>' CssClass="radio-button" ID="ChoiceA" Text='<%# Eval("ChoiceA") %>' runat="server" />
                  <asp:RadioButton AutoPostBack="true" EnableViewState="true" GroupName='<%# Eval("QuestionID") %>' CssClass="radio-button" ID="ChoiceB" Text='<%# Eval("ChoiceB") %>' runat="server" />
                  <asp:RadioButton AutoPostBack="true" EnableViewState="true" GroupName='<%# Eval("QuestionID") %>' CssClass="radio-button" ID="ChoiceC" Text='<%# Eval("ChoiceC") %>' runat="server" />
                  <asp:RadioButton AutoPostBack="true" EnableViewState="true" GroupName='<%# Eval("QuestionID") %>' CssClass="radio-button" ID="ChoiceD" Text='<%# Eval("ChoiceD") %>' runat="server" />
                </div>
              </div>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
      

      <div class="assessment-container">
        <div class="cancel-save-container">
          <asp:Button CssClass="cancel-save-button" ID="FinishAssessmentButton" runat="server" Text="Submit Assessment" OnClick="FinishAssessmentButton_Click" />
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
