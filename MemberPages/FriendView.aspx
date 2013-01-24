<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="FriendView.aspx.cs"
	Inherits="MemberPages_FriendView" Title="HANS(ハンズ)|フレンド一覧" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../CSS/Friend.css" rel="stylesheet" type="text/css" />
	<link href="../CSS/bbs.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<h1>
		あなたのフレンド</h1>
	<asp:GridView ID="GridView2" runat="server" DataSourceID="ObjectDataSource2" DataKeyNames="ユーザ名"
		OnRowCommand="GridView2_RowCommand">
		<Columns>
			<asp:ButtonField CommandName="Friend" Text="詳細" />
		</Columns>
	</asp:GridView>
	<asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="getReq"
		TypeName="request"></asp:ObjectDataSource>
	<asp:Panel ID="Panel2" runat="server" Visible="false">
		<h2>
			<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>さんのプロフィール</h2>
		<table>
			<tr>
				<th>
					ユーザ名
				</th>
				<td>
					<asp:Label ID="UserLabel" runat="server" Text="Label"></asp:Label>
				</td>
			</tr>
			<tr>
				<th>
					氏名
				</th>
				<td>
					<asp:Label ID="FamilyLabel" runat="server" Text="　"></asp:Label>
					<asp:Label ID="FirstLabel" runat="server" Text="　"></asp:Label>
				</td>
			</tr>
			<tr>
				<th>
					生年月日
				</th>
				<td>
					<asp:Label ID="BirthLabel" runat="server" Text="　"></asp:Label>
				</td>
			</tr>
			<tr>
				<th>
					性別
				</th>
				<td>
					<asp:Label ID="SexLabel" runat="server" Text="　"></asp:Label>
				</td>
			</tr>
			<tr>
				<th>
					クラス
				</th>
				<td>
					<asp:Label ID="ClassLabel" runat="server" Text="　"></asp:Label>
				</td>
			</tr>
			<tr>
				<th>
					趣味
				</th>
				<td>
					<asp:Label ID="HobbyLabel" runat="server" Text="　"></asp:Label>
				</td>
			</tr>
		</table>
		<div class="BT">
			<asp:Button ID="MessageButton" runat="server" Text="メッセージの送信" OnClick="MessageButton_Click" /></div>
		<h2>
			<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>さんのフレンド</h2>
		<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand">
			<Columns>
				<asp:ButtonField CommandName="Friend" Text="詳細" />
			</Columns>
		</asp:GridView>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getReq"
			TypeName="request"></asp:ObjectDataSource>
		<h2>
			<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>さんの投稿</h2>
		<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="RpeatSDS">
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
				<table id="Table1" runat="server">
					<tr id="Tr1" runat="server">
						<td id="Td1" runat="server">
							<table id="itemPlaceholderContainer" runat="server">
								<tr runat="server" id="itemPlaceholder">
								</tr>
							</table>
						</td>
					</tr>
					<tr id="Tr2" runat="server">
						<th id="Th1" runat="server">
							<asp:DataPager ID="DataPager1" runat="server">
								<Fields>
									<asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
								</Fields>
							</asp:DataPager>
						</th>
					</tr>
				</table>
			</LayoutTemplate>
		</asp:ListView>
		<asp:SqlDataSource ID="RpeatSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
			SelectCommand="SELECT id, twuser AS 'ユーザ名', text, twtime FROM tweet WHERE (twuser = @twuser)">
			<SelectParameters>
				<asp:ControlParameter ControlID="UserLabel" Name="twuser" PropertyName="Text" Type="String" />
			</SelectParameters>
		</asp:SqlDataSource>
	</asp:Panel>
	<asp:Panel ID="MessagePanel" runat="server" Visible="false">
		<h2>
			<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>さんへメッセージ作成</h2>
		<asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="MessageSDS"
			DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
			<InsertItemTemplate>
				タイトル:
				<asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' Height="23px"
					Width="334px" />
				<br />
				本文:<br />
				<asp:TextBox ID="messageTextBox" runat="server" Text='<%# Bind("message") %>' Rows="5"
					TextMode="MultiLine" Width="400px" />
				<br />
				<asp:Button ID="Button2" runat="server" Text="送信" CommandName="Insert" />
			</InsertItemTemplate>
		</asp:FormView>
		<div class="BT">
			<asp:Button ID="MCanncelButton" runat="server" Text="キャンセル" OnClick="MCanncelButton_Click" />
		</div>
		<asp:SqlDataSource ID="MessageSDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
			InsertCommand="INSERT INTO message([from], [to], subject, message, datetime, [read]) VALUES ( @from , @to , @subject, @message, CURRENT_TIMESTAMP, N'未読')">
			<InsertParameters>
				<asp:ControlParameter ControlID="Label3" Name="from" PropertyName="Text" Type="String" />
				<asp:ControlParameter ControlID="UserLabel" Name="to" PropertyName="Text" Type="String" />
				<asp:Parameter Name="subject" Type="String" />
				<asp:Parameter Name="message" Type="String" />
				<asp:Parameter Name="datetime" DbType="DateTime" />
			</InsertParameters>
		</asp:SqlDataSource>
	</asp:Panel>
	<asp:Panel ID="DonePanel" runat="server" Visible="false">
		<h2>
			送信完了しました！！</h2>
		<div class="BT">
			<asp:Button ID="BackButton" runat="server" Text="戻る" OnClick="BackButton_Click" />
		</div>
	</asp:Panel>
	<asp:Label ID="Label4" runat="server" Text="Label" Visible="false"></asp:Label>
</asp:Content>
