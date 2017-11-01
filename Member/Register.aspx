<%@ Page Title="" Language="C#" MasterPageFile="../WebMainMaster.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Member_VIP_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../css/sign.css" />
    <style type="text/css">
        .SignInMain {
            width:360px;
        }
    </style>
</asp:Content>
<asp:Content ID="RegisterContent" ContentPlaceHolderID="WebMainContentPlaceHolder" Runat="Server">
    <div class="SignInMain">
    <h1>账号注册</h1>
    <div>
        <div class="Label">
            <asp:Label ID="VIPNameLabel" runat="server" Text="输入账号："></asp:Label>
            <asp:TextBox ID="VIPNameTextBox" runat="server" placeholder="Enter Your Name" CssClass="TextBox"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="VIPNameRequiredFieldValidator" runat="server" ErrorMessage="您的用户名为空，请填写用户名！" ControlToValidate="VIPNameTextBox" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="VIPNameCustomValidator" runat="server" ErrorMessage="该用户名已被注册，请重新输入！" ControlToValidate="VIPNameTextBox" Display="Dynamic" OnServerValidate="VIPNameCustomValidator_ServerValidate"></asp:CustomValidator>
        </div>
        <div class="Label">
            <asp:Label ID="PasswordLabel" runat="server" Text="输入密码："></asp:Label>
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Enter The Password" CssClass="TextBox"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="您的密码为空，请输入密码！" Display="Dynamic" ControlToValidate="PasswordTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Label">
            <asp:Label ID="Password2Label" runat="server" Text="确认密码："></asp:Label>
            <asp:TextBox ID="Password2TextBox" runat="server" TextMode="Password"  placeholder="Enter Password Again" CssClass="TextBox"></asp:TextBox><br />
            <asp:CompareValidator ID="Password2CompareValidator" runat="server" ErrorMessage="密码不一致，请重新设置密码！" ControlToValidate="Password2TextBox" ControlToCompare="PasswordTextBox" Display="Dynamic"></asp:CompareValidator>
        </div>
        <div class="Label">
            <asp:Label ID="EmailLabel" runat="server" Text="电子邮箱："></asp:Label>
            <asp:TextBox ID="EmailTextBox" runat="server" placeholder="Enter Your Email" CssClass="TextBox"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="您的电子邮箱为空，请填写邮箱地址！" Display="Dynamic" ControlToValidate="EmailTextBox" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ErrorMessage="邮箱地址不正确，请填写正确的邮箱地址！" Display="Dynamic" ControlToValidate="EmailTextBox" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <div class="Label">
            <asp:Button ID="RegisterButton" runat="server" Text="注册" OnClick="RegisterButton_Click" CssClass="Button" />
            <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        </div>

        <div><p>已经有账号了？快去<a href="Login.aspx">登录</a></p></div>
    </div>

    </div>
</asp:Content>

