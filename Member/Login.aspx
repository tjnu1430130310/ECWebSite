<%@ Page Title="" Language="C#" MasterPageFile="../WebMainMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Member_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../css/sign.css" />
</asp:Content>
<asp:Content ID="LoginContent" ContentPlaceHolderID="WebMainContentPlaceHolder" Runat="Server">
    <div class="SignMain">
    <h1>VIP 会员登录</h1>
    <div>
        <div class="Label">
            <asp:Label ID="MemberNameLabel" runat="server" Text="账号："></asp:Label>
            <asp:TextBox ID="MemberNameTextBox" runat="server" placeholder="Member Name"  CssClass="TextBox"></asp:TextBox>
        </div>
        <div class="Label">
            <asp:Label ID="PasswordLabel" runat="server" Text="密码："></asp:Label>
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Password"  CssClass="TextBox"></asp:TextBox>
        </div>
        <div class="Label">
            <asp:CheckBox ID="RememberCheckBox" runat="server" Text="记住我" Checked="false" />
            <asp:Button ID="LoginButton" runat="server" Text="登录" OnClick="LoginButton_Click" CssClass="Button" /><br />
            <asp:Label ID="MsgLabel" runat="server" ForeColor="Red" Text="您输入的用户名或密码错误，请重新输入！" Visible="false"></asp:Label>
        </div>
    </div>

    <div class="LoginLabel"><p>还没有账号？快去<a href="Register.aspx">注册账号</a></p></div>

    </div>
</asp:Content>

