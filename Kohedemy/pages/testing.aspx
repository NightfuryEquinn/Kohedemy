<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="Kohedemy.pages.testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Simple Calculator</title>
    <style type="text/css">
      .auto-style1 {
        width: 204px;
        padding: 5px;
      }

      .error {
        padding: 5px;
      }
    </style>
  </head>

  <body>
    <form style="margin: 0; padding: 0" id="form1" runat="server">
      <h1
        style="
          text-align: center;
        "  
      >
        Simple Calculator
      </h1>
      <p
        style="
          text-align: center;
        "
      >
        Just a typically mundane calculator
      </p>

      <table style="width:100%;">
        <tr>  
          <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="First Number:"></asp:Label>
          </td>
          <td style="display: flex; flex-direction: row; gap: 20px;">
            <asp:TextBox ID="FirstNum" runat="server" CssClass="error"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="error" BackColor="#FF5050" ErrorMessage="Only integer!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="FirstNum"></asp:CompareValidator>
          </td>
        </tr>
        <tr>
          <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Second Number:"></asp:Label>
          </td>
          <td style="display: flex; flex-direction: row; gap: 20px;">
            <asp:TextBox ID="SecondNum" runat="server" CssClass="error"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="error" BackColor="#FF5050" ErrorMessage="Only integer!" Operator="DataTypeCheck" Type="Integer" ControlToValidate="SecondNum"></asp:CompareValidator>
          </td>
        </tr>
      </table>

      <div style="margin: 20px; display: flex; flex-direction: row; gap: 20px;">
        <asp:Button ID="AddBtn" runat="server" Text="Addition" OnClick="AddBtn_Click" />
        <asp:Button ID="SubBtn" runat="server" Text="Subtraction" OnClick="SubBtn_Click" />
        <asp:Button ID="MulBtn" runat="server" Text="Multiplication" OnClick="MulBtn_Click" />
        <asp:Button ID="DivBtn" runat="server" Text="Division" OnClick="DivBtn_Click" />
      </div>

      <div style="margin: 20px;">
        <asp:Label ID="answerLabel" runat="server" Text="Label"></asp:Label>
      </div>

    </form>
  </body>
</html>
