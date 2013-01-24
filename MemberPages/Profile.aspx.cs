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
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Web.Profile;

public partial class MemberPages_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		//プロファイル情報をラベルに設定
		UserLabel.Text = User.Identity.Name;
		FamilyLabel.Text = Profile.Family;
		FirstLabel.Text = Profile.First;
		BirthLabel.Text = Profile.Birth;
		SexLabel.Text = Profile.Sex;
		ClassLabel.Text = Profile.Class;
		HobbyLabel.Text = Profile.Hobby;

		//初めて訪問したか？
		if (Profile.Flag == "")
		{
			Profile.Request = "' OR ユーザ名 = 'admin";
			Profile.Flag = "1";
			Response.Redirect("~/MemberPages/tutorial.aspx");
		}

		//フレンドリクエストがあるか？
		ObjectDataSource1.FilterExpression = "ユーザ名 = '"+ Profile.Request + "'";
		
		if (Profile.Request == "") Panel3.Visible = false;
		else Panel3.Visible = true;

		//メッセージがあるか？
		try
		{
			if (GridView2.Rows[0].Cells[0].Text == "未読") NewMessagePanel.Visible = true;
		}
		catch (ArgumentOutOfRangeException ex1) { 
		}
    }

	protected void EditButton_Click(object sender, EventArgs e)
	{
		Panel1.Visible = false;
		Panel2.Visible = true;


		FamilyBox.Text = Profile.Family;
		FirstBox.Text = Profile.First;
		ClassBox.Text = Profile.Class;
		HobbyBox.Text = Profile.Hobby;


		int idx = 0;
		foreach (ListItem item in YearList.Items)
		{
			if (item.Value == Profile.BYear)
			{
				YearList.SelectedIndex = idx;
				break;
			}
			idx++;
		}
		idx = 0;
		foreach (ListItem item in MonthList.Items)
		{
			if (item.Value == Profile.BMonth)
			{
				MonthList.SelectedIndex = idx;
				break;
			}
			idx++;
		}
		idx = 0;
		foreach (ListItem item in DayList.Items)
		{
			if (item.Value == Profile.BDay)
			{
				DayList.SelectedIndex = idx;
				break;
			}
			idx++;
		}
		idx = 0;
		foreach (ListItem item in SexList.Items)
		{
			if (item.Value == Profile.Sex)
			{
				SexList.SelectedIndex = idx;
				break;
			}
			idx++;
		}
	}

	protected void SaveButton_Click(object sender, EventArgs e)
	{
		Panel1.Visible = true;
		Panel2.Visible = false;
		Profile.Family=FamilyBox.Text;
		Profile.First=FirstBox.Text;
		Profile.Birth = YearList.Text + "/" + MonthList.Text + "/" + DayList.Text;
		Profile.BYear = YearList.Text;
		Profile.BMonth = MonthList.Text;
		Profile.BDay = DayList.Text;
		Profile.Sex = SexList.Text;
		Profile.Class = ClassBox.Text;
		Profile.Hobby = HobbyBox.Text;

		FamilyLabel.Text = Profile.Family;
		FirstLabel.Text = Profile.First;
		BirthLabel.Text = Profile.Birth;
		SexLabel.Text = Profile.Sex;
		ClassLabel.Text = Profile.Class;
		HobbyLabel.Text = Profile.Hobby;
	}

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		String selectedUsr = (String)GridView1.SelectedValue;
		//自分のRequestプロパティとFriendプロパティ、ターゲットのFriendプロパティを取得
		String gr = Profile.Request;
		String fr = Profile.Friend;
		String tgt = (String)ProfileBase.Create(selectedUsr).GetPropertyValue("Friend");

		//Requestプロパティから対象ユーザーを削除し、自分と相手のフレンドプロパティに値を追加
		gr = gr.Replace("' OR ユーザ名 = '" + selectedUsr,"");
		fr = fr + "' OR ユーザ名 = '" + selectedUsr;
		tgt = tgt + "' OR ユーザ名 = '" + User.Identity.Name;

		Profile.Request = gr;
		Profile.Friend = fr;
		setProperty(selectedUsr, "Friend", tgt);

		Response.Redirect("Profile.aspx");
	}


	
	public void setProperty(String target, String ProfileName, String data)
	{
		ProfileBase prof = ProfileBase.Create(target);
		prof.SetPropertyValue(ProfileName, data);
		prof.Save();
	}
	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "refuse")
		{
			String rf = Profile.Request;
			int args = Int32.Parse((String)e.CommandArgument);
			rf =rf.Replace("' OR ユーザ名 = '" + GridView1.Rows[args].Cells[2].Text,"");
			Profile.Request = rf;
			Response.Redirect("Profile.aspx");
		}
	}
}