using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Product 的摘要说明
/// </summary>
public class Product
{
	public Product()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public static DataTable GetProduct(string ProductID)
    {
        return DataBase.GetDataTable(string.Format("Select * From PRODUCT_INFO Where ProductID='{0}'", ProductID.ToString()));
    }
}