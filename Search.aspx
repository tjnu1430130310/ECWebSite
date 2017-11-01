<%@ Page Title="" Language="C#" MasterPageFile="~/WebMainMaster.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register Src="~/UserControl/Search.ascx" TagPrefix="uc1" TagName="Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebMainContentPlaceHolder" Runat="Server">
    <div>
        <asp:SqlDataSource ID="SearchProductSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" 
            SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE ([ProductName] LIKE '%' + @ProductName + '%') OR @ProductName='ALL'">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="ALL" Name="ProductName" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <uc1:Search runat="server" ID="SearchTextBox" />

        <asp:ListView ID="ProductListView" runat="server" DataSourceID="SearchProductSqlDataSource">
            <%-- 定义主配置 --%>
            <LayoutTemplate>
                <div runat="server" class="layoutbox">
                    <%-- 此处的内容将被定义在 GroupTemplate 模板中的内容所替换 --%>
                    <div runat="server" id="groupPlaceholder"></div>
                </div>
            </LayoutTemplate>
            
            <%-- 定义组配置 --%>
            <GroupTemplate>
                <div class="groupbox">
                    <%-- 此处的内容将被定义在 ItemTemplate 模板中的内容所替换 --%>
                    <div runat="server" id="itemPlaceholder"></div>
                </div>
            </GroupTemplate>
            
            <%-- 定义数据项配置 --%>
            <ItemTemplate>
                <div runat="server" class="productItem">
                    商品名称：<%# Eval("ProductName") %><br /><asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("ProductImgUrl") %>' CssClass="productImg" /><br />
                    商品单价：<%# Eval("UnitPrice")  %><br /><div>
                        <asp:LinkButton ID="ViewProductDetailsLinkButton" runat="server" CommandName="ViewProductDetails" CommandArgument='<%# Eval("ProductID")%>'>查看商品详情</asp:LinkButton>&nbsp;
                        <a href='../ShoppingCart/ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>'>加入购物车</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

