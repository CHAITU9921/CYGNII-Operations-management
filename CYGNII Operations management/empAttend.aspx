<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="empAttend.aspx.cs" Inherits="CYGNII_Operations_management.empAttend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .container-border {
            border: 2px solid #ccc;
            border-radius: 15px;
            width: 100%;
            height: auto;
            background-color: #ccffe5;
            margin-right: auto;
            margin-left: auto;
            color: #066;
        }

        .attendance {
            width: 399px;
            height: 500px;
            position: fixed;
            top: 150px;
            left: 400px;
            padding: 30px 15px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            transition: width 0.5s;
            align-content: center;
        }
    </style>
    <script> 
        function requiredField(TextBox) {
            if (TextBox.value.length < 1) {
                //red border
                TextBox.style.borderColor = "#e74c3c";

            }
            else if (TextBox.type == "email") {
                console.log("this is an email type");

                if (TextBox.value.indexOf("@") != -1 && input.value.indexOf(".") != -1) {
                    //green border
                    TextBox.style.borderColor = "#2ecc71";
                }
                else {
                    //red border
                    TextBox.style.borderColor = "#e74c3c";
                }

            }
            else {
                //green border
                TextBox.style.borderColor = "#2ecc71";
            }
        }

    </script>

    <div class="container-fluid container-border attendance">
        <h1 style="text-align: center; font-size: 30px;">Attendance</h1>

        <div style="width: 100%; align-content:center; height: 50px; padding-top: 5px; padding-left: 10px;">
            <div style="width: 47%; float: left;  font-size: 20px;">
                <asp:Label ID="lblempnmae"   runat="server" Text="Employee Name :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">

                <asp:TextBox ID="txtEmpName"  style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtEmpName" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblcygniiEmployeecode" runat="server" Text="Cygnii Emp Code :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtcygniiEmployeecode" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtcygniiEmployeecode" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblCW" runat="server" Text="CW :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtCW" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblCustomer" runat="server" Text="Customer :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtCustomer" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtCustomer" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div style="width: 100%; height: 50px; margin-left:1px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 18px;">
                <asp:Label ID="lblAttendanceStatus" runat="server" Text="Attendance Status :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:DropDownList ID="ddlAttendanceStatus" style="height:35px; margin-left:-10px; width:181px; align-items: center;"  class="form-control" aria-label="Small"  runat="server">
                    <asp:ListItem>---select---</asp:ListItem>
                    <asp:ListItem>Work from home</asp:ListItem>
                    <asp:ListItem>Out Door working</asp:ListItem>
                    <asp:ListItem>Present in office</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Required" ControlToValidate="ddlAttendanceStatus" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblIntime" runat="server" Text="Intime :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtIntime" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtIntime" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblOuttime" runat="server" Text="Outtime :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtOuttime" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtOuttime" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <center>
            <div>
                <asp:Button ID="save" class="btn btn-success" runat="server" Text=" Save" Width="120px" OnClick="save_Click" />
                &nbsp; 
            <%--<asp:Button ID="Update" class="btn btn-dark" runat="server" Text="Update" Width="120px" ForeColor="White" BackColor="#006666" OnClick="Update_Click" />
            </div>--%>
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>
    </div>



</asp:Content>
