<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vanny.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Vanny - Login</title>
    <link rel="stylesheet" href="Content/css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <div class="container-fluid h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <form id="Form1" action="" runat="server">
                    <img class="img-fluid rounded-circle  centrado" src="img/LogoLogin.png" alt="Vanny" />
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txtbUser" class="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtbPass" class="form-control" runat="server" TextMode="Password" required></asp:TextBox>
                        <div id="Recuerda" class="checkbox" style="padding-top: 10px; padding-bottom: 7px;">
                            <asp:CheckBox ID="chkRecuerda" Text="Recuérdame" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogin" class="btn btn-info btn-lg btn-block" OnClick="btnLogin_Click" runat="server" Text="Login" />
                        </div>
                        <div id="dvMensaje" runat="server" visible="false" class="alert alert-danger">
                            <%--<strong>Error!</strong>--%>
                            <asp:Label ID="lblMensaje" runat="server" />
                        </div>
                        <div id="recuperarPsw">
                            <a href="">He olvidado mi contraseña</a>
                        </div>
                </form>
            </div>
        </div>
    </div>

    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
</body>
</html>
