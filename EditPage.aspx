<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="College.EditPage" %>
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
    </style>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-beige text-center">
                        <h5 class="mb-0"><strong>EDIT COLLEGE</strong></h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:label for="txtCollegeName" class="form-label" runat="server">College Name</asp:label>
                            <asp:textbox runat="server" class="form-control" id="txtCollegeName" />
                        </div>
                        <div class="mb-3">
                            <asp:label runat="server" for="txtCollegeID" class="form-label">College ID</asp:label>
                            <asp:textbox runat="server" type="text" class="form-control" id="txtCollegeID" />
                        </div>
                        <div class="mb-3">
                            <asp:label runat="server" for="txtCollegeState" class="form-label">College State</asp:label>
                            <asp:textbox type="text" runat="server" class="form-control" id="txtCollegeState" />
                        </div>
                        <div class="text-center">
                            <asp:button runat="server" class="btn btn-beige btn-lg" OnClick="ButtonUpdate_Click" Text="UPDATE"/>
                            <a href="Show.aspx" class="btn btn-beige btn-lg">CANCEL</a>
                        </div>
                        <asp:Label ID="label_check" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

