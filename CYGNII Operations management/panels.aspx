<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panels.aspx.cs" Inherits="CYGNII_Operations_management.panels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<script>

    function reply_click() {

        var x = document.getElementById("Employee");
        if (x.style.display === "none") {
            x.style.display = "block";
        } else {
            x.style.display = "none";
        }
    }
</script>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="side-nav">
                <div class="user">
                    <img src="images/user.png" class="user-img" />
                    <div>
                        <h2>chaitanya kadam</h2>
                        <p>chaitanya@gmil.com</p>
                    </div>
                    <img src="images/star.png" class="star-img" />
                </div>
                <ul>
                    <li>
                        <img src="images/dashboard.png" /><p>Dashboard</p>
                    </li>

                    <li onclick="reply_click()">
                        <img src="images/reports.png" /><p>Employee</p>
                    </li>
                    <li id="Employee" style="display: none;">
                        <ul>
                            <li><a href="EmpAttendance.aspx"><p>Employee Attendance </p></a></li>
                            <li><a href="EmployeeDetails.aspx"><p>Employee Details </p></a></li>
                            <li><a href="EmployeeLeave.aspx"><p>Leave</p></a></li>
                            <li><a href="EmpLeaveList.aspx"><p>Leave List</p></a></li>
                        </ul>
                    </li>
                    <li>
                        <img src="images/rewards.png" /><p>Project</p>
                    </li>
                    <li>
                        <img src="images/setting.png" /><p>User settings</p>
                    </li>
                </ul>
                <ul>
                    <li>
                        <img src="images/logout.png" /><p>Logout</p>
                    </li>
                </ul>
            </div>
        </div>

    </form>
</body>
</html>
