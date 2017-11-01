<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="UserControl_Search" %>

<style type="text/css">
.search {
    padding:25px 0;
}
.label {
    font-size:14px;
}
.textbox {
    width:100px;
    height:20px;
}
.button {
    padding:5px 10px;
}
</style>
<div class="search">
<asp:Label ID="SearchLabel" runat="server" Text="站内搜索：" CssClass="label"></asp:Label>
<asp:TextBox ID="SearchTextBox" runat="server" CssClass="textbox"></asp:TextBox>
<asp:Button ID="SearchButton" runat="server" Text="搜索" OnClick="SearchButton_Click" CssClass="button" />
</div>