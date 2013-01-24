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

public partial class MemberPages_Bbs : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		UserLabel.Text = User.Identity.Name;
		RpeatSDS.FilterExpression = "ユーザ名 = '"+User.Identity.Name+"' OR "+"ユーザ名 = '" + Profile.Friend + "'";
	}
	protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
	{
		Response.Redirect("~/MemberPages/Bbs.aspx");
	}
}