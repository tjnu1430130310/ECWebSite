<%@ Page Title="" Language="C#" MasterPageFile="Product.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Product_ProductDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">
    <style type="text/css">
        .row_group {
            display:inherit;
            padding:10px;
        }
        .image {
            float:right;
            margin:10px;
        }
        p {
            text-indent:2em;
            line-height:55px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ProductListContentPlaceHolder" Runat="Server">
    
    <div>
        <asp:FormView ID="ProductFormView" runat="server" DataSourceID="ProductFormViewSqlDataSource" DataKeyNames="ProductID">
            <ItemTemplate>
                <h1>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                </h1>
                <div class="image">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImgUrl") %>' />
                </div>
                <div class="row_group">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                </div>
                <div class="row_group">
                    <asp:Label runat="server" Text="目前库存量："></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("InStock") %>'></asp:Label>
                </div>
                <div>
                    <p></p>
                    <p><asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>'></asp:Label></p>
                    <p></p>
                </div>
                <div><a href='../ShoppingCart/ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>'>加入购物车</a></div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="ProductFormViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>"></asp:SqlDataSource>
    </div>


    <div>返回<a href="ProductList.aspx">商品</a></div>
    <asp:Label ID="MsgLabel" runat="server"></asp:Label>
</asp:Content>

