using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart_ShoppingCart : System.Web.UI.Page
{
    #region 属性
    DataTable ShoppingCartDataTable;
    decimal allTotal = 0;
    string CartTableName = "ShoppingCartTable";
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MemberName"] != null && Request.IsAuthenticated)
            {  // 如果用户在线
                BindCartList();
            }
            else
            {
                Response.Redirect("../Member/Login.aspx");
            }
        }
    }
    private void BindCartList()
    {
        if (Session[CartTableName] == null)
        {
            // 如果 Session 变量不存在，创建存储数据的表结构
            ShoppingCartDataTable = new DataTable();
            ShoppingCartDataTable.Columns.Add(new DataColumn("ProductID", typeof(int)));
            ShoppingCartDataTable.Columns.Add(new DataColumn("ProductName", typeof(string)));
            ShoppingCartDataTable.Columns.Add(new DataColumn("UnitPrice", typeof(decimal)));
            ShoppingCartDataTable.Columns.Add(new DataColumn("Quantity", typeof(int)));
            ShoppingCartDataTable.Columns.Add(new DataColumn("ItemTotal", typeof(decimal)));
            Session[CartTableName] = ShoppingCartDataTable;
        }
        else
        {
            // 如果 Session 存在，则直接读取
            ShoppingCartDataTable = (DataTable)Session[CartTableName];
        }

        // 如果用户传递的参数 ProductID 不为 null，则表示选中一件商品即将要添加进购物车
        if (Request.QueryString["ProductID"] != null)
        {
            string ProductID = Request.QueryString["ProductID"];

            // 先判断购物车中是否已经存在该商品
            Boolean IsExist = false;
            foreach (DataRow dr in ShoppingCartDataTable.Rows)
            {
                if (dr["ProductID"].ToString() == ProductID)
                {
                    IsExist = true;
                    break;
                }
            }
            if (IsExist)
            {
                // 如果购物车中存在该商品，则提示客户：该商品不会被重复添加到购物车
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alertExist", string.Format("alert('您选择的商品（编号：{0}）已存在于购物车中，您可以在购物车中更改您所需要购买的商品数量。')", ProductID), true);
            }
            else  // 如果购物车中不存在该商品，则添加到购物车
            {
                //DataTable NewShoppingCartDataTable = DataBaseClass.GetDataTable(string.Format("Select * From PRODUCT_INFO Where ProductID='{0}'", ProductID.ToString()));
                DataTable NewShoppingCartDataTable = Product.GetProduct(ProductID);
                decimal UnitPrice = Convert.ToDecimal(NewShoppingCartDataTable.Rows[0]["UnitPrice"]);
                int Quantity = 1;

                DataRow NewShoppingCartDataRow = ShoppingCartDataTable.NewRow();
                NewShoppingCartDataRow["ProductID"] = Convert.ToInt32(ProductID.ToString());
                NewShoppingCartDataRow["ProductName"] = NewShoppingCartDataTable.Rows[0]["ProductName"].ToString();
                NewShoppingCartDataRow["UnitPrice"] = UnitPrice;
                NewShoppingCartDataRow["Quantity"] = Quantity;
                NewShoppingCartDataRow["ItemTotal"] = UnitPrice * Quantity;
                ShoppingCartDataTable.Rows.Add(NewShoppingCartDataRow);
            }
        }

        // 以 CartDataTable 作为 CartGridView 控件的数据源
        ShoppingCartGridView.DataSource = ShoppingCartDataTable;

        // 绑定
        ShoppingCartGridView.DataBind();

        Session[CartTableName] = ShoppingCartDataTable;
    }
    protected void ShoppingCartGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {  // 数据行创建后
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // 鼠标效果
            e.Row.Attributes.Add("onmouseover", "oldBG=this.style.backgroundColor;this.style.backgroundColor='#E1ECEE';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=oldBG");

            //TextBox Quantity = (TextBox)e.Row.FindControl("QuantityTextBox");  // 找到模板列里购买数量的控件
            Label ItemTotal = (Label)e.Row.FindControl("ItemTotalLabel");

            // 根据商品单价和数量计算总金额
            //DataRowView drv = (DataRowView)e.Row.DataItem;
            //allTotal += Convert.ToDecimal(drv["UnitPrice"]) * Int32.Parse(Quantity.Text);
            allTotal += Convert.ToDecimal(ItemTotal.Text);

            
        }if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = allTotal.ToString();
                //((Label)(ShoppingCartGridView.FindControl("AllToatalLable"))).Text = Convert.ToString(allTotal);
            }
    }

    private void BindData()
    {
        ShoppingCartGridView.DataSource = Session[CartTableName];
        ShoppingCartGridView.DataBind();
    }
    protected void ShoppingCartGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Set the edit index.
        ShoppingCartGridView.EditIndex = e.NewEditIndex;
        //Bind data to the GridView control.
        BindData();
    }
    protected void ShoppingCartGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //Reset the edit index.
        ShoppingCartGridView.EditIndex = -1;
        //Bind data to the GridView control.
        BindData();
    }
    protected void ShoppingCartGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Retrieve the table from the session object.
        DataTable dt = (DataTable)Session[CartTableName];

        //Update the values.
        GridViewRow row = ShoppingCartGridView.Rows[e.RowIndex];
        //dt.Rows[row.DataItemIndex]["UnitPrice"] = ((TextBox)(row.Cells[3].Controls[0])).Text;
        var UnitPrice = ((Label)row.FindControl("UnitPriceLabel")).Text;
        var Quantity = ((TextBox)(row.FindControl("QuantityTextBox"))).Text;

        dt.Rows[row.DataItemIndex]["UnitPrice"] = UnitPrice;
        dt.Rows[row.DataItemIndex]["Quantity"] = Quantity;
        dt.Rows[row.DataItemIndex]["ItemTotal"] = Convert.ToDecimal(UnitPrice) * Convert.ToInt32(Quantity);


        //Reset the edit index.
        ShoppingCartGridView.EditIndex = -1;

        //Bind data to the GridView control.
        BindData();
    }
    protected void ShoppingCartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // 点击删除时从 DataTable 中删除对应的数据行
        if (Session[CartTableName] != null)
        {
            ShoppingCartDataTable = (DataTable)Session[CartTableName];
            ShoppingCartDataTable.Rows.RemoveAt(e.RowIndex);
            ShoppingCartDataTable.AcceptChanges();
            Session[CartTableName] = ShoppingCartDataTable;
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}