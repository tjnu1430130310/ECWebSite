using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Order_Order : System.Web.UI.Page
{
    private decimal AllTotal = 0;
    string CartTableName = "ShoppingCartTable";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberID"] != null && Request.IsAuthenticated)
        {
            string MemberID = Session["MemberID"].ToString(); // 获取当前用户 ID
            
            MemberInfoFormViewSqlDataSource.SelectCommand = string.Format("Select * from VIP_INFO where VipID='{0}'", MemberID);
            
            string sqlSelectVipStr = string.Format("Select * from VIP_INFO where VipID='{0}'", MemberID);
            SqlDataReader sqlSelectVipStrDataReader = DataBase.GetDataReader(sqlSelectVipStr);
            if (sqlSelectVipStrDataReader.Read())
            {
                if (sqlSelectVipStrDataReader["Province"] == "" || sqlSelectVipStrDataReader["City"] == "" || sqlSelectVipStrDataReader["Postcode"] == "" || sqlSelectVipStrDataReader["Address"] == "" ||sqlSelectVipStrDataReader["Telephone"] == "")
                {
                    MsgLabel.Text = "请输入您的收货信息。";
                    OrderButton.Visible = false;
                }
                else
                {
                    OrderButton.Visible = true;
                }
            }
            DataTable mydt = new DataTable();
            if (Session[CartTableName] != null)
            {
                mydt = (DataTable)Session[CartTableName];
                OrderGridView.DataSource = mydt;
                OrderGridView.DataBind();
            }
            else
            {
                Response.Redirect("../Product/ProductList.aspx");
            }
        }
        else
        {
            Response.Redirect("../Member/Login.aspx");
        }

        for (int i = 0; i < OrderGridView.Rows.Count; i++)
        {
            AllTotal += Convert.ToDecimal(OrderGridView.Rows[i].Cells[1].Text) * Int32.Parse(OrderGridView.Rows[i].Cells[2].Text);
        }
        OrderGridView.FooterRow.Cells[0].Text = "商品总价："+AllTotal.ToString();
    }
    protected void OrderButton_Click(object sender, EventArgs e)
    {
        if (Session["MemberID"]!=null && Session[CartTableName] != null)
        {  // 生成订单
            DataTable mydt = (DataTable)Session[CartTableName];
            string MemberID = Session["MemberID"].ToString(); // 获取当前用户 ID

            
            

            // 新增一条记录并返回记录号
            // string sqlstr = string.Format("Insert Into [ORDER_INFO]([UserID],[OrderDate],[OrderStatus])Values({0},getDate(),'0') Select SCOPE_IDENTITY() As 'newOrderID'", userid);
            string sqlCreatOrderStr = string.Format("Insert Into [ORDER]([VipID], [MakeDate], [OrderStatus], [AllTotal]) Values('{0}', getDate(), 'UnPaid', '{1}') Select SCOPE_IDENTITY() As 'newOrderID'", Convert.ToInt32(MemberID), Convert.ToDecimal(AllTotal));
            SqlDataReader mySDR = DataBase.GetDataReader(sqlCreatOrderStr);
            if (mySDR.Read())
            {  // 生成订单明细
                string order_id = mySDR.GetValue(0).ToString();  // 当前订单
                MsgLabel.Text = string.Format("当前订单号为：{0}", order_id);
                for (int i = 0; i < mydt.Rows.Count; i++)
                {
                    string product_id = mydt.Rows[i][0].ToString();
                    string quantity = mydt.Rows[i][3].ToString();
                    string unit_price = mydt.Rows[i][2].ToString();
                    //string item_total = mydt.Rows[i][4].ToString();
                    string item_total = Convert.ToString(Convert.ToDecimal(unit_price) * Convert.ToInt32(quantity));
                    string sqlCreatOrderDetailsStr = string.Format("Insert Into [ORDER_DETAILS]([OrderID], [ProductID], [UnitPrice], [Quantity], [ItemTotal]) Values('{0}', '{1}', '{2}', '{3}', '{4}')", Convert.ToInt32(order_id), Convert.ToInt32(product_id), Convert.ToDecimal(unit_price), Convert.ToInt32(quantity), Convert.ToDecimal(item_total));
                    //string sqlCreatOrderDetailsStr = string.Format("Insert Into [ORDER_DETAILS]([OrderID], [ProductID], [UnitPrice], [Quantity]) Values('{0}', '{1}', '{2}', '{3}')", Convert.ToInt32(order_id), Convert.ToInt32(product_id), Convert.ToDecimal(unit_price), Convert.ToInt32(quantity));
                    DataBase.updateData(sqlCreatOrderDetailsStr);
                }
                Session[CartTableName] = null;
                OrderButton.Enabled = false;
                ToPayLabel.Visible = true;
                ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>setTimeout(function(){location.href='../Member/ViewOrder.aspx'},3000);  </script>");
            }
            else
            {
                MsgLabel.Text = "订单生成错误，请稍后再试！";
                OrderButton.Enabled = false;
            }
        }
        else
        {
            Response.Write("<script>alert('还没有选择商品，订单生成失败！')</script>");
        }
    }
    protected void MemberInfoFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("Order.aspx");
    }
}