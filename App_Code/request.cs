using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Profile;

/// <summary>
/// request の概要の説明です
/// </summary>
public class request
{
	public DataTable getReq()
	{
		DataTable dt = new DataTable();

		dt.Columns.Add("ユーザ名");
		dt.Columns.Add("氏名");

		foreach (MembershipUser usr in Membership.GetAllUsers())
		{
			//テーブル
			DataRow tRow = dt.NewRow();

			//セルの追加
			tRow["ユーザ名"] = usr.UserName;
			tRow["氏名"] = (String)ProfileBase.Create(usr.UserName).GetPropertyValue("Family") + " " +
				(String)ProfileBase.Create(usr.UserName).GetPropertyValue("First");

			dt.Rows.Add(tRow);
		}
		return dt;
	}
}
