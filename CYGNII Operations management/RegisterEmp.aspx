<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterEmp.aspx.cs" Inherits="CYGNII_Operations_management.RegisterEmp" %>

<!DOCTYPE html>
<html class="bg-black">
<head>
    <meta charset="UTF-8" content="">
    <title>Admin | Registration Page</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- bootstrap 3.0.2 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script src="sweetalert2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2/dist/sweetalert2.min.css">

</head>
<body class="bg-black" background="Index.html">
    <div class="form-box" id="login-box">
        <div class="header">Register New Membership</div>
        <form runat="server">
            <div class="body bg-gray">
                <div class="form-group">
                    <asp:DropDownList ID="ddlUserType" class="form-control" runat="server" Height="34px">
                        <asp:ListItem>Select User Type</asp:ListItem>
                        <asp:ListItem>Super Admin</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Employee</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <%--                    <input type="text" name="userid" class="form-control" placeholder="User ID" />--%>
                    <asp:TextBox ID="txtuserName" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <%--                    <input type="password" name="password" class="form-control" placeholder="Password" />--%>
                    <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <%--                    <input type="password" name="password2" class="form-control" placeholder="Retype password" />--%>
                    <asp:TextBox ID="txtRetypepassword" TextMode="Password" runat="server" class="form-control" placeholder="Retype Password"></asp:TextBox>
                </div>
            </div>
            <div class="footer">

                <%--                <button type="submit" class="btn bg-olive btn-block">Sign me up</button>--%>

                <asp:Button ID="btnSignUp" runat="server" class="btn bg-olive btn-block" Text="Sign up" OnClick="btnSignUp_Click" />

                <a href="login.aspx" class="text-center">Login...</a>
            </div>
            <div class="form-group">
                <asp:Literal ID="LitErrorMsg" runat="server"></asp:Literal>

            </div>
        </form>
    </div>


    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
