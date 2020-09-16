<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="assignment_2.adminpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel runat="server" ID="Login_panel" Visible="true">
                Username: <asp:TextBox ID="username" runat="server" Text="Username"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" Controltovalidate="username" ErrorMessage="Please enter a Username"></asp:RequiredFieldValidator>
                <br />
                Password: <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" Controltovalidate="password" ErrorMessage="Please enter a Password"></asp:RequiredFieldValidator>
                <br />
                <asp:Button runat="server" Text="Login" OnClick="Login_Click"/>
                <br />
                <asp:Label runat="server" Text="Username or Password is incorrect!" ID="Login_false" Visible="false"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Login_true" runat="server" Visible="false">
                <asp:Label runat="server" Text="Login Sucessful!" Visible="true"></asp:Label>
                <br />
               <!-- File-Location: <asp:TextBox runat="server" ID="filename" Text="Please enter a File-Location"></asp:TextBox> -->
                File-Location: <asp:FileUpload id="FileUploadControl" runat="server" />
                <asp:RequiredFieldValidator runat="server" Controltovalidate="filename" ErrorMessage="Please enter a File-Location"></asp:RequiredFieldValidator>
                <br />
                <asp:Button runat="server" Text="Upload File" OnClick="Upload_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
