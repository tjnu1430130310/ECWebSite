<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ProductManager.aspx.cs" Inherits="Product_ProductManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div><h3>商品管理</h3>
    <div>
        <asp:SqlDataSource ID="SearchProductSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" 
            DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" 
            SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE ([ProductName] LIKE '%' + @ProductName + '%') OR @ProductName='ALL'">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchTextBox" DefaultValue="ALL" Name="ProductName" PropertyName="Text" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:Label ID="SearchLabel" runat="server" Text="检索内容："></asp:Label>
        <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
        <asp:Button ID="SearchButton" runat="server" Text="检索" />
    </div>
    <div class="leftDivCss">
        <asp:SqlDataSource ID="ProductGridViewSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" 
            DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" 
            SelectCommand="SELECT * FROM [PRODUCT_INFO]">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductBrand" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ProduceArea" Type="String" />
                <asp:Parameter Name="ProductType" Type="String" />
                <asp:Parameter Name="ProductSize" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="IssueDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ProductImgUrl" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter Name="Evaluation" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductBrand" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ProduceArea" Type="String" />
                <asp:Parameter Name="ProductType" Type="String" />
                <asp:Parameter Name="ProductSize" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="IssueDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ProductImgUrl" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter Name="Evaluation" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="ProductGridView" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID" 
            DataSourceID="SearchProductSqlDataSource" 
            onselectedindexchanged="ProductGridView_SelectedIndexChanged" PageSize="8">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="商品编号" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="商品名称" 
                    SortExpression="ProductName" />
                <asp:BoundField DataField="InStock" HeaderText="商品库存" 
                    SortExpression="InStock" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" Text="选择"></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="删除" 
                            onclientclick="return confirm(&quot;确认删除？&quot;);"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="rightDivCss"><h4>商品详情管理页面</h4>
        <asp:SqlDataSource ID="ProductDetailsViewSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" 
            DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" 
            InsertCommand="INSERT INTO [PRODUCT_INFO] ([ProductBrand], [ProductName], [Manufacturer], [ProduceArea], [ProductType], [ProductSize], [UnitPrice], [Discount], [InStock], [IssueDate], [Description], [ProductImgUrl], [ClassID], [Evaluation]) VALUES (@ProductBrand, @ProductName, @Manufacturer, @ProduceArea, @ProductType, @ProductSize, @UnitPrice, @Discount, @InStock, @IssueDate, @Description, @ProductImgUrl, @ClassID, @Evaluation); select @ProductID = SCOPE_IDENTITY()" 
            SelectCommand="SELECT * FROM [PRODUCT_INFO],CLASS_INFO where ProductID = @ProductID and PRODUCT_INFO.ClassID=CLASS_INFO.ClassID" 
            
            UpdateCommand="UPDATE [PRODUCT_INFO] SET [ProductBrand] = @ProductBrand, [ProductName] = @ProductName, [Manufacturer] = @Manufacturer, [ProduceArea] = @ProduceArea, [ProductType] = @ProductType, [ProductSize] = @ProductSize, [UnitPrice] = @UnitPrice, [Discount] = @Discount, [InStock] = @InStock, [IssueDate] = @IssueDate, [Description] = @Description, [ProductImgUrl] = @ProductImgUrl, [ClassID] = @ClassID, [Evaluation] = @Evaluation WHERE [ProductID] = @ProductID" 
            oninserted="ProductDetailsViewSqlDataSource_Inserted">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Direction="Output" Type="Int32" DefaultValue="0" />
                <asp:Parameter Name="ProductBrand" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ProduceArea" Type="String" />
                <asp:Parameter Name="ProductType" Type="String" />
                <asp:Parameter Name="ProductSize" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="IssueDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ProductImgUrl" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter Name="Evaluation" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductBrand" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Manufacturer" Type="String" />
                <asp:Parameter Name="ProduceArea" Type="String" />
                <asp:Parameter Name="ProductType" Type="String" />
                <asp:Parameter Name="ProductSize" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Discount" Type="Decimal" />
                <asp:Parameter Name="InStock" Type="Int32" />
                <asp:Parameter Name="IssueDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ProductImgUrl" Type="String" />
                <asp:Parameter Name="ClassID" Type="String" />
                <asp:Parameter Name="Evaluation" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="ProductID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="ProductDetailsView" runat="server" 
            AutoGenerateRows="False" DataKeyNames="ProductID" 
            DataSourceID="ProductDetailsViewSqlDataSource" 
            onitemupdated="ProductDetailsView_ItemUpdated" 
            onitemdeleted="ProductDetailsView_ItemDeleted" CssClass="table table-condensed table-bordered" OnItemUpdating="ProductDetailsView_ItemUpdating" OnItemInserting="ProductDetailsView_ItemInserting">
            <Fields>
                <asp:BoundField DataField="ProductID" HeaderText="商品编号" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductBrand" HeaderText="商品品牌" SortExpression="ProductBrand" />
                <asp:BoundField DataField="ProductName" HeaderText="商品名称" SortExpression="ProductName" />
                <asp:BoundField DataField="Manufacturer" HeaderText="制造厂商" SortExpression="Manufacturer" />
                <asp:BoundField DataField="ProduceArea" HeaderText="商品产地" SortExpression="ProduceArea" />
                <asp:BoundField DataField="ProductType" HeaderText="商品类型" SortExpression="ProductType" />
                <asp:BoundField DataField="ProductSize" HeaderText="商品尺寸" SortExpression="ProductSize" />
                <asp:TemplateField HeaderText="商品单价" SortExpression="UnitPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="UnitPriceEditTextBox" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UnitPriceEditRequiredFieldValidator" runat="server" ErrorMessage="单价不能为空。" ControlToValidate="UnitPriceEditTextBox" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="UnitPriceInsertTextBox" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UnitPriceInsertTextBoxRequiredFieldValidator" runat="server" ErrorMessage="单价不能为空。" ControlToValidate="UnitPriceInsertTextBox" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Discount" HeaderText="商品折扣" SortExpression="Discount" />
                <asp:BoundField DataField="InStock" HeaderText="商品库存" SortExpression="InStock" />
                <asp:BoundField DataField="IssueDate" HeaderText="发布日期" SortExpression="IssueDate" />
                <asp:BoundField DataField="Description" HeaderText="商品描述" SortExpression="Description" />
                <asp:TemplateField HeaderText="商品图片" SortExpression="ProductImgUrl">
                    <EditItemTemplate>
                        <asp:Label ID="ProductDetailsViewEditImgUrlMsgLabel" runat="server" Text='<%# Bind("ProductImgUrl") %>'></asp:Label>
                        <asp:FileUpload ID="ProductDetailsViewEditImgFileUpload" runat="server" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="ProductDetailsViewInsertImgFileUpload" runat="server" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="ProductDetailsViewImage" runat="server" ImageUrl='<%# Bind("ProductImgUrl") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品类别编号" SortExpression="ClassID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ClassIDEditDropDownList" runat="server" DataSourceID="ClassIDEditDropDownListSqlDataSource" DataTextField="ClassName" DataValueField="ClassID" SelectedValue='<%# Bind("ClassID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ClassIDEditDropDownListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" SelectCommand="SELECT * FROM [CLASS_INFO]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ClassIDInsertDropDownList" runat="server" DataSourceID="ClassIDInsertDropDownListSqlDataSource" DataTextField="ClassName" DataValueField="ClassID" SelectedValue='<%# Bind("ClassID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ClassIDInsertDropDownListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db2016ConnectionString %>" SelectCommand="SELECT * FROM [CLASS_INFO]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ClassIDLabel" runat="server" Text='<%# Bind("ClassID") %>'></asp:Label>
                        <asp:Label ID="ClassNameLabel" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Evaluation" HeaderText="商品评价数" SortExpression="Evaluation" />
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" onclientclick="return confirm(&quot;确认更新？&quot;);"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" onclientclick="return confirm(&quot;确认插入？&quot;);"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="新建"></asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" onclientclick="return confirm(&quot;确认删除？&quot;);"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
    </div>
    </div>
</asp:Content>