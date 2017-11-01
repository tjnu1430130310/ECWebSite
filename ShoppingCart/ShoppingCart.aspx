<%@ Page Title="" Language="C#" MasterPageFile="../Member/MemberMaster.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart_ShoppingCart" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MemberMainContentPlaceHolder" Runat="Server">
    <asp:GridView ID="ShoppingCartGridView" runat="server" OnRowDataBound="ShoppingCartGridView_RowDataBound" OnRowEditing="ShoppingCartGridView_RowEditing" OnRowCancelingEdit="ShoppingCartGridView_RowCancelingEdit" OnRowUpdating="ShoppingCartGridView_RowUpdating" OnRowDeleting="ShoppingCartGridView_RowDeleting" AutoGenerateColumns="False" ShowFooter="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server">删除所选</asp:LinkButton>
                </FooterTemplate>
                <HeaderTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="全选" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="选择" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="产品编号">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="产品名称">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ProductID", "../Product/ProductDetails.aspx?ProductID={0}") %>' Text='<%# Eval("ProductName") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="单价">
                <ItemTemplate>
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="数量">
                <FooterTemplate>
                    <asp:Label ID="Label2" runat="server" Text="总计："></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="QuantityTextBox" runat="server" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" ontextchange="ItemTotalCalcular(this);" Text='<%# Bind("Quantity") %>' Width="50px" type="Number"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="项目合计">
                <ItemTemplate>
                    <asp:Label ID="ItemTotalLabel" runat="server" Text='<%# Bind("ItemTotal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑数量"></asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="移出购物车"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <p>您可以<a href="../Product/ProductList.aspx">继续浏览商品</a>或<a href="../Order/Order.aspx">结算</a></p>
</asp:Content>

