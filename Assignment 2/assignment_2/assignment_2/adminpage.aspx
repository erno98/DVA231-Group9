<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="assignment_2.adminpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Username: <asp:TextBox runat="server" Text="Username"></asp:TextBox><br />
            Password: <asp:TextBox runat="server" Text="Password"></asp:TextBox><br />
            <asp:Button runat="server" Text="Login" />
        </div>
    </form>
</body>
</html>
