<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="assignment_2.adminpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <link rel="stylesheet" href="static/css/styles.css">
    <link rel="stylesheet" href="static/css/styles_admin.css">
    <script src="static/js/script_admin.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="login-wrapper">
        <div id="login-form-wrapper">
            <form id="form1" runat="server">
                <asp:Panel runat="server" ID="Login_panel" Visible="true">
                    <div class="input-wrapper">
                        <p>Username</p><asp:TextBox ID="username" runat="server" placeholder="Username"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Controltovalidate="username" ErrorMessage="Please enter the Username"></asp:RequiredFieldValidator>
                    </div>

                    <div class="input-wrapper">
                        <p>Password</p><asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Controltovalidate="password" ErrorMessage="Please enter the  Password"></asp:RequiredFieldValidator>
                    </div>

                    <asp:Button runat="server" Text="Login" OnClick="Login_Click" id="submit_logo_btn"/>
                    <asp:Label runat="server" Text="Username or Password is incorrect!" ID="Login_false" Visible="false"></asp:Label>

                </asp:Panel>

                <asp:Panel ID="Login_true" runat="server" Visible="false">
                    <asp:Label runat="server" Text="Login Sucessful!" Visible="true" id="Login_success"></asp:Label>

                    <div id="upload_wrapper">
                        <asp:FileUpload id="FileUploadControl" runat="server" />
                        <asp:RequiredFieldValidator runat="server" Controltovalidate="FileUploadControl" ErrorMessage="Please select the file"></asp:RequiredFieldValidator> 
                        <asp:Button runat="server" Text="Upload File" OnClick="Upload_Click" id="upload_btn"/>
                    </div>

                    <asp:Label runat="server" ID="ValidFile" Text=""></asp:Label>

                    <asp:Button runat="server" Text="Logout" OnClick="Logout_Click" CausesValidation="false" id="logout_btn"/>
                </asp:Panel>

                <asp:Button ID="CoffeeButton" runat="server" Text="Back to the main page" OnClick="To_Coffeepage" CausesValidation="false" />
            </form>

        </div>
    </div>

    <div class="logo-wrapper">
        <img class="logo" src="static/img/logo.png">
    </div>
        
</body>
</html>
