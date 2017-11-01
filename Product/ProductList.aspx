<%@ Page Title="商城" Language="C#" MasterPageFile="Product.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="Product_ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProductListContentPlaceHolder" Runat="Server">
    
    <div><link rel="Stylesheet" type="text/css" href="../css/ProductList.css" />
        <asp:ListView ID="ProductListView" runat="server" DataSourceID="ProductListViewSqlDataSource">

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
                    <a href='ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'>
                        商品名称：<%# Eval("ProductName") %><br />
                        <asp:Image ID="ProductImage" runat="server" ImageUrl='<%# Eval("ProductImgUrl") %>' CssClass="productImg" /><br />
                        商品单价：<%# Eval("UnitPrice")  %>
                    </a>
                    <br />
                    <div>
                        <asp:LinkButton ID="ViewProductDetailsLinkButton" runat="server" CommandName="ViewProductDetails" CommandArgument='<%# Eval("ProductID")%>' OnClick="ViewDetailsLinkButton_Click">查看商品详情</asp:LinkButton>&nbsp;
                        <a href='../ShoppingCart/ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>'>加入购物车</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="ProductListViewSqlDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>"
            SelectCommand="SELECT * FROM [PRODUCT_INFO]"></asp:SqlDataSource>
    </div>
    <div class="clear"></div>
    <div class="datapager">
        <asp:DataPager ID="ProductListViewDataPager" runat="server" PagedControlID="ProductListView" PageSize="6">
            <Fields>
                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowLastPageButton="True" />
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>

