<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmpLeave.aspx.cs" Inherits="CYGNII_Operations_management.EmpLeave" %>
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
    <h1 style="text-align: center; margin-top:10px; font-size: 30px;">Employee Leave</h1>
    <div style="width: 100%; align-content:center; height: 50px; padding-top: 5px; padding-left: 10px;">
    <div style="width: 47%; float: left;  font-size: 20px;">
    <asp:Label ID="lbldesignation" runat="server" Text="Designation:"></asp:Label>
    </div>
        <div style="width: 50%; float: right;">
         <asp:TextBox ID="txtdesignation" type="text" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
         </div>
        </div>
         
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblcygniiEmployeecode" runat="server" Text="Emp Name:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                
                <asp:TextBox ID="txtempname" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblLeavetype" runat="server" Text="LeaveType:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:DropDownList ID="ddlLeavetype" Width="164px"  style="height:35px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server">
                    <asp:ListItem> Earned leaves</asp:ListItem>
                    <asp:ListItem>Compensatory off</asp:ListItem>
                    <asp:ListItem>Sick Leave</asp:ListItem>
                    <asp:ListItem>Casual Leave</asp:ListItem>
                    <asp:ListItem>Maternity Leave</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        
        <div style="width: 100%; height: 50px; margin-left:1px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 18px;">
                <asp:Label ID="lblcomment" runat="server" Text="Comment:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" style="height:35px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" Width="164px"></asp:TextBox>
               
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblemailid" runat="server" Text="FromDate:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtfromdate" type="date" onblur="requiredField(this)" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>
               
            </div>
        </div>
      
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 47%; float: left; font-size: 20px;">
                <asp:Label ID="lblOuttime" runat="server" Text="ToDate:"></asp:Label>
            </div>
            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txttodate" type="date" style="height:25px; margin-left:-10px; width:180px; align-items: center;"  class="form-control" aria-label="Small" runat="server"></asp:TextBox>          
            </div>
        </div>
        <br />
        <center>
            <div style="align-items: center";>
            <asp:Button ID="btnApplyLeave" class="btn btn-success" runat="server" Text=" Apply Leave" Width="110px" OnClick="btnApplyLeave_Click" />
            <asp:Button ID="btnclear" class="btn btn-warning" runat="server" Text="Clear" Width="80px" OnClick="clear_Click" />
           </div>
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>
    </div>
  

</asp:Content>
