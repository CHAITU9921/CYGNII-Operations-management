<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmpDetails.aspx.cs" Inherits="CYGNII_Operations_management.EmpDetails" %>
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
    <h1 style="text-align: center; margin-top:10px; font-size: 30px;">Employee Details</h1>
    <div style="width: 100%; align-content:center; height: 50px; padding-top: 5px; padding-left: 10px;">
    <div style="width: 47%; float: left;  font-size: 20px;">
    <asp:Label ID="lblempnmae" runat="server" Text="Employee ID :"></asp:Label>
    </div>
        <div style="width: 50%; float: right;">
             <asp:TextBox ID="txtempid" type="Number" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
             </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblcygniiEmployeecode" runat="server" Text="Employee Name :"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtEmpName" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblCW" runat="server" Text="Date Of Joining:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
               <asp:TextBox ID="txtDOfJoin" type="date" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>    
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblCustomer" runat="server" Text="Gender:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:RadioButtonList ID="rblistgender"  RepeatDirection="Horizontal" runat="server" RepeatLayout="Flow" Width="174px">
                    <asp:ListItem>&nbsp; Male &nbsp; </asp:ListItem>
                    <asp:ListItem>&nbsp; Female </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div style="width: 100%; height: 50px; margin-left:1px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 18px;">
                <asp:Label ID="lblAttendanceStatus" runat="server" Text="Date Of Birth:"></asp:Label>
            </div>
            <asp:TextBox ID="txtDOfBirth" type="date" Width="163px" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>

        </div>
         <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblemailid" runat="server" Text="Email ID:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtEmailId" type="email" onblur="requiredField(this)" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="Required" ControlToValidate="txtEmailId" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblIntime" runat="server" Text="Phone No:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtPhoneNo" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>     
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblOuttime" runat="server" Text="Pan No:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtPan" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>          
            </div>
        </div>
        <br />
        <center>
            <div style="align-items: center";>
            <asp:Button ID="save" class="btn btn-success" runat="server" Text=" Save" Width="80px" OnClick="save_Click" />
               
            <asp:Button ID="btnUpdate" class="btn btn-dark" runat="server" Text="Update" Width="80px" ForeColor="White" BackColor="#006666" OnClick="btnUpdate_Click" />
            
             <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" Width="80px" ForeColor="White"  OnClick="btnDelete_Click" />
            
           <asp:Button ID="btnClear" class="btn btn-warning" runat="server" Text="Clear" Width="80px" ForeColor="White"  OnClick="btnClear_Click" />
            </div>
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>
    </div>


</asp:Content>
