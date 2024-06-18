

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/head.jsp" %>
        <title>List-Cate</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <style>
            /* Rounded switch button */
            .switch {
                position: relative;
                display: inline-block;
                width: 40px; /* Đảm bảo switch có đủ không gian cho nút tròn */
                height: 20px; /* Chiều cao của switch button */
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
                border-radius: 20px; /* Kích thước góc bo tròn */
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 16px; /* Chiều cao của nút tròn */
                width: 16px; /* Chiều rộng của nút tròn */
                left: 2px; /* Khoảng cách từ nút tròn đến viền của switch */
                bottom: 2px; /* Khoảng cách từ nút tròn đến viền dưới của switch */
                background-color: white;
                transition: .4s;
                border-radius: 50%; /* Tạo hình tròn */
            }

            /* Định dạng cho trạng thái checked */
            input:checked + .slider {
                background-color: green;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                transform: translateX(20px); /* Dịch chuyển nút tròn sang phải */
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-info">
            <a class="navbar-brand" href="home">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="list-cate">List Category</a>
                    <a class="nav-item nav-link" href="AddCategory.jsp">Add Category</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <h3 class="text-center mb-4">Category List</h3>
            <div class="d-flex justify-content-between mb-3">
                <div id="categoryTable_length" class="dataTables_length"></div>
                <div id="categoryTable_filter" class="dataTables_filter"></div>
            </div>
            <!-- Search Form -->
            <!--            <form action="list-cate" method="get" class="form-inline mb-3">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search by category name" aria-label="Search" value="${param.search}">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </div>
                            </div>
                        </form>-->

            <!-- Table -->
            <table id="categoryTable" class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Update</th>
                        <th>Delete</th>
                        <th>Toggle Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${cate}" var="o">
                        <tr>
                            <td>${o.categoryId}</td>
                            <td>${o.categoryName}</td>
                            <td>
                                ${o.categoryStatus == 1 ? '<span class="text-success"><b>Show</b></span>' : '<span class="text-danger"><b>Hidden</b></span>'}
                            </td>
                            <td>
                                <a href="update-cate?categoryId=${o.categoryId}" class="btn btn-success mr-2">Update</a>
                            </td>
                            <td>
                                <a href="delete-cate?categoryId=${o.categoryId}" class="btn btn-danger mr-2">Delete</a>
                            </td>
                            <td>
                                <form action="toggle-cate" method="post">
                                    <input type="hidden" name="categoryId" value="${o.categoryId}">
                                    <input type="hidden" name="status" value="${o.categoryStatus == 1 ? 'true' : 'false'}">
                                    <label class="switch">
                                        <input type="checkbox" onchange="this.form.submit()" ${o.categoryStatus == 1 ? 'checked' : ''}>
                                        <span class="slider ${o.categoryStatus == 1 ? 'round-primary' : 'round-danger'}"></span>
                                    </label>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('#categoryTable').DataTable({
                                                    "language": {
                                                        "decimal": "",
                                                        "emptyTable": "No data available in table",
                                                        "info": "_START_ to _END_ of _TOTAL_ entries",
                                                        "infoEmpty": "Showing 0 to 0 of 0 entries",
                                                        "infoFiltered": "(filtered from _MAX_ total entries)",
                                                        "infoPostFix": "",
                                                        "thousands": ",",
                                                        "lengthMenu": "Show _MENU_ entries",
                                                        "loadingRecords": "Loading...",
                                                        "processing": "Processing...",
                                                        "search": "Search:",
                                                        "zeroRecords": "No matching records found",
                                                        "paginate": {
                                                            "first": "First",
                                                            "last": "Last",
                                                            "next": "Next",
                                                            "previous": "Previous"
                                                        },
                                                        "aria": {
                                                            "sortAscending": ": activate to sort column ascending",
                                                            "sortDescending": ": activate to sort column descending"
                                                        }
                                                    },
                                                    "lengthMenu": [5, 10, 15, 20] // Number of records per page options
                                                });
                                            });
        </script>
    </body>
</html>
