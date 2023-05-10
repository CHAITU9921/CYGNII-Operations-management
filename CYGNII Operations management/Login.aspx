<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CYGNII_Operations_management.Login" %>

<!DOCTYPE html>

 <html class="bg-black">
 <head>
     

    <title>Admin | Login</title>
    <!-- bootstrap 3.0.2 -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

   <%--  sweetalert--%>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script src="sweetalert2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2/dist/sweetalert2.min.css">

    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 100%;
            height: 34px;
            font-size: 14px;
            line-height: 1.428571429;
            color: #555;
            vertical-align: middle;
            border-radius: 0px !important;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: none;
            -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -webkit-border-radius: 0px !important;
            -moz-border-radius: 0px !important;
            border: 1px solid #ccc;
            padding: 6px 12px;
            background-color: #fff;
            background-image: none;
        }
    </style>
</head>
<body class="bg-black">

    <div class="form-box" id="login-box">
        <div class="header">Sign In</div>
        <form id="form1" runat="server">
        <%--<form id="form1" runat="server" action="EmployeeHome.aspx" method="post">--%>
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
                    <%--   <input type="password" name="password" class="auto-style1" placeholder="Password" />--%>
                    <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" class="auto-style1" placeholder="Password"></asp:TextBox>

                </div>
                <div class="form-group">
                    
                    <asp:CheckBox ID="CbRemberme" runat="server" Text="Remember me" />
                    
                </div>
                 <div class="form-group">
                    <asp:Literal ID="LitErrorMsg" runat="server"></asp:Literal>

            </div>
            </div>
            <div class="footer">
                <%--            <button type="submit" class="btn bg-olive btn-block">Sign me in</button>--%>
                <asp:Button ID="btnSignIn" class="btn bg-olive btn-block" runat="server" Text="Sign in" OnClick="btnSignIn_Click" />
                <p><a href="ForgetPassword.aspx">I forgot my password</a></p>

                <a href="RegisterEmp.aspx" class="text-center">Register a new membership</a>
            </div>
        </form>


    </div>


    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>
