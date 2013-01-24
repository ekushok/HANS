using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class MemberPages_MessageBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		UserLabel.Text = User.Identity.Name;
    }
	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		int args = Int32.Parse((String)e.CommandArgument);
		ToLabel.Text = GridView1.Rows[args].Cells[1].Text;
		GridView1.Visible = false;
		FormView1.Visible = true;
	}

	protected void BackButton_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/MemberPages/MessageBox.aspx");
	}
	protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
	{
		if (e.CommandName == "Back") Response.Redirect("~/MemberPages/MessageBox.aspx");
	}
	protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		DonePanel.Visible = true;
		FormView1.Visible = false;
	}
	protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
	{
		Response.Redirect("~/MemberPages/MessageBox.aspx");
	}
}
