<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeShift.aspx.cs" Inherits="CYGNII_Operations_management.EmployeeShift" %>

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

        .auto-style1 {
            width: 591px;
            margin-left: 0px;
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

    <div class="container-fluid container-border " style="width: 550px; height: 100%; margin-left: auto; margin-right: auto; margin-bottom: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 20px;">
        <h1 style="text-align: center;">Employee Shifts</h1>

        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblshiftid" runat="server" Text="Shift Id :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtshiftid" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtshiftid" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblShiftCategory" runat="server" Text="Shift Category :"></asp:Label>
            </div>
            <asp:TextBox ID="txtShiftCategory" Width="163px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ErrorMessage="Required" ControlToValidate="txtShiftCategory" ForeColor="Red"
                ValidationGroup="a">
            </asp:RequiredFieldValidator>
            <div style="width: 50%; float: right;">
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblTotalTime" runat="server" Text="Total Time :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtTotalTime" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblStartTime" runat="server" Text="StartTime :"></asp:Label>
            </div>
            <asp:TextBox ID="txtStartTime" Width="163px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Required" ControlToValidate="txtStartTime" ForeColor="Red"
                ValidationGroup="a">
            </asp:RequiredFieldValidator>
            <div style="width: 50%; float: right;">
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblExitTime" runat="server" Text="ExitTime :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtExitTime" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtExitTime" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
         
        <br />
        <center>
            <div>
                <asp:Button ID="save" class="btn btn-success" runat="server" Text=" Save" Width="120px" OnClick="save_Click" />
                &nbsp; 
            <asp:Button ID="Update" class="btn btn-dark" runat="server" Text="Update" Width="120px" ForeColor="White" BackColor="#006666" OnClick="Update_Click" />
            </div>
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>
    </div>
</asp:Content>
