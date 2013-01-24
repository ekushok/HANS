<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="Bbs.aspx.cs"
	Inherits="MemberPages_Bbs" Title="HANS(ハンズ)|つぶやく？" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../CSS/bbs.css" rel="stylesheet" type="text/css" />
	<link href="../CSS/Friend.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<h1>あなたとフレンドの投稿</h1>
	<asp:Label ID="UserLabel" runat="server" Text="Label" Visible="false"></asp:Label>
	<asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="sds"
		DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
		<InsertItemTemplate>
			<h4>あなたの近況を投稿しよう！</h4>
			<asp:TextBox ID="textTextBox" runat="server" Text='<%# Bind("text") %>' Height="4em"
				Rows="4" Width="400px" MaxLength="255" TextMode="MultiLine" />
			<br />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="空コメントを投稿することはできません"
				ControlToValidate="textTextBox"></asp:RequiredFieldValidator>
			<br />
			<asp:Button ID="Button1" runat="server" CommandName="Insert" Text="つぼやく" />
		</InsertItemTemplate>
	</asp:FormView>
	<asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
		DeleteCommand="DELETE FROM [tweet] WHERE [id] = @id" InsertCommand="INSERT INTO tweet(twuser, text, twtime) VALUES (@twuser, @text, CURRENT_TIMESTAMP)"
		SelectCommand="SELECT [twuser], [text], [twtime], [id] FROM [tweet] ORDER BY [id] DESC"
		UpdateCommand="UPDATE [tweet] SET [twuser] = @twuser, [text] = @text, [twtime] = @twtime WHERE [id] = @id">
		<DeleteParameters>
			<asp:Parameter Name="id" Type="Decimal" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="twuser" Type="String" />
			<asp:Parameter Name="text" Type="String" />
			<asp:Parameter DbType="Date" Name="twtime" />
			<asp:Parameter Name="id" Type="Decimal" />
		</UpdateParameters>
		<InsertParameters>
			<asp:ControlParameter ControlID="UserLabel" Name="twuser" PropertyName="Text" Type="String" />
			<asp:Parameter Name="text" Type="String" />
			<asp:Parameter DbType="DateTime" Name="twtime" />
		</InsertParameters>
	</asp:SqlDataSource>
	<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
		DataSourceID="RpeatSDS">
		<ItemTemplate>
			<div class="tweet">
				<h4>
					@<%#Eval("ユーザ名") %></h4>
				<p>
					<%#Eval("text")%></p>
				<h6>	
					<%#Eval("twtime") %>
					</h6>
			</div>	
			<hr />
		</ItemTemplate>
		<LayoutTemplate>
			<table runat="server">
				<tr runat="server">
					<td runat="server">
						<table ID="itemPlaceholderContainer" runat="server">
							<tr runat="server" ID="itemPlaceholder">
							</tr>
						</table>
					</td>
				</tr>
				<tr runat="server">
					<th runat="server">
						<asp:DataPager ID="DataPager1" runat="server">
							<Fields>
								<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
									ShowLastPageButton="True" />
							</Fields>
						</asp:DataPager>
					</th>
				</tr>
			</table>
		</LayoutTemplate>
	</asp:ListView>
	<asp:SqlDataSource ID="RpeatSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
		SelectCommand="SELECT twuser AS 'ユーザ名', text, twtime, id FROM tweet ORDER BY id DESC">
	</asp:SqlDataSource>
</asp:Content>
