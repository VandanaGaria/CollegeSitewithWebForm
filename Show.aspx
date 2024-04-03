<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="College.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            background-color: beige;
        }

        .container {
            text-align: left;
            margin-top: 20px;
            position: relative;
            padding-left: 40px; /* Added padding to the left to avoid collision with hamburger menu */
        }

        .title {
            font-weight: bold;
            text-transform: uppercase;
            font-size: 24px;
            margin-top: 0;
            margin-left: 10px; /* Adjusted margin for the title */
            display: inline-block;
        }

        .table {
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

        .table th, .table td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        .table th {
            background-color: burlywood;
            color: white;
            text-align: center;
        }
        .theading {
    text-align: center; /* Center align text within table header cells */
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

        .hamburgur {
            position: absolute;
            left: 0;
            top: 0;
            margin-left: 10px; /* Added margin to adjust position */
        }

        .btn-export {
            float: right;
            margin-right: 10px;
        }

        .btn-add-college {
            float: right;
            background-color: burlywood;
            font-family: "Times New Roman", Times, serif;
            font-weight: bold;
            padding: 5px 15px;
            font-size: 15px;
            margin-right: 10px;
        }

        .btn-add-college:hover {
            background-color: sandybrown;
            border-color: saddlebrown;
            color: black;
        }

       /* .search-button {
            width: 100%;
            margin-top: 5px;
        }*/

        .search-button {
     width: 100%;
     margin-top: 5px;


 }
    </style>

    <div class="container mt-5">
        <button class="hamburgur" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"><span class="glyphicon ">&#9776;</span></button>
        <h2 class="title"><u>College List</u></h2>

        <asp:Button ID="btnExportPDF" runat="server" Text="Export to PDF" CssClass="btn btn-beige-brown btn-export" OnClick="btnExportPDF_Click" />

        <asp:Button ID="btnAddCollege" runat="server" Text="Add College" CssClass="btn btn-beige-brown btn-add-college" OnClick="btnAddCollege_Click" />

        <div class="drawer">
            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel"><center>College Name</center></h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body ">
                    <div class="dropdown mt-3 text-center" runat="server" id="offcanvasBody">
                    </div>
                    <div class="dropdown mt-2 text-center" runat="server">
                        <ul id="offcanvasMiddleName" runat="server"></ul>
                    </div>
                    <div class="dropdown mt-2 text-center" runat="server" id="offcanvaslastName">
                    </div>
                </div>
            </div>
        </div>
        <div class="container custom-height"><asp:Table ID="tblData" runat="server" CssClass="table table-bordered table-striped">
</asp:Table></div>
        
       

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

        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%= tblData.ClientID %>').DataTable();
            });
        </script>
        
        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%= tblData.ClientID %>').DataTable();
        $('.searchTextBox').on('input', function () {
            var columnIndex = $(this).closest('td').index();
            var searchValue = $(this).val().toLowerCase();
            console.log("Search value entered for column " + columnIndex + ": " + searchValue);
            var table = $('#<%= tblData.ClientID %>').DataTable();
            table.column(columnIndex).search(searchValue).draw();
        });
            });
    </script>

    </div>
</asp:Content>
