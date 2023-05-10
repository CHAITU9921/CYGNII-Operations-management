<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="CYGNII_Operations_management.ForgetPassword" %>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
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
        <div class="header">Forgot Password</div>
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
                    <asp:TextBox ID="txtuserName" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" class="auto-style1" placeholder="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtRetypepassword" TextMode="Password" runat="server" class="form-control" placeholder="Retype Password"></asp:TextBox>
                </div>
                 <div class="form-group"> 
                     <asp:Button ID="btnForgotpass" runat="server" class="btn bg-olive btn-block" Text="Reset my password" OnClick="btnForgotpass_Click" />
                 </div>
                     <a href="login.aspx" class="text-center"> < Back To Login</a>
                <div class="form-group">
                    <asp:Literal ID="LitErrorMsg" runat="server"></asp:Literal>
                </div>
            </div>

        </form>


    </div>


    <!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>




