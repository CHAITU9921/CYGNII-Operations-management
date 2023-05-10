<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="CYGNII_Operations_management.ApproveLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <header class="panel-heading">
        <div class="col-md-6 col-md-offset-4">
            <h1>Employee Leave List</h1>
        </div>
    </header>

    <style type="text/css">
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

        .clsStatus {
            position: fixed;
            top: 160px;
            left: 16.5%;
            font-size: 13px;
            padding: 10px 8px 10px 14px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;

            
        }
    </style>
    <asp:DropDownList Class="clsStatus" ID="ddlstatus" runat="server">
        <asp:ListItem>Accept</asp:ListItem>
        <asp:ListItem>Reject</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="gv" AutoGenerateSelectButton="true" CssClass="table table-striped table-bordered table-hover" PageSize="10" runat="server" AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" EnableModelValidation="True" OnSelectedIndexChanged="gv_SelectedIndexChanged">
    </asp:GridView>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>
