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
using System.Xml.Linq;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
	{
		Panel1.Visible = false;
	}
	protected void CreateUserWizard1_ActiveStepChanged(object sender, EventArgs e)
	{
		Panel1.Visible = false;
	}
	protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
	{

		Panel1.Visible = false;
	}
}
