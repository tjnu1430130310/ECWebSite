using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DataBase 的摘要说明
/// </summary>
public class DataBase
{
	public DataBase()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    // 建立到 SQL server 数据库的连接，返回连接对象 SqlConnection dbConnection
    public static SqlConnection GetConnection()
    {
        //SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myDB2008R2"].ConnectionString);
        //SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myDBConnection"].ConnectionString);
        SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["db2016ConnectionString"].ConnectionString);
        return dbConnection;
    }

    // 执行指定的 SQL 命令，return (SqlDataReader)sdr
    // SqlDataReader 类提供一种从 SQL Server 数据库读取行的只进流的方式。
    public static SqlDataReader GetDataReader(string sqlString)
    {
        SqlConnection conn = DataBase.GetConnection();
        conn.Open();
        SqlCommand cmd = new SqlCommand(sqlString, conn);
        SqlDataReader sdr = cmd.ExecuteReader();  //ExecuteReader() 将 CommandText 发送到 Connection 并生成一个 SqlDataReader。
        return sdr;
    }

    public static bool updateData(string sqlstr)
    {  //通过Command对象执行SQL命令，如增、删、改
        SqlConnection conn = DataBase.GetConnection();
        conn.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, conn);
        try
        {
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
        finally
        {
            conn.Close();
        }
    }

    // 执行制定 SQL 命令，return DataTable对象
    // DataTable 表示内存中数据的一个表。
    public static DataTable GetDataTable(string sqlString)
    {
        SqlConnection conn = DataBase.GetConnection();
        SqlDataAdapter sda = new SqlDataAdapter(sqlString, conn);
        DataSet ds = new DataSet();
        //sda.Fill(ds); return ds.Tables[0];
        sda.Fill(ds, "Table"); return ds.Tables["Table"];
    }

    // 执行 Select 命令查找数据，返回 1 表示存在数据，返回 0 表示不存在，返回 2 代表出错
    public static int FindData(string sqlString)
    {
        SqlConnection conn = DataBase.GetConnection();
        conn.Open();
        SqlCommand cmd = new SqlCommand(sqlString, conn);
        try
        {
            object obj = cmd.ExecuteScalar();
            /*
             * SqlCommand.ExecuteScalar Method (): Executes the query, and returns the first column of the first row in the result set returned by the query. Additional columns or rows are ignored.
             * 执行查询，并返回查询所返回的结果集的第一行第一列。将忽略其他列或行。
             */
            if (obj != null)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        catch (SqlException ex)
        {
            return 2;
        }
        finally
        {
            conn.Close();
        }
    }
}