using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product_ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pidStr = Request.QueryString["ProductID"].ToString();
        if (pidStr == "")
        {
            MsgLabel.Text = "您没有选择商品，或商品已失效，请重新选择商品。";
        }
        else
        {
            ProductFormViewSqlDataSource.SelectCommand = string.Format("SELECT * FROM [PRODUCT_INFO] where ProductID='{0}'", pidStr);
        }
    }
}