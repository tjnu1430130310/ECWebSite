<%@ Page Title="" Language="C#" MasterPageFile="MemberMaster.master" AutoEventWireup="true" CodeFile="ViewOrder.aspx.cs" Inherits="Member_VIP_ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MemberMainContentPlaceHolder" Runat="Server">
    <div>
        <asp:SqlDataSource ID="OrderGridViewSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>">
            <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="OrderGridView" runat="server" DataSourceID="OrderGridViewSqlDataSource" DataKeyNames="OrderID" OnSelectedIndexChanged="OrderGridView_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <div>
        <asp:SqlDataSource ID="OrderDetailsListViewSqlDataSource" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" runat="server" SelectCommand="SELECT * FROM [ORDER],ORDER_DETAILS,PRODUCT_INFO where [ORDER].OrderID = @OrderID and [ORDER].OrderID=ORDER_DETAILS.OrderID AND PRODUCT_INFO.ProductID=ORDER_DETAILS.ProductID">
            <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="OrderDetailsListView" runat="server" DataSourceID="OrderDetailsListViewSqlDataSource" DataKeyNames="OrderID">
            <%-- 定义主配置 --%>
            <LayoutTemplate>
                <div runat="server">
                    <%-- 此处的内容将被定义在 GroupTemplate 模板中的内容所替换 --%>
                    <div runat="server" id="groupPlaceholder"></div>
                </div>
            </LayoutTemplate>

            <%-- 定义组配置 --%>
            <GroupTemplate>
                <div>
                    <%-- 此处的内容将被定义在 ItemTemplate 模板中的内容所替换 --%>
                    <div runat="server" id="itemPlaceholder"></div>
                </div>
            </GroupTemplate>

            <%-- 定义数据项配置 --%>
            <ItemTemplate>
                <div runat="server">
                    <div>
                        <a href='../../Product/ProductDetails.aspx?ProductID=<%# Eval("ProductID") %>'><%# Eval("ProductName") %></a>
                    </div>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="价格："></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="购买数量："></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="项目小计："></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ItemTotal") %>'></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

