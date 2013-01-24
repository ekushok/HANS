<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="HANS(ハンズ)|ログイン" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="CSS/Login.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div>
		<img src="images/HAL.png" style="height: 350px; width: 577px" />
    </div>
    <div class="login">
    <asp:Login ID="Login1" runat="server" 
		CreateUserText="会員登録" CreateUserUrl="~/Register.aspx" Height="103px">
		<LayoutTemplate>
			<table border="0" cellpadding="1" cellspacing="0" 
				style="border-collapse:collapse;">
				<tr>
					<td>
						<table border="0" cellpadding="0" style="height:103px;">
							<tr>
								<th align="center" colspan="2">
									ログイン</th>
							</tr>
							<tr>
								<th align="right">
									<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">ユーザー名:</asp:Label>
								</th>
								<td>
									<asp:TextBox ID="UserName" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
										ControlToValidate="UserName" ErrorMessage="ユーザー名が必要です。" ToolTip="ユーザー名が必要です。" 
										ValidationGroup="Login1">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<th align="right">
									<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">パスワード:</asp:Label>
								</th>
								<td>
									<asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
									<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
										ControlToValidate="Password" ErrorMessage="パスワードが必要です。" ToolTip="パスワードが必要です。" 
										ValidationGroup="Login1">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<th align="left" colspan="2">
									<asp:CheckBox ID="RememberMe" runat="server" Text="次回のために保存" />
								</th>
							</tr>
							<tr>
								<td align="center" colspan="2" style="color:Red; background-color:#e2e3ed;">
									<asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="ログイン" 
										ValidationGroup="Login1" />
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/Register.aspx">会員登録</asp:HyperLink>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</LayoutTemplate>
	</asp:Login>
	</div>
</asp:Content>

