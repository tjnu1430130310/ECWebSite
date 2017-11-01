using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product_ProductManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ProductGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        //this.ProductDetailsView.PageIndex = this.ProductGridView.SelectedRow.DataItemIndex;
        ProductDetailsViewSqlDataSource.SelectParameters["ProductID"].DefaultValue = ProductGridView.SelectedValue.ToString();
    }
    protected void ProductDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        ProductGridView.DataBind();
    }
    protected void ProductDetailsViewSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Data.Common.DbCommand command = e.Command;

        ProductDetailsViewSqlDataSource.SelectParameters["ProductID"].DefaultValue = command.Parameters["@ProductID"].Value.ToString();

        ProductGridView.DataBind();
        ProductDetailsView.DataBind();
    }
    protected void ProductDetailsView_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        ProductGridView.DataBind();
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

    string PathStr = "../images/Product/";
    protected void ProductDetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        VirtualImgFile = (FileUpload)ProductDetailsView.FindControl("ProductDetailsViewEditImgFileUpload");
        if (VirtualImgFile.HasFile)
        {
            //判断文件类型是否符合要求
            bool fileValid = TestFile();

            //文件类型符合要求则调用SaveAs方法上传
            if (fileValid)
            {
                VirtualImgFile.SaveAs(Server.MapPath(PathStr) + VirtualImgFile.FileName);
                e.NewValues["ProductImgUrl"] = PathStr + VirtualImgFile.FileName;
            }
        }
    }
    protected void ProductDetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        VirtualImgFile = (FileUpload)ProductDetailsView.FindControl("ProductDetailsViewInsertImgFileUpload");
        if (VirtualImgFile.HasFile)
        {
            //判断文件类型是否符合要求
            bool fileValid = TestFile();

            if (fileValid)
            {
                //文件类型符合要求则调用SaveAs方法上传
                VirtualImgFile.SaveAs(Server.MapPath(PathStr) + VirtualImgFile.FileName);
                e.Values["ProductImgUrl"] = PathStr + VirtualImgFile.FileName;
            }
        }
    }
}