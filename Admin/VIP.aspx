<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="VIP.aspx.cs" Inherits="Admin_VIP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:SqlDataSource ID="VipGridViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" SelectCommand="select * from VIP_INFO">
            <SelectParameters>
                <asp:Parameter Name="VipID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="VipGridView" runat="server" DataSourceID="VipGridViewSqlDataSource" DataKeyNames="VipID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <div>
        
    </div>
</asp:Content>

