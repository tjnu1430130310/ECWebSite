using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MemberName"] != null)
            {
                MemberNameTextBox.Text = Session["MemberName"].ToString();
            }

            //读取保存的Cookie信息
            HttpCookie cookies = Request.Cookies["MEMBER_COOKIES"];
            if (cookies != null)
            {
                //如果Cookie不为空，则将Cookie里面的用户名和密码读取出来赋值给前台的文本框。
                MemberNameTextBox.Text = cookies["MemberName"];
                MemberNameTextBox.Attributes.Add("value", cookies["MemberPassword"]);
                //这里依然把记住密码的选项给选中。
                //cbxRememberUserName.Checked = true;
            }
        }
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string MemberName = MemberNameTextBox.Text.Trim(), Password = PasswordTextBox.Text.Trim();
        string sqlStr = string.Format("Select * From ADMIN_INFO Where AdminName='{0}' And Password='{1}'", MemberName, Password);

        try
        {
            SqlDataReader sdr = DataBase.GetDataReader(sqlStr);

            HttpCookie cookie = new HttpCookie("MEMBER_COOKIES");
            if (sdr.Read())  //if (username == "admin" && password == "123")
            {
                // 验证用户是否选择了记住用户名和密码
                if (RememberCheckBox.Checked)
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

                Session.Add("MemberID", sdr["AdminID"].ToString());
                Session.Add("MemberName", sdr["AdminName"].ToString());
                Session.Add("MemberRole", sdr["AdminRole"].ToString());

                // Since we want to log in the user and redirect them to the appropriate page, let's use RedirectFromLoginPage.
                FormsAuthentication.RedirectFromLoginPage(MemberName, RememberCheckBox.Checked);
                // FormsAuthentication.RedirectFromLoginPage （UserName.Text，RememberMe.Checked）;
                // When creating the forms authentication ticket we use the UserName TextBox's Text property for the forms authentication ticket username parameter, and the checked state of the RememberMe CheckBox for the persistCookie parameter.

                Response.Redirect("Member.aspx");
            }
            else
            {
                // If we reach here, the user's credentials were invalid
                MsgLabel.Visible = true;
                MemberNameTextBox.Text = "";
                PasswordTextBox.Text = "";
            }
        }
        catch (SqlException ex)
        {
            MsgLabel.Text += ex.ToString();
        }
    }
}