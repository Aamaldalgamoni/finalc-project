﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteBooks.aspx.cs" Inherits="projectc_.khalid.DeleteBooks" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update Book - Library Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
        }

        .card {
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2 {
            font-weight: bold;
            color: #343a40;
        }

        .form-control {
            height: 40px;
            margin-bottom: 10px;
        }

        .btn {
            height: 40px;
        }

        .alert {
            display: none;
        }

        .mt-3 {
            text-align: center;
        }

        #btnUpdateBook {
            color: #ffffff;
        }

        h4 {
            text-align: center;
            font-weight: bold;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

            .btn-group .btn {
                width: 20%;
                margin-right: 10px; /* Space between buttons */
            }

                .btn-group .btn:last-child {
                    margin-right: 0;
                }

        .row .col-md-6 {
            margin-bottom: 10px;
        }

        .mt-4 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center mb-4">📚 Library Management System</h2>

            <!-- 📌 Add or Edit Books Form -->
            <div class="card p-3 mb-3">
                <h4 class="mb-3">Delete Books</h4>
                <div class="row">
                    <!-- Search Field and Button Aligned -->
                    <div class="col-md-12">
                        <div class="input-group">
                            <asp:TextBox ID="searchTxt" runat="server" CssClass="form-control" placeholder="Enter Book ID to Search"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:Button ID="searchBtn" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="searchBtn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

                <!-- Book Details -->
                <div class="row">
                    <div class="col-md-6">
                        <asp:TextBox ID="BookID" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="Title" runat="server" CssClass="form-control" placeholder="Book Title"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <asp:TextBox ID="Author" runat="server" CssClass="form-control" placeholder="Author"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="Genre" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                    </div>
                </div>
                <div class="mt-3">
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Book" CssClass="btn btn-warning" OnClick="DeleteButton_Click" />
                </div>
            </div>

            <!-- Success/Error Alerts -->
            <div id="alertContainer" class="mt-4">
                <div id="successAlert" class="alert alert-success" role="alert">
                    Book Data Updated Successfully!
               
                </div>
                <div id="errorAlert" class="alert alert-danger" role="alert">
                    Book Not Found!
               
                </div>
            </div>
            <!-- Added Buttons Section -->
            <div class="mt-4 btn-group">
                <asp:Button ID="btnEditBook" runat="server" Text="Go To Edit Book" CssClass="btn btn-primary" OnClick="btnEditBook_Click" />
                <asp:Button ID="btnDeleteBook" runat="server" Text="Go To Add Book" CssClass="btn btn-primary" OnClick="btnAddeBook_Click" />
                <asp:Button ID="btnRequestBorrow" runat="server" Text="Go To Request Borrow" CssClass="btn btn-success" OnClick="btnRequestBorrow_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Toggle success/error alerts based on actions
        function showAlert(isSuccess) {
            const successAlert = document.getElementById('successAlert');
            const errorAlert = document.getElementById('errorAlert');
            if (isSuccess) {
                successAlert.style.display = 'block';
                errorAlert.style.display = 'none';
            } else {
                successAlert.style.display = 'none';
                errorAlert.style.display = 'block';
            }
        }
    </script>
</body>
</html>
