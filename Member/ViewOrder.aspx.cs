using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_VIP_ViewOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated && Session["MemberID"] != null) 
        {
            OrderGridViewSqlDataSource.SelectCommand = string.Format("SELECT * FROM [ORDER] where VipID='{0}'", Session["MemberID"].ToString());
        }
    }

    protected void OrderGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        //this.ProductDetailsView.PageIndex = this.ProductGridView.SelectedRow.DataItemIndex;
        OrderDetailsListViewSqlDataSource.SelectParameters["OrderID"].DefaultValue = OrderGridView.SelectedValue.ToString();
    }
}