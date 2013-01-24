using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Xml.Linq;

public partial class MemberPages_Friend : System.Web.UI.Page
{
	private String selectedUsr;
	protected void Page_Load(object sender, EventArgs e)
	{

		Label3.Text = User.Identity.Name;


	}
	protected void SearchButton_Click(object sender, EventArgs e)
	{
		//検索
		ObjectDataSource1.FilterExpression = "ユーザ名 LIKE '%{0}%' OR 氏名 LIKE '%{0}%' OR 氏名 LIKE '%{0}%'";
		Panel1.Visible = true;
	}
	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		selectedUsr = (String)GridView1.SelectedValue;
		Panel2.Visible = true;
		Panel1.Visible = false;
		Panel3.Visible = false;

		Label1.Text = selectedUsr;
		Label2.Text = selectedUsr;
		UserLabel.Text = selectedUsr;
		FamilyLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Family");
		FirstLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("First");
		SexLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Sex");
		BirthLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Birth");
		ClassLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Class");
		HobbyLabel.Text = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Hobby");

		//選択したユーザにフレンド申請を送信済みか？

		if (SearchRequest())
		{
			RequestButton.Visible = false;
			DoneLabel.Visible = true;
		}
		else
		{
			RequestButton.Visible = true;
			DoneLabel.Visible = false;
		}
		if (SearchFriend())
		{
			RequestButton.Visible = false;
			DoneLabel.Visible = false;
		}
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		Panel2.Visible = false;
		Panel3.Visible = true;
		Panel1.Visible = true;
		SearchBox.Text = "";
	}
	protected void RequestButton_Click(object sender, EventArgs e)
	{
		String gr = (String)ProfileBase.Create(UserLabel.Text).GetPropertyValue("Request");

		//フィルタリング専用構文を挿入
		gr = gr + "' OR ユーザ名 = '" + User.Identity.Name;

		//対象にリクエストを送信
		setProperty(UserLabel.Text, "Request", gr);

		RequestButton.Visible = false;
		DoneLabel.Visible = true;
	}
	//自分のFriendプロファイルの中に対象の名前が含まれているか？
	public Boolean SearchFriend()
	{
		return Regex.IsMatch(Profile.Friend, UserLabel.Text);
	}
	//対象のRequestプロファイルの中に自分の名前が含まれているか？
	public Boolean SearchRequest()
	{
		return Regex.IsMatch((String)ProfileBase.Create(selectedUsr).GetPropertyValue("Request"), User.Identity.Name);
	}
	//プロファイルの設定(対象,プロファイル名,中身)
	public void setProperty(String target, String ProfileName, String data)
	{
		ProfileBase prof = ProfileBase.Create(target);
		prof.SetPropertyValue(ProfileName, data);
		prof.Save();
	}

	protected void MessageButton_Click(object sender, EventArgs e)
	{
		MessagePanel.Visible = true;
		Label4.Text = UserLabel.Text;
		Panel2.Visible = false;
	}
	protected void MCanncelButton_Click(object sender, EventArgs e)
	{
		MessagePanel.Visible = false;
		Panel2.Visible = true;
	}
	protected void BackButton_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/MemberPages/Friend.aspx");
	}
	protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		DonePanel.Visible = true;
		MessagePanel.Visible = false;
	}
}