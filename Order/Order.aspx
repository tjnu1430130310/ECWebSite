<%@ Page Title="" Language="C#" MasterPageFile="../WebMainMaster.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebMainContentPlaceHolder" runat="Server">
    <div>
        <h1>VIP 信息</h1>
        <asp:SqlDataSource ID="MemberInfoFormViewSqlDataSource" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>"  UpdateCommand="UPDATE VIP_INFO SET Province=@Province, City=@City, Address=@Address, Postcode=@Postcode, Telephone=@Telephone WHERE VipID=@VipID" runat="server"></asp:SqlDataSource>
        <asp:FormView ID="MemberInfoFormView" runat="server" DataSourceID="MemberInfoFormViewSqlDataSource" DataKeyNames="VipID" OnItemUpdated="MemberInfoFormView_ItemUpdated">
            <ItemTemplate>
                <div>
                    <div>
                        <asp:Label runat="server" Text="VIP 编号："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipID")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="VIP 等级："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipRole")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="VIP 名："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipName")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="收货地址："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Province")%>'></asp:Label>
                        <asp:Label runat="server" Text="（省 / 行政区 / 直辖市）"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("City")%>'></asp:Label>
                        <asp:Label runat="server" Text="（市）"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Address")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="邮政编码"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Postcode")%>'></asp:Label>
                    </div>

                    <div>
                        <asp:Label ID="Label17" runat="server" Text="联系电话："></asp:Label>
                        <asp:Label ID="Label18" runat="server" Text='<% #Eval("Telephone")%>'></asp:Label>
                    </div>
                </div>
                <div>
                    <asp:LinkButton ID="EditButton" Text="编辑" CommandName="Edit" runat="server" />
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div>
                    <div>
                        <asp:Label runat="server" Text="VIP 编号："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipID")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="VIP 等级："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipRole")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="VIP 名："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("VipName")%>'></asp:Label>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="省（行政区 / 直辖市）："></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<% #Bind("Province") %>'></asp:TextBox>
                        <asp:Label  runat="server" Text="城市："></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<% #Bind("City") %>'></asp:TextBox>
                        <asp:Label runat="server" Text="地址："></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<% #Bind("Address") %>'></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="邮政编码"></asp:Label>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<% #Bind("Postcode") %>'></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="联系电话："></asp:Label>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<% #Bind("Telephone") %>'></asp:TextBox>
                    </div>
                </div>
                <div>
                    <asp:LinkButton ID="UpdateButton" Text="更新" CommandName="Update" runat="server" OnClientClick="return confirm(&quot;确认更新？&quot;);" />
                    &nbsp;
                        <asp:LinkButton ID="CancelUpdateButton" Text="取消" CommandName="Cancel" runat="server" />
                </div>
            </EditItemTemplate>
        </asp:FormView>
    </div>

    <div>
        <h2>商品清单</h2>

        <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="商品名称" />
                <asp:BoundField DataField="UnitPrice" HeaderText="单价" />
                <asp:BoundField DataField="Quantity" HeaderText="数量" />
                <asp:BoundField DataField="ItemTotal" HeaderText="小计" />
            </Columns>
        </asp:GridView>

    </div>

    <div>
        <asp:Button ID="OrderButton" runat="server" Text="提交订单"
            OnClick="OrderButton_Click" />
        <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        <asp:Label ID="ToPayLabel" runat="server" Text="正在跳转到浏览订单页面。。。" Visible="False"></asp:Label>
        <asp:LinkButton ID="ToCartLinkButton" runat="server" PostBackUrl="../ShoppingCart/ShoppingCart.aspx">返回修改购物车</asp:LinkButton>
    </div>
</asp:Content>

