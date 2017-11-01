using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Product_Product : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateMenu();
        }
    }

    public void PopulateMenu()
    {
        DataSet dst = GetMenuData();
        foreach (DataRow masterRow in
          dst.Tables["Class"].Rows)
        {
            MenuItem masterItem = new
              MenuItem((string)masterRow["ClassName"]);
            masterItem.NavigateUrl = string.Format("ProductList.aspx?ClassID={0}", (string)masterRow["ClassID"]);
            ProductClassMenu.Items.Add(masterItem);
        }
    }

    DataSet GetMenuData()
    {
        SqlConnection con = DataBase.GetConnection();
        SqlDataAdapter dadClass = new SqlDataAdapter("SELECT * FROM CLASS_INFO", con);
        DataSet dst = new DataSet();
        dadClass.Fill(dst, "Class");
        return dst;
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string MemberName = ((TextBox)MasterLoginView.FindControl("MemberNameTextBox")).Text.ToString().Trim();
        string Password = ((TextBox)MasterLoginView.FindControl("PasswordTextBox")).Text.ToString().Trim();
        string sqlStr = string.Format("Select * From VIP_INFO Where VipName='{0}' And Password='{1}'", MemberName, Password);

        try
        {
            SqlDataReader sdr = DataBase.GetDataReader(sqlStr);

            HttpCookie cookie = new HttpCookie("MEMBER_COOKIES");
            if (sdr.Read())  //if (username == "admin" && password == "123")
            {
                // 验证用户是否选择了记住用户名和密码
                if (((CheckBox)MasterLoginView.FindControl("RememberCheckBox")).Checked)
                {
                    //如果用户选择记住用户名和密码，则将用户名和密码写入Cookie里面保存起来。
                    cookie.Values.Add("MemberName", MemberName);
                    cookie.Values.Add("MemberPassword", Password);
                    //这里是设置Cookie的过期时间，这里设置一个星期的时间，过了一个星期之后状态保持自动清空。
                    cookie.Expires = System.DateTime.Now.AddDays(7.0);
                    HttpContext.Current.Response.Cookies.Add(cookie);
                }
                else
                {
                    if (cookie["MEMBER_COOKIES"] != null)
                    {
                        //如果用户没有选择记住密码，那么立即将Cookie里面的信息情况，并且设置状态保持立即过期。
                        Response.Cookies["MEMBER_COOKIES"].Expires = DateTime.Now.AddDays(-1);
                    }
                }

                Session.Add("MemberID", sdr["VipID"].ToString());
                Session.Add("MemberName", sdr["VipName"].ToString());
                Session.Add("MemberRole", sdr["VipRole"].ToString());

                // Since we want to log in the user and redirect them to the appropriate page, let's use RedirectFromLoginPage.
                FormsAuthentication.RedirectFromLoginPage(MemberName, ((CheckBox)MasterLoginView.FindControl("RememberCheckBox")).Checked);
                // FormsAuthentication.RedirectFromLoginPage （UserName.Text，RememberMe.Checked）;
                // When creating the forms authentication ticket we use the UserName TextBox's Text property for the forms authentication ticket username parameter, and the checked state of the RememberMe CheckBox for the persistCookie parameter.

                Response.Redirect("../Member/Member.aspx");
            }
            else
            {
                // If we reach here, the user's credentials were invalid
                ((Label)MasterLoginView.FindControl("MsgLabel")).Visible = true;
                ((TextBox)MasterLoginView.FindControl("MemberNameTextBox")).Text = "";
                ((TextBox)MasterLoginView.FindControl("PasswordTextBox")).Text = "";
            }
        }
        catch (SqlException ex)
        {
            ((Label)MasterLoginView.FindControl("MsgLabel")).Text += ex.ToString();
        }
    }
}
