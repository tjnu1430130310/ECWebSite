using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["MemberName"] != null && Request.IsAuthenticated)
        {
            MemberFormViewSqlDataSource.SelectCommand = string.Format("SELECT * FROM ADMIN_INFO where AdminName='{0}'", Session["MemberName"].ToString().Trim());
            MemberNameLabel.Text = Session["MemberName"].ToString().Trim();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
    FileUpload VirtualImgFile;
    public bool TestFile()
    {
        // 获取文件扩展名
        string fileExtension = System.IO.Path.GetExtension(VirtualImgFile.FileName).ToLower();
        string[] webExtension = { ".gif", ".jpg", ".jpeg", ".png" };
        // 判断文件类型是否符合要求
        for (int i = 0; i < webExtension.Length; i++)
        {
            if (fileExtension == webExtension[i])
            {
                // 文件类型符合要求
                return true;
            }
        }
        // 文件类型不符合要求
        return false;
    }
    string PathStr = "../images/Admin/";
    protected void MemberFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        VirtualImgFile = (FileUpload)MemberFormView.FindControl("MemberFormViewEditImgFileUpload");
        if (VirtualImgFile.HasFile)
        {
            //判断文件类型是否符合要求
            bool fileValid = TestFile();

            //文件类型符合要求则调用SaveAs方法上传
            if (fileValid)
            {
                VirtualImgFile.SaveAs(Server.MapPath(PathStr) + VirtualImgFile.FileName);
                e.NewValues["ImageUrl"] = PathStr + VirtualImgFile.FileName;
            }
        }
    }
}