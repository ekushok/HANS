<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="MessageBox.aspx.cs"
	Inherits="MemberPages_MessageBox" Title="HANS(ハンズ)|メッセージBOX %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../CSS/Friend.css" rel="stylesheet" type="text/css" />
	<link href="../CSS/bbs.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:Panel ID="GivenPanel" runat="server">
	<h1>あなた宛のメッセージ一覧</h1>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
			DataSourceID="SqlDataSource1" onrowcommand="GridView1_RowCommand" >
			<Columns>
				<asp:CommandField SelectText="開く" ShowSelectButton="True" />
				<asp:BoundField DataField="from" HeaderText="from" SortExpression="from" />
				<asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
				<asp:BoundField DataField="read" HeaderText="read" SortExpression="read" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
			DeleteCommand="DELETE FROM [message] WHERE [id] = @id" InsertCommand="INSERT INTO [message] ([from], [to], [subject], [message], [datetime], [read]) VALUES (@from, @to, @subject, @message, @datetime, @read)"
			SelectCommand="SELECT [id], [from], [to], [subject], [message], [datetime], [read] FROM [message] WHERE ([to] = @to) ORDER BY [id] DESC"
			UpdateCommand="UPDATE message SET [read] = N'既読' WHERE (id = @id)">
			<SelectParameters>
				<asp:ControlParameter ControlID="UserLabel" Name="to" PropertyName="Text" Type="String" />
			</SelectParameters>
			<DeleteParameters>
				<asp:Parameter Name="id" Type="Decimal" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="from" Type="String" />
				<asp:Parameter Name="to" Type="String" />
				<asp:Parameter Name="subject" Type="String" />
				<asp:Parameter Name="message" Type="String" />
				<asp:Parameter DbType="DateTime" Name="datetime" />
				<asp:Parameter Name="read" Type="String" />
				<asp:Parameter Name="id" Type="Decimal" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="from" Type="String" />
				<asp:Parameter Name="to" Type="String" />
				<asp:Parameter Name="subject" Type="String" />
				<asp:Parameter Name="message" Type="String" />
				<asp:Parameter DbType="DateTime" Name="datetime" />
				<asp:Parameter Name="read" Type="String" />
			</InsertParameters>
		</asp:SqlDataSource>
		<div class="given">
		<asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
			DataSourceID="SqlDataSource2" onitemcommand="FormView1_ItemCommand" 
			onitemdeleted="FormView1_ItemDeleted" oniteminserted="FormView1_ItemInserted">
			<InsertItemTemplate>
				タイトル:
				<asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' 
					Height="23px" Width="334px" />
				<br />
				本文:<br />
				<asp:TextBox ID="messageTextBox" runat="server" Text='<%# Bind("message") %>' 
					Rows="5" TextMode="MultiLine" Width="400px" />
				<br />
				<asp:Button ID="Button2" runat="server" Text="送信" CommandName="Insert" />
				<asp:Button ID="Button3" runat="server" CommandName="Cancel" Text="キャンセル" />
			</InsertItemTemplate>
			<ItemTemplate>
				<h4>From:
				<asp:Label ID="fromLabel" runat="server" Text='<%# Bind("from") %>' /></h4>
				<hr />
				<h4>タイトル:
				<asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>' /></h4>
				<hr />
				本文:
				<asp:Label ID="messageLabel" runat="server" Text='<%# Bind("message") %>' />
				<br /><hr />
				<h6><asp:Label ID="datetimeLabel" runat="server" Text='<%# Bind("datetime") %>' /></h6>
				<hr />
				<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
					CommandName="New" Text="返信" />
				<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
					CommandName="Delete" Text="削除" />
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Back">戻る</asp:LinkButton>
			</ItemTemplate>
		</asp:FormView>
		</div>
		<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
			ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
			SelectCommand="SELECT * FROM [message] WHERE ([id] = @id);UPDATE message SET [read] = N'既読' WHERE (id = @id);" 
			DeleteCommand="DELETE FROM [message] WHERE [id] = @id" 
			InsertCommand="INSERT INTO message([from], [to], subject, message, datetime, [read]) VALUES ( @from , @to , @subject, @message, CURRENT_TIMESTAMP, N'未読')" 
			
			
			UpdateCommand="UPDATE [message] SET [from] = @from, [to] = @to, [subject] = @subject, [message] = @message, [datetime] = @datetime, [read] = @read WHERE [id] = @id">
			<SelectParameters>
				<asp:ControlParameter ControlID="GridView1" Name="id" 
					PropertyName="SelectedValue" Type="Decimal" />
			</SelectParameters>
			<DeleteParameters>
				<asp:Parameter Name="id" Type="Decimal" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="from" Type="String" />
				<asp:Parameter Name="to" Type="String" />
				<asp:Parameter Name="subject" Type="String" />
				<asp:Parameter Name="message" Type="String" />
				<asp:Parameter DbType="Date" Name="datetime" />
				<asp:Parameter Name="read" Type="String" />
				<asp:Parameter Name="id" Type="Decimal" />
			</UpdateParameters>
			<InsertParameters>
				<asp:ControlParameter ControlID="UserLabel" Name="from" PropertyName="Text" 
					Type="String" />
				<asp:Parameter Name="subject" Type="String" />
				<asp:Parameter Name="message" Type="String" />
				<asp:Parameter DbType="DateTime" Name="datetime" />
				<asp:Parameter Name="read" Type="String" />
				<asp:ControlParameter ControlID="ToLabel" Name="to" PropertyName="Text" />
			</InsertParameters>
		</asp:SqlDataSource>
	</asp:Panel>
	<asp:Panel ID="DonePanel" runat="server" Visible="false">
	<h2>送信完了しました！！</h2>
	<div class="BT">
		<asp:Button ID="BackButton" runat="server" Text="戻る" 
			onclick="BackButton_Click" />
		</div>
	</asp:Panel>
	<asp:Label ID="UserLabel" runat="server" Text="Label" Visible="false"></asp:Label>
	<asp:Label ID="ToLabel" runat="server" Text="Label" Visible="false"></asp:Label>
</asp:Content>
