<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="College.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    body {
        font-family: "Times New Roman", Times, serif;
        background-color: beige;
    }

    .container {
        text-align: center;
    }

    .title {
        font-weight: bold;
        text-transform: uppercase;
        font-size: 24px;
        text-align: left;
    }

    .table {
        border-collapse: collapse;
        width: 100%;
    }

        .table th, .table td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        .table th {
            background-color: burlywood;
            color: white;
        }

    .btn-beige-brown {
        background-color: burlywood; 
        font-family: "Times New Roman", Times, serif;
        font-weight: bold;
        padding: 5px 15px;
        font-size: 15px;
        margin-right: 10px;
    }

        .btn-beige-brown:hover {
            background-color: sandybrown; 
            border-color: saddlebrown; 
            color: black; 
        }
</style>
        <asp:Label ID="label_check" runat="server"></asp:Label>
   
<div class="container mt-5">
    <div style="float: right;">
       <br />
        <br />
    </div>
    <h2 class="title"><u>College List</u></h2>
    <%--<asp:Button id ="Button_Search"/>--%>
    <hr />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Table ID="tblData" runat="server" CssClass="table table-bordered table-striped">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>College Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>College ID</asp:TableHeaderCell>
            <asp:TableHeaderCell>College State</asp:TableHeaderCell>
            <asp:TableHeaderCell>Actions</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <script type="text/javascript">
        function confirmDelete(item) {
            if (confirm('Are you sure you want to delete this record?')) {
                // If confirmed, perform postback to trigger server-side Delete_Click event
                __doPostBack('btnDelete', item);
                return true;
            } else {
                // If canceled, return false to cancel the click event
                return false;
            }
        }
    </script>
    <asp:Button ID="btnExportPDF" runat="server" Text="Export to PDF" CssClass="btn btn-beige-brown" OnClick="btnExportPDF_Click" />
</div>
</asp:Content>
