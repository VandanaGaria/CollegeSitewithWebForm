<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCollege.aspx.cs" Inherits="College.AddCollege" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: "Times New Roman", Times, serif;
            background-color: beige;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: burlywood;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        .btn-beige {
            background-color: sandybrown;
            font-family: "Times New Roman", Times, serif;
            border-color: burlywood;
            font-weight: bold;
            padding: 5px 15px; 
            font-size: 15px; 
        }
        .btn-beige:hover {
            background-color: beige;
            border-color: burlywood;
        }
        .drawer {
            position: fixed;
            top: 0;
            left: -300px; 
            width: 300px;
            height: 100%;
            background-color: burlywood; 
            overflow-y: auto; 
            transform: translateX(0);
            transition: transform 0.3s ease-in-out;
            font-family: "Times New Roman", Times, serif; 
        }

        .drawer.open {
            transform: translateX(300px); 
        }

        .drawer-content {
            padding: 20px;
            background-color: beige; 
        }

        .close-drawer-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }

        
        #addedRecordsDrawer h3 {
            font-size: 18px; 
            font-weight: bold; 
            text-decoration: underline;
        }
    </style>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-beige text-center">
                        <h5 class="mb-0"><strong>ADD COLLEGE</strong></h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:Label for="txtCollegeName" class="form-label" runat="server">College Name</asp:Label>
                            <asp:TextBox runat="server" class="form-control" id="txtCollegeName" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" for="txtCollegeID" class="form-label">College ID</asp:Label>
                            <asp:TextBox runat="server" type="text" class="form-control" id="txtCollegeID" />
                        </div>
                        <div class="mb-3">
                            <asp:Label runat="server" for="txtCollegeState" class="form-label">College State</asp:Label>
                            <asp:TextBox type="text" runat="server" class="form-control" id="txtCollegeState" />
                        </div>
                        <div class="text-center">
                            <asp:Button runat="server" class="btn btn-beige btn-lg" OnClick="Button1_Click" Text="SUBMIT"/>
                            <a href="Show.aspx" class="btn btn-beige btn-lg">BACK TO LIST</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    
</asp:Content>
