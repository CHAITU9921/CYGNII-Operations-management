<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="CYGNII_Operations_management.EmployeeDetails" %>

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
        <h1 style="text-align: center;">Employee Details</h1>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblempid" runat="server" Text="Employee ID:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtempid" type="Number" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblempnmae" runat="server" Text="Employee Name:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtEmpName" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblDOfJoin" runat="server" Text="Date Of Joining:"></asp:Label>
            </div>
            <asp:TextBox ID="txtDOfJoin" type="date" Width="163px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ErrorMessage="Required" ControlToValidate="txtDOfJoin" ForeColor="Red"
                ValidationGroup="a">
            </asp:RequiredFieldValidator>
            <div style="width: 50%; float: right;">
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblfromdate" runat="server" Text="Gender:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:RadioButtonList ID="rblistgender"  RepeatDirection="Horizontal" runat="server" RepeatLayout="Flow" Width="174px">
                    <asp:ListItem>&nbsp; Male &nbsp; </asp:ListItem>
                    <asp:ListItem>&nbsp; Female </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblDOfBirth" runat="server" Text="Date Of Birth:"></asp:Label>
            </div>
            <asp:TextBox ID="txtDOfBirth" type="date" Width="163px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Required" ControlToValidate="txtDOfBirth" ForeColor="Red"
                ValidationGroup="a">
            </asp:RequiredFieldValidator>
            <div style="width: 50%; float: right;">
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblemailid" runat="server" Text="Email ID:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtEmailId" type="email" onblur="requiredField(this)" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtEmailId" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblPhoneNo" runat="server" Text="Phone No:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtPhoneNo" MaxLength="10" type="number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtPhoneNo" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblPan" runat="server" Text="Pan No:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtPan" MaxLength="10" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtPan" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <br />
        <center>
            <div>
                <asp:Button ID="save" class="btn btn-success" runat="server" Text="Save" Width="120px" OnClick="save_Click" />
                &nbsp; 
            <asp:Button ID="Update" class="btn btn-dark" runat="server" Text="Update" Width="120px" ForeColor="White" BackColor="#006666" OnClick="Update_Click" />
                &nbsp; 
            <asp:Button ID="Delete" class="btn btn-danger" runat="server" Text="Delete" Width="120px" OnClick="Delete_Click" />
                &nbsp; 
            <asp:Button ID="clear" class="btn btn-warning" runat="server" Text="Clear" Width="120px" OnClick="clear_Click" />
            </div>
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>
    </div>
</asp:Content>
