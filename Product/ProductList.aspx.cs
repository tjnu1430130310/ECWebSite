using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product_ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cidStr = Request.QueryString["ClassID"] ?? string.Empty;
        if (string.IsNullOrEmpty(cidStr))
        {

        }
        else
        {
            ProductListViewSqlDataSource.SelectCommand = string.Format("select * from PRODUCT_INFO where ClassID='{0}'", cidStr);
        }
    }

    protected void ViewDetailsLinkButton_Click(object sender, EventArgs e)
    {
        //Request.QueryString["ClassID"] = null;
        Response.Redirect(string.Format("ProductDetails.aspx?ProductID={0}", ((LinkButton)sender).CommandArgument.ToString()));
    }
}