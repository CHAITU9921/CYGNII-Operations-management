<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="EmpProject.aspx.cs" Inherits="CYGNII_Operations_management.EmpProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

        .table table tbody tr td a,
        .table table tbody tr td span {
            position: relative;
            float: left;
            padding: 6px 12px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        .table table > tbody > tr > td > span {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #337ab7;
            border-color: #337ab7;
        }

        .table table > tbody > tr > td:first-child > a,
        .table table > tbody > tr > td:first-child > span {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
        }

        .table table > tbody > tr > td:last-child > a,
        .table table > tbody > tr > td:last-child > span {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
        }



        .table table > tbody > tr > td > a:hover,
        .table table > tbody > tr > td > span:hover,
        .table table > tbody > tr > td > a:focus,
        .table table > tbody > tr > td > span:focus {
            z-index: 2;
            color: #23527c;
            background-color: #eee;
            border-color: #ddd;
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
        <h1 style="text-align: center;">Employee Project</h1>

        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">

            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblprojecttitle" runat="server" Text="Projecttitle"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtprojecttitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtprojecttitle" ErrorMessage="Required" ForeColor="Red"
                    SetFocusOnError="True" ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>

        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lbldescription" runat="server" Text="Description"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtdescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Required" runat="server"
                    ControlToValidate="txtdescription" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblstartdate" runat="server" Text="StartDate"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtstartdate" type="date" Width="163px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtstartdate" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px; height: 22px;">
                <asp:Label ID="lblclientid" runat="server" Text="ClientID"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtclientid" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="txtclientid" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lblenddate" runat="server" Text="EndDate"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtenddate" Type="date" Width="163px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtenddate" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px; margin-bottom: 0px;">
                <asp:Label ID="lblstatus" runat="server" Text="Status"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
               <%-- <asp:TextBox ID="txtstatus" runat="server"></asp:TextBox>--%>

                  <asp:DropDownList ID="ddlstatus" Width="164px" Style="resize: none;" runat="server">
                    <asp:ListItem> Work in Progress</asp:ListItem>
                    <asp:ListItem>Done</asp:ListItem>
                    <asp:ListItem>Pending</asp:ListItem>
                    <asp:ListItem>Process</asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="ddlstatus" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 50%; float: left; font-size: 20px;">
                <asp:Label ID="lbllanguage" runat="server" Text="Language"></asp:Label>
            </div>

            <div style="width: 50%; float: right;">
                <asp:TextBox ID="txtlanguage" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txtlanguage" ErrorMessage="Required" ForeColor="Red"
                    ValidationGroup="a">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="width: 100%; height: 50px; padding-top: 10px; padding-left: 10px;">
            <div style="width: 443px; margin: auto auto auto 0px;">

                <center>
                    <asp:Button ID="btnsubmit" class="btn btn-success" ValidationGroup="a" runat="server" Text="Submit" Width="120px" OnClick="btnsubmit_Click" />
                    &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp; 
            <asp:Button ID="btndisplay" class="btn btn-dark" ValidationGroup="b" runat="server" Text="Display" Width="120px" ForeColor="White" BackColor="#006666" OnClick="btndisplay_Click" />
                </center>
                <br /> <br />
                <asp:Label ID="msglbl" runat="server" Text=""></asp:Label>


                

            </div>
        </div>
    </div>
    <br />
    <asp:GridView ID="gv"
                    CssClass="table table-striped table-bordered table-hover" PageSize="10"
                    runat="server"
                    AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" EnableModelValidation="True">
                </asp:GridView>
</asp:Content>
