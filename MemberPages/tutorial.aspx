<%@ Page Language="C#" MasterPageFile="~/HALSNS.master" AutoEventWireup="true" CodeFile="tutorial.aspx.cs" Inherits="MemberPages_tutorial" Title="HANS(ハンズ)|ようこそ！" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../CSS/Friend.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>ようこそ！HANSへ！！</h1>
<p>HANSに登録していただき、ありがとうございます。<br />
よろしければ、まずはプロフィールの編集をしてください。</p>
	<div class="BT"><asp:Button ID="Button1" runat="server" Text="プロフィールページへ行く" 
			onclick="Button1_Click" /></div>
</asp:Content>

