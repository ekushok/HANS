<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="HANS(ハンズ)|会員登録" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="CSS/Login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div>
    
    	<h1>会員登録</h1></div>
	<asp:Panel ID="Panel1" runat="server">
    	<ul>
    		<li>ユーザ名は半角英数で入力してください。</li>
    		<li>パスワードは半角英数5文字以上で入力してください。</li>
    		<li>電子メール・セキュリティの質問と返答は、パスワード再発行に使います。</li>
    	</ul>
	</asp:Panel>
	<div style="width:400px;margin:10px auto;">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
	ContinueDestinationPageUrl="~/MemberPages/Profile.aspx" 
		onactivestepchanged="CreateUserWizard1_ActiveStepChanged" 
		oncreateduser="CreateUserWizard1_CreatedUser" 
		oncreatinguser="CreateUserWizard1_CreatingUser" RequireEmail="False" 
		BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" 
		Font-Names="Verdana" Font-Size="10pt">
		<SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" 
			VerticalAlign="Top" />
		<SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" 
			ForeColor="#FFFFFF" />
		<ContinueButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
			BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
			ForeColor="#284775" />
		<NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
			BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
			ForeColor="#284775" />
		<HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" 
			HorizontalAlign="Center" />
		<CreateUserButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" 
			BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
			ForeColor="#284775" />
		<TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
		<StepStyle BorderWidth="0px" />
		<WizardSteps>
			<asp:CreateUserWizardStep runat="server" >
				<ContentTemplate>
					<table border="0">
						<tr>
							<th align="right">
								<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">ユーザーID<span style="color:Red;font-size:smaller">*必須</span>:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
								<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
									ControlToValidate="UserName" ErrorMessage="ユーザー名が必要です。" ToolTip="ユーザー名が必要です。" 
									ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator><br />
									<span style="font-size:smaller">ユーザIDは半角英数で入力してください。</span>
							</td>
						</tr>
						<tr>
							<th align="right">
								<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">パスワード<span style="color:Red;font-size:smaller">*必須</span>:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
								<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
									ControlToValidate="Password" ErrorMessage="パスワードが必要です。" ToolTip="パスワードが必要です。" 
									ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator><br />
									<span style="font-size:smaller">パスワードは5文字以上で入力してください。</span>
							</td>
						</tr>
						<tr>
							<th align="right">
								<asp:Label ID="ConfirmPasswordLabel" runat="server" 
									AssociatedControlID="ConfirmPassword">パスワードの確認入力<span style="color:Red;font-size:smaller">*必須</span>:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
								<asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
									ControlToValidate="ConfirmPassword" ErrorMessage="パスワードの確認入力が必要です。" 
									ToolTip="パスワードの確認入力が必要です。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator><br />
									<span style="font-size:smaller">確認のためにパスワードを再入力してください。</span>
							</td>
						</tr>
						<tr>
							<th align="right">
								<asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">電子メール:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="Email" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<th align="right">
								<asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">セキュリティの質問:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="Question" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<th align="right">
								<asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">セキュリティ返答:</asp:Label>
							</th>
							<td>
								<asp:TextBox ID="Answer" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<th align="center" colspan="2">
								<asp:CompareValidator ID="PasswordCompare" runat="server" 
									ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
									Display="Dynamic" ErrorMessage="パスワードと確認用パスワードは一致しなければなりません。" 
									ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
							</th>
						</tr>
						<tr>
							<td align="center" colspan="2" style="color:Red;">
								<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
							</td>
						</tr>
					</table>
				</ContentTemplate>
			</asp:CreateUserWizardStep>
			<asp:CompleteWizardStep runat="server" />
		</WizardSteps>
	</asp:CreateUserWizard>
	</div>
</asp:Content>

