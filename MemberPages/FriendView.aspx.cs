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
using System.Web.Profile;

public partial class MemberPages_FriendView : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		ObjectDataSource2.FilterExpression = "ユーザ名 = '" + Profile.Friend + "'";
	}
	protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
	{

		//Label1.Text = (String)GridView2.SelectedValue;
		//ObjectDataSource2.FilterExpression = "ユーザ名 = '" + (String)ProfileBase.Create((String)GridView2.SelectedValue).GetPropertyValue("Friend") + "'";
		int args = Int32.Parse((String)e.CommandArgument);


		Panel2.Visible = true;
		Label1.Text = GridView2.Rows[args].Cells[1].Text;
		Label2.Text = GridView2.Rows[args].Cells[1].Text;
		Label3.Text = GridView2.Rows[args].Cells[1].Text;

		ObjectDataSource1.FilterExpression = "ユーザ名 = '" + (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Friend") + "'";


		UserLabel.Text = GridView2.Rows[args].Cells[1].Text;
		FamilyLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Family");
		FirstLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("First");
		SexLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Sex");
		BirthLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Birth");
		ClassLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Class");
		HobbyLabel.Text = (String)ProfileBase.Create(GridView2.Rows[args].Cells[1].Text).GetPropertyValue("Hobby");

	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		int args = Int32.Parse((String)e.CommandArgument);
		Panel2.Visible = true;
		Label1.Text = GridView1.Rows[args].Cells[1].Text;
		Label2.Text = GridView1.Rows[args].Cells[1].Text;
		Label3.Text = GridView1.Rows[args].Cells[1].Text;
		ObjectDataSource1.FilterExpression = "ユーザ名 = '" + (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Friend") + "'";

		UserLabel.Text = GridView1.Rows[args].Cells[1].Text;
		FamilyLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Family");
		FirstLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("First");
		SexLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Sex");
		BirthLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Birth");
		ClassLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Class");
		HobbyLabel.Text = (String)ProfileBase.Create(GridView1.Rows[args].Cells[1].Text).GetPropertyValue("Hobby");

	}
	protected void MCanncelButton_Click(object sender, EventArgs e)
	{
		MessagePanel.Visible = false;
		Panel2.Visible = true;
	}
	protected void MessageButton_Click(object sender, EventArgs e)
	{
		MessagePanel.Visible = true;
		Panel2.Visible = false;

		Label5.Text = UserLabel.Text;
	}
	protected void BackButton_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/MemberPages/FriendView.aspx");
	}
	protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		DonePanel.Visible = true;
		MessagePanel.Visible = false;
	}
}
