<%@ Page Title="" Language="C#" MasterPageFile="MemberMaster.master" AutoEventWireup="true" CodeFile="EditPassword.aspx.cs" Inherits="Member_EditPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MemberMainContentPlaceHolder" Runat="Server">

    <link rel="Stylesheet" type="text/css" href="../css/sign.css" />
    <style type="text/css">
    </style>
    <div>
        <h1>更改密码</h1>
        <div class="Label">
            <asp:Label ID="Label1" runat="server" Text="旧密码："></asp:Label>
            <asp:TextBox ID="OldPasswordTextBox" runat="server" TextMode="Password" CssClass="TextBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="OldPasswordTextBoxRequiredFieldValidator" runat="server" ErrorMessage="必填项目，请填写。" ControlToValidate="OldPasswordTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="Label">
            <asp:Label ID="Label2" runat="server" Text="新密码："></asp:Label>
            <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" CssClass="TextBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="NewPasswordTextBoxRequiredFieldValidator" runat="server" ErrorMessage="必填项目，请填写。" ControlToValidate="NewPasswordTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="Label">
            <asp:Label ID="Label3" runat="server" Text="确认新密码："></asp:Label>
            <asp:TextBox ID="NewPassword2TextBox" runat="server" TextMode="Password" CssClass="TextBox"></asp:TextBox>
            <asp:CompareValidator ID="NewPassword2TextBoxCompareValidator" runat="server" ErrorMessage="与新的密码不一致，请重新设置密码。" ControlToValidate="NewPassword2TextBox" ControlToCompare="NewPasswordTextBox" Display="Dynamic"></asp:CompareValidator>
        </div>
        <div>
            <asp:Button ID="EditPasswordButton" runat="server" Text="修改密码" OnClick="EditPasswordButton_Click" CssClass="Button" />
        </div>
        <div class="Label">
            <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

