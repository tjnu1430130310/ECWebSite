<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Member.aspx.cs" Inherits="Admin_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .MemberFV {
            width: 100%;
            margin: 20px 0px;
        }

        .MemberImg {
            float: right;
            width: 120px;
            height: 180px;
            margin: 0px 20px 0px 0px;
        }

        .label_row_1 {
            width: 200px;
            display: inherit;
        }

        .Label {
            margin: 20px 0px;
        }
        .TextBox {
            height: 30px;
            padding:2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h1>管理员中心</h1>
        <p>当前用户<asp:Label ID="MemberNameLabel" runat="server"></asp:Label>，您好！您可以在这里察看并完善信息。</p>

        <div>
            <asp:FormView ID="MemberFormView" runat="server" DataSourceID="MemberFormViewSqlDataSource" DataKeyNames="AdminID" OnItemUpdating="MemberFormView_ItemUpdating" CssClass="MemberFV">
                <ItemTemplate>
                    <div>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<% #Eval("ImageUrl")%>' CssClass="MemberImg" />
                    </div>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="VIP 编号："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminID")%>'></asp:Label>
                    </div>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="VIP 等级："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminRole")%>'></asp:Label>
                    </div>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="用户名："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminName")%>'></asp:Label>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="电子邮箱："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Email")%>'></asp:Label>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="收货地址："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Province")%>'></asp:Label>
                        <asp:Label runat="server" Text="（省 / 行政区 / 直辖市）"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("City")%>'></asp:Label>
                        <asp:Label runat="server" Text="（市）"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Address")%>'></asp:Label>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="邮政编码"></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Postcode")%>'></asp:Label>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="联系电话："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("Telephone")%>'></asp:Label>
                    </div>

                    <%--<div>
                        <asp:Label runat="server" Text=""></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("") %>'></asp:Label>
                    </div>--%>
                    <div class="Label">
                        <asp:LinkButton ID="EditButton" Text="编辑" CommandName="Edit" runat="server" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="VIP 编号："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminID")%>'></asp:Label>
                    </div>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="VIP 等级："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminRole")%>'></asp:Label>
                    </div>
                    <div class="label_row_1">
                        <asp:Label runat="server" Text="VIP 名："></asp:Label>
                        <asp:Label runat="server" Text='<% #Eval("AdminName")%>'></asp:Label>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="电子邮箱："></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<% #Bind("Email")%>' CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="省（行政区 / 直辖市）："></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<% #Bind("Province")%>' CssClass="TextBox"  Width="50px"></asp:TextBox>
                        <asp:Label runat="server" Text="城市："></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<% #Bind("City")%>' CssClass="TextBox" Width="50px"></asp:TextBox>
                        <asp:Label runat="server" Text="地址："></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<% #Bind("Address")%>' CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="邮政编码"></asp:Label>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<% #Bind("Postcode")%>' CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="联系电话："></asp:Label>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<% #Bind("Telephone")%>' CssClass="TextBox"></asp:TextBox>
                    </div>
                    <div class="Label">
                        <asp:Label runat="server" Text="照片："></asp:Label>
                        <asp:Label ID="MemberFormViewImgLabel" runat="server" Text='<% #Bind("ImageUrl")%>'></asp:Label>
                        <asp:FileUpload ID="MemberFormViewEditImgFileUpload" runat="server" />
                    </div>
                    <div class="Label">
                        <asp:LinkButton ID="UpdateButton" Text="更改" CommandName="Update" runat="server" OnClientClick="return confirm(&quot;确认更新？&quot;);" />
                        &nbsp;
                        <asp:LinkButton ID="CancelUpdateButton" Text="取消" CommandName="Cancel" runat="server" />
                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </div>

        <asp:SqlDataSource ID="MemberFormViewSqlDataSource" UpdateCommand="UPDATE ADMIN_INFO SET Email=@Email, Province=@Province, City=@City, Address=@Address, Postcode=@Postcode, Telephone=@Telephone, ImageUrl=@ImageUrl WHERE AdminID=@AdminID" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>

