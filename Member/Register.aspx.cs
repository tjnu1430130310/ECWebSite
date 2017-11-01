using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_VIP_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        string VipName = VIPNameTextBox.Text.Trim(), Password = PasswordTextBox.Text.Trim(), Email = EmailTextBox.Text.Trim();

        string sqlStr = string.Format("insert  into VIP_INFO (VipName, Password, Email) values ('{0}', '{1}', '{2}')'", VipName, Password, Email);
        SqlConnection conn = DataBase.GetConnection();
        try
        {
            if (VIPNameCustomValidator.IsValid)
            {  // VIP 账号不重复
                /*conn.Open();
                    cmd.ExecuteNonQuery();
                    lbMsg.Text = "注册成功！";*/
                SqlDataAdapter sda = new SqlDataAdapter("Select * From VIP_INFO", conn);  // SqlDataAdapter 是 DataSet 和 SQL Server 之间的桥接器。 SqlDataAdapter 通过对数据源使用适当的 Transact-SQL 语句映射 Fill（它可填充 DataSet 中的数据以匹配数据源中的数据）和 Update（它可更改数据源中的数据以匹配 DataSet 中的数据）来提供这一桥接。当 SqlDataAdapter 填充  DataSet 时，它为返回的数据创建必需的表和列（如果这些表和列尚不存在）。
                SqlCommandBuilder scd = new SqlCommandBuilder(sda);  //c# 中用来批量更新数据库。当传递具有新行的 DataRow 集合时，Update 要求有效的 InsertCommand 。

                DataSet VipData = new DataSet();  //DataSet是 ADO.NET 的中心概念，是 ADO. NET 结构的主要组件，它是从数据源中检索到的数据在内存中的缓存。DataSet 支持多表、表间关系、数据约束等，和关系数据库的模型基本一致。DataSet 可将数据和架构作为 XML 文档进行读写。
                sda.Fill(VipData);  //填充 DataSet 。Adds or refreshes rows in the DataSet.

                DataRow newVip = VipData.Tables[0].NewRow();  //创建一个新行，空白记录
                newVip["VipName"] = VipName;
                newVip["Password"] = Password;
                newVip["Email"] = Email;

                newVip["VipRole"] = "0";
                VipData.Tables[0].Rows.Add(newVip);
                sda.Update(VipData);  //提交到数据库进行更新。
                MsgLabel.Text = "注册成功！正在跳转到登陆页面。。。";
                //<span id=\"time\">3</span>秒后跳转，如果不跳转请点击<a href=\"Login.aspx\">连接</a>进入登陆页面。<script type=\"text/javascript\">delayURL(\"../Login.aspx\");</script>
                ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>setTimeout(function(){location.href='Login.aspx'},3000);  </script>");
            }
            else
            {
                MsgLabel.Text = "注册失败！";
            }
        }
        catch (SqlException ex)
        {
            MsgLabel.Text += ex.ToString();
        }
        finally
        {
            conn.Close();
        }
    }

    // 检验 VIP 账号名是否重复
    protected void VIPNameCustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            SqlDataReader sdr = DataBase.GetDataReader(string.Format("Select VIPName From VIP_INFO Where VipName='{0}'", VIPNameTextBox.Text.Trim()));
            if (sdr.Read())
            {  // VIP 账号名重复
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
        catch (Exception ex)
        {
             MsgLabel.Text += ex.ToString();
        }
    }
}