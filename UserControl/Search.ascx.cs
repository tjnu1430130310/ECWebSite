using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_Search : System.Web.UI.UserControl
{
    string Text;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format(@"Search.aspx?key={0}", SearchTextBox.Text));
    }
}