<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmpAttendance.aspx.cs" Inherits="CYGNII_Operations_management.EmpAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content onload="display_cts()" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

        .datetoday {
            position: fixed;
            top: 160px;
            left: 10%;
        }

        .customer {
            position: fixed;
            top: 250px;
            left: 7%;
            justify-content: space-between;
            flex-direction: row;
            transition: width 0.5s;
            align-content: center;
        }

        .txtcust {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            border-radius: 15px;
        }

        .status {
            position: fixed;
            top: 200px;
            left: 20%;
            width: 194px;
            height: 29px;
            padding-top:5px;
            padding-left:25px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            transition: width 0.5s;
        }

        .lblstatus {
            position: fixed;
            top: 200px;
            left: 7%;
            
        }

        .msglbl {
            position: fixed;
            top: 400px;
            left: 0%;
            height:20px;
            width: auto;
              background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            border-radius: 15px;
        }
        .btnTimeIn{
            position: fixed;
            top: 300px;
            left: 20%;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            border-radius: 15px;

        }
        .btnTimeOut{
            position: fixed;
            top: 300px;
            left: 45%;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            border-radius: 15px;

        }

        .TimeInOut {
            width: 550px;
            height: 400px;
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
        /* clock*/
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap');

        .clock {
            color: #000;
            font-size: 16px;
            text-align: center;
            position: absolute;
            top: 27%;
            left: 30%;
            transform: translate(-50%,-50%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 20px
        }



        #m {
            margin: 0 10px 0 10px
        }

        .bg {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 4em;
            height: 4em;
            background: inherit;
            position: relative;
            border-radius: 50%;
            box-shadow: inset -2px -2px 5px rgba(255, 255, 255, 1), inset 3px 3px 5px rgba(0, 0, 0, 0.2)
        }

        .attimg {
            width: 220px;
            height: 220px;
            position: fixed;
            top: 90px;
            left: 330px;
        }

        .bg:last-child {
            display: flex;
            align-items: center;
            justify-content: center;
            background: inherit;
            position: relative;
            margin-left: 20px;
            width: 2em;
            height: 2em;
            font-size: 16px;
            padding: 15px;
            border-radius: 50%;
            box-shadow: inset -2px -2px 5px rgba(255, 255, 255, 1), inset 3px 3px 5px rgba(0, 0, 0, 0.2)
        }
    </style>

     <%--  sweetalert--%>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script src="sweetalert2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2/dist/sweetalert2.min.css">

    <script type="text/javascript">

        //clock

        document.addEventListener("DOMContentLoaded", function (event) {

            realTime();

        });


        function realTime() {

            var date = new Date();
            var hour = date.getHours();
            var min = date.getMinutes();
            var sec = date.getSeconds();
            var halfday = "AM";
            halfday = (hour >= 12) ? "PM" : "AM";
            hour = (hour == 0) ? 12 : ((hour > 12) ? (hour - 12) : hour);
            hour = update(hour);
            min = update(min);
            sec = update(sec);
            document.getElementById("h").innerText = hour;
            document.getElementById("m").innerText = min;
            document.getElementById("s").innerText = sec;
            document.getElementById("ap").innerText = halfday;

            setTimeout(realTime, 1000);
        }

        function update(k) {
            if (k < 10) { return "0" + k; } else { return k; }
        }
    </script>
    <div class="container-fluid container-border TimeInOut">

        <h1 style="text-align: right;">Time In/Out</h1>
        <br />
        <label class="datetoday" id="todaydate" style="height: 20px;" text=""></label>
        <script> 
            const date = new Date();
            const options = {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            };
            const formattedDate = date.toLocaleDateString('en-US', options);
            document.getElementById("todaydate").innerText = "Today : " + formattedDate;

        </script>
        <img class="attimg" src="images/attendance.png" />
        <center>
            <div class="clock">
                <div class="bg">
                    <h2 id="h">12</h2>
                </div>
                <h2>:</h2>
                <div class="bg">
                    <h2 id="m">20</h2>
                </div>
                <h2>:</h2>
                <div class="bg">
                    <h2 id="s">00</h2>
                </div>
                <div class="bg">
                    <h2 style="font-size: 18px;" id="ap">AM</h2>
                </div>
            </div>
            <label id="dateclock" text=""></label>
            <asp:Label ID="lblstatus" class="lblstatus" runat="server" Text="Status : "></asp:Label>
            <asp:DropDownList ID="ddlAttendanceStatus" AutoPostBack="true"  class=" container-border  status" runat="server" OnSelectedIndexChanged="ddlAttendanceStatus_SelectedIndexChanged">
                <asp:ListItem>---select---</asp:ListItem>
                <asp:ListItem>Work from home</asp:ListItem>
                <asp:ListItem>Out Door working</asp:ListItem>
                <asp:ListItem>Present in office</asp:ListItem>
            </asp:DropDownList>
            <br />

            <div class="customer">
                <asp:Label ID="lblCustomer" runat="server" Text="Customer : "></asp:Label>
                &nbsp;<asp:TextBox ID="txtCustomer" Class="txtcust" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btntimein" class="btn btn-warning btnTimeIn" runat="server" Text="Time IN" Width="120px" OnClick="btntimein_Click" />
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btntimeout" class="btn btn-danger btnTimeOut" runat="server" Text="Time OUT" Width="120px" OnClick="btntimeout_Click" />
            <br />
            &nbsp; 
            <br />

        </center>
        <asp:Label ID="lblSuccessMessage" Class="msglbl"  runat="server" Text="" ForeColor="Green"></asp:Label>
   <asp:Label ID="lblErrorMessage" Class="msglbl" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
</asp:Content>
