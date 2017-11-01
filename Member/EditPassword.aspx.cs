using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_EditPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void EditPasswordButton_Click(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated && Session["MemberID"] != null)
        {
            SqlDataReader sdr = DataBase.GetDataReader(string.Format("Select Password from VIP_INFO where VipID='{0}'", Session["MemberID"].ToString()));
            if (sdr.Read())
            {
                if (sdr["Password"].ToString() == OldPasswordTextBox.Text.ToString().Trim())
                {
                    if (NewPasswordTextBox.Text.ToString().Trim() == NewPassword2TextBox.Text.ToString().Trim())
                    {
                        string sqlEditPassword = string.Format("Update VIP_INFO set Password='{0}' where VipID='{1}'", NewPasswordTextBox.Text.ToString().Trim(), Session["MemberID"].ToString());
                        if (DataBase.updateData(sqlEditPassword))
                        {
                            MsgLabel.Text = "修改成功！";
                            OldPasswordTextBox.Text = NewPasswordTextBox.Text = NewPassword2TextBox.Text = "";
                        }
                        else
                        {
                            MsgLabel.Text = "修改失败！";
                        }
                    }
                }
                else
                {
                    MsgLabel.Text = "旧密码不正确，请重新输入！";
                }
            }


        }

    }
}