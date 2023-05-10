<%@ Page Title="" Language="C#" MasterPageFile="Emp.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="CYGNII_Operations_management.NewEmp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content onload="display_cts()" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            top: 80px;
            left: 150px;
            width: 250px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            transition: width 0.5s;
            align-content: center;
        }


        .TimeInOut {
            width: 550px;
            height: 300px;
            position: fixed;
            top: 155px;
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

        * {
            font-family: 'Roboto', sans-serif;
            text-align: center
        }

        body {
            background: #ebf5fc
        }

        .clock {
            color: #000;
            font-size: 16px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
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

        <h1 style="text-align: center;">Time In/Out</h1>
        <br />
        <input type="text" class="container-fluid container-border datetoday" id="todaydate" disabled />

        <script> 
            const date = new Date();
            const options = {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            };
            const formattedDate = date.toLocaleDateString('en-US', options);
            document.getElementById("todaydate").value = "Today : " + formattedDate;

        </script>
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

            <br />


            <asp:Button ID="btntimein" class="btn btn-warning" runat="server" Text="Time IN" Width="120px" OnClick="btntimein_Click" />
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btntimeout" class="btn btn-danger" runat="server" Text="Time OUT" Width="120px" OnClick="btntimeout_Click" />

            <br />

            &nbsp; 
            <br />
            <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>
        </center>

    </div>




</asp:Content>

