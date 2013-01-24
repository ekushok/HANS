<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs"
	Inherits="MemberPages_Profile" Title="HANS(ハンズ)|プロフィール" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../CSS/Friend.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<h1>
		あなたのプロフィール</h1>
	<asp:Panel ID="Panel1" runat="server">
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
		<div class="BT"><asp:Button ID="EditButton" runat="server" Text="プロフィールの編集" OnClick="EditButton_Click" />
	</div>
	</asp:Panel>
	<asp:Panel ID="Panel2" runat="server" Visible="False">
		<table>
			<tr>
				<th>
					ユーザ名
				</th>
				<td>
					<asp:LoginName ID="LoginName2" runat="server" />
				</td>
			</tr>
			<tr>
				<th>
					氏名
				</th>
				<td>
					姓<asp:TextBox ID="FamilyBox" runat="server"></asp:TextBox><br />
					名<asp:TextBox ID="FirstBox" runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<th>
					生年月日
				</th>
				<td>
					<asp:DropDownList ID="YearList" runat="server">
						<asp:ListItem>年</asp:ListItem>
						<asp:ListItem>1920</asp:ListItem>
						<asp:ListItem>1921</asp:ListItem>
						<asp:ListItem>1922</asp:ListItem>
						<asp:ListItem>1923</asp:ListItem>
						<asp:ListItem>1924</asp:ListItem>
						<asp:ListItem>1925</asp:ListItem>
						<asp:ListItem>1926</asp:ListItem>
						<asp:ListItem>1927</asp:ListItem>
						<asp:ListItem>1928</asp:ListItem>
						<asp:ListItem>1929</asp:ListItem>
						<asp:ListItem>1930</asp:ListItem>
						<asp:ListItem>1931</asp:ListItem>
						<asp:ListItem>1932</asp:ListItem>
						<asp:ListItem>1933</asp:ListItem>
						<asp:ListItem>1934</asp:ListItem>
						<asp:ListItem>1935</asp:ListItem>
						<asp:ListItem>1936</asp:ListItem>
						<asp:ListItem>1937</asp:ListItem>
						<asp:ListItem>1938</asp:ListItem>
						<asp:ListItem>1939</asp:ListItem>
						<asp:ListItem>1940</asp:ListItem>
						<asp:ListItem>1941</asp:ListItem>
						<asp:ListItem>1942</asp:ListItem>
						<asp:ListItem>1943</asp:ListItem>
						<asp:ListItem>1944</asp:ListItem>
						<asp:ListItem>1945</asp:ListItem>
						<asp:ListItem>1946</asp:ListItem>
						<asp:ListItem>1947</asp:ListItem>
						<asp:ListItem>1948</asp:ListItem>
						<asp:ListItem>1949</asp:ListItem>
						<asp:ListItem>1950</asp:ListItem>
						<asp:ListItem>1951</asp:ListItem>
						<asp:ListItem>1952</asp:ListItem>
						<asp:ListItem>1953</asp:ListItem>
						<asp:ListItem>1954</asp:ListItem>
						<asp:ListItem>1955</asp:ListItem>
						<asp:ListItem>1956</asp:ListItem>
						<asp:ListItem>1957</asp:ListItem>
						<asp:ListItem>1958</asp:ListItem>
						<asp:ListItem>1959</asp:ListItem>
						<asp:ListItem>1960</asp:ListItem>
						<asp:ListItem>1961</asp:ListItem>
						<asp:ListItem>1962</asp:ListItem>
						<asp:ListItem>1963</asp:ListItem>
						<asp:ListItem>1964</asp:ListItem>
						<asp:ListItem>1965</asp:ListItem>
						<asp:ListItem>1966</asp:ListItem>
						<asp:ListItem>1967</asp:ListItem>
						<asp:ListItem>1968</asp:ListItem>
						<asp:ListItem>1969</asp:ListItem>
						<asp:ListItem>1970</asp:ListItem>
						<asp:ListItem>1971</asp:ListItem>
						<asp:ListItem>1972</asp:ListItem>
						<asp:ListItem>1973</asp:ListItem>
						<asp:ListItem>1974</asp:ListItem>
						<asp:ListItem>1975</asp:ListItem>
						<asp:ListItem>1976</asp:ListItem>
						<asp:ListItem>1977</asp:ListItem>
						<asp:ListItem>1978</asp:ListItem>
						<asp:ListItem>1979</asp:ListItem>
						<asp:ListItem>1980</asp:ListItem>
						<asp:ListItem>1981</asp:ListItem>
						<asp:ListItem>1982</asp:ListItem>
						<asp:ListItem>1983</asp:ListItem>
						<asp:ListItem>1984</asp:ListItem>
						<asp:ListItem>1985</asp:ListItem>
						<asp:ListItem>1986</asp:ListItem>
						<asp:ListItem>1987</asp:ListItem>
						<asp:ListItem>1988</asp:ListItem>
						<asp:ListItem>1989</asp:ListItem>
						<asp:ListItem>1990</asp:ListItem>
						<asp:ListItem>1991</asp:ListItem>
						<asp:ListItem>1992</asp:ListItem>
						<asp:ListItem>1993</asp:ListItem>
						<asp:ListItem>1994</asp:ListItem>
						<asp:ListItem>1995</asp:ListItem>
						<asp:ListItem>1996</asp:ListItem>
						<asp:ListItem>1997</asp:ListItem>
						<asp:ListItem>1998</asp:ListItem>
						<asp:ListItem>1999</asp:ListItem>
						<asp:ListItem>2000</asp:ListItem>
						<asp:ListItem>2001</asp:ListItem>
						<asp:ListItem>2002</asp:ListItem>
						<asp:ListItem>2003</asp:ListItem>
						<asp:ListItem>2004</asp:ListItem>
						<asp:ListItem>2005</asp:ListItem>
						<asp:ListItem>2006</asp:ListItem>
						<asp:ListItem>2007</asp:ListItem>
						<asp:ListItem>2008</asp:ListItem>
						<asp:ListItem>2009</asp:ListItem>
						<asp:ListItem>2010</asp:ListItem>
					</asp:DropDownList>
					<asp:DropDownList ID="MonthList" runat="server">
						<asp:ListItem>月</asp:ListItem>
						<asp:ListItem>1</asp:ListItem>
						<asp:ListItem>2</asp:ListItem>
						<asp:ListItem>3</asp:ListItem>
						<asp:ListItem>4</asp:ListItem>
						<asp:ListItem>5</asp:ListItem>
						<asp:ListItem>6</asp:ListItem>
						<asp:ListItem>7</asp:ListItem>
						<asp:ListItem>8</asp:ListItem>
						<asp:ListItem>9</asp:ListItem>
						<asp:ListItem>10</asp:ListItem>
						<asp:ListItem>11</asp:ListItem>
						<asp:ListItem>12</asp:ListItem>
					</asp:DropDownList>
					<asp:DropDownList ID="DayList" runat="server">
						<asp:ListItem>日</asp:ListItem>
						<asp:ListItem>1</asp:ListItem>
						<asp:ListItem>2</asp:ListItem>
						<asp:ListItem>3</asp:ListItem>
						<asp:ListItem>4</asp:ListItem>
						<asp:ListItem>5</asp:ListItem>
						<asp:ListItem>6</asp:ListItem>
						<asp:ListItem>7</asp:ListItem>
						<asp:ListItem>8</asp:ListItem>
						<asp:ListItem>9</asp:ListItem>
						<asp:ListItem>10</asp:ListItem>
						<asp:ListItem>11</asp:ListItem>
						<asp:ListItem>12</asp:ListItem>
						<asp:ListItem>13</asp:ListItem>
						<asp:ListItem>14</asp:ListItem>
						<asp:ListItem>15</asp:ListItem>
						<asp:ListItem>16</asp:ListItem>
						<asp:ListItem>17</asp:ListItem>
						<asp:ListItem>18</asp:ListItem>
						<asp:ListItem>19</asp:ListItem>
						<asp:ListItem>20</asp:ListItem>
						<asp:ListItem>21</asp:ListItem>
						<asp:ListItem>22</asp:ListItem>
						<asp:ListItem>23</asp:ListItem>
						<asp:ListItem>24</asp:ListItem>
						<asp:ListItem>25</asp:ListItem>
						<asp:ListItem>26</asp:ListItem>
						<asp:ListItem>27</asp:ListItem>
						<asp:ListItem>28</asp:ListItem>
						<asp:ListItem>29</asp:ListItem>
						<asp:ListItem>30</asp:ListItem>
						<asp:ListItem>31</asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<th>
					性別
				</th>
				<td>
					<asp:DropDownList ID="SexList" runat="server">
						<asp:ListItem>男性</asp:ListItem>
						<asp:ListItem>女性</asp:ListItem>
						<asp:ListItem Selected="True">未選択</asp:ListItem>
					</asp:DropDownList>
				</td>
			</tr>
			<tr>
				<th>
					クラス
				</th>
				<td>
					<asp:TextBox ID="ClassBox" runat="server"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<th>
					趣味
				</th>
				<td>
					<asp:TextBox ID="HobbyBox" runat="server" Width="359px"></asp:TextBox>
				</td>
			</tr>
		</table>
		<div class="BT"><asp:Button ID="SaveButton" runat="server" Text="保存" OnClick="SaveButton_Click" /></div>
	</asp:Panel>
	<asp:Panel ID="Panel3" runat="server">
		<h2>フレンド申請が届いています。</h2>
		<asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
			DataKeyNames="ユーザ名" onselectedindexchanged="GridView1_SelectedIndexChanged" 
			onrowcommand="GridView1_RowCommand">
			<Columns>
				<asp:CommandField SelectText="承認" ShowSelectButton="True" />
				<asp:ButtonField CommandName="refuse" Text="拒否" />
			</Columns>
		</asp:GridView>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
			SelectMethod="getReq" TypeName="request"></asp:ObjectDataSource>
	</asp:Panel>
	<asp:Panel ID="NewMessagePanel" runat="server" Visible="false">
		<h2>未読メッセージがあります！</h2>
		<asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" 
			AutoGenerateColumns="False" Visible="false">
			<Columns>
				<asp:BoundField DataField="read" HeaderText="read" SortExpression="read" />
				<asp:BoundField DataField="to" HeaderText="to" SortExpression="to" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
			ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
			SelectCommand="SELECT [read], [to] FROM [message] WHERE (([to] = @to) AND ([read] = @read))">
			<SelectParameters>
				<asp:ControlParameter ControlID="UserLabel" Name="to" PropertyName="Text" 
					Type="String" />
				<asp:Parameter DefaultValue="未読" Name="read" Type="String" />
			</SelectParameters>
		</asp:SqlDataSource>
	</asp:Panel>
</asp:Content>
