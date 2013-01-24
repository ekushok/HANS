using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// UserTable の概要の説明です
/// </summary>
public class UserDetail
{
	public DataTable getDt()
	{
		DataTable dt = new DataTable();

		dt.Columns.Add("ユーザ名");
		dt.Columns.Add("氏名");
		dt.Columns.Add("生年月日");
		dt.Columns.Add("性別");
		dt.Columns.Add("クラス");
		dt.Columns.Add("趣味");

		foreach (MembershipUser usr in Membership.GetAllUsers())
		{
			//テーブル
			DataRow tRow = dt.NewRow();

			//セルの追加
			tRow["ユーザ名"] = usr.UserName;
			tRow["氏名"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Family") + " " +
				(String)ProfileBase.Create(usr.UserName).GetPropertyValue("First");
			tRow["性別"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Sex");
			tRow["生年月日"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Birth");
			tRow["クラス"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Class");
			tRow["趣味"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Hobby");

			dt.Rows.Add(tRow);
		}
		return dt;
	}
}
