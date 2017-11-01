<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/sign.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="SignMain">
    <h1>管理员登录</h1>
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
    </div>
    </form>
</body>
</html>
