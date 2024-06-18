<%-- 
    Document   : myorder
    Created on : Jun 13, 2022, 3:35:42 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <style>
            .groundy {
                background: linear-gradient(110deg, #aafcff 60%, #6fdde6 60%);
            }

            .mtop {
                margin-top: 6%;
            }
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
            .payment-method__item-name {
                font-size: 20px;
                padding-left: 20px;
            }
            .payment-method__item {
                display: flex;
                align-items: center;
                border: 1px solid #D9D9D9;
                border-radius: 16px;
                padding: 15px 20px;
                margin-bottom: 1rem;
            }
            .payment-method__item-icon-wrapper img {
                min-width: 100px;
                max-height: 100px;
                max-width: 100px;
                padding-left: 40px;
                image-rendering: -webkit-optimize-contrast;
            }
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
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">

            <div class="groundy" id="layoutSidenav_content">
                <h2 class=" title-order">List Slider</h2>
                <div class="container">
                    <table class="table table-striped table-bordered" id="sortTable">
                        <thead>
                            <tr>
                                <th>Slider_ID</th>
                                <th>Slider_Title</th>
                                <th>Slider_Image</th>
                                <th>link</th>
                                <th>Status</th>
                                <th>Update_Status</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${SliderList}" var="c">
                                <tr>
                                    <td><a href="slider-detail?sliderId=${c.sliderId}">
                                            ${c.sliderId}</a></td>
                                    <td>${c.sliderTitle}</td>
                                    <td> <a href="slider-detail?sliderId=${c.sliderId}"><img  src="${c.sliderImage}" width="200px"></a></td>
                                    <td>${c.backlink}</td>
                                    <td>
                                        ${c.status == true ? ' <span class="text-success"> <b>Show</b> </span>' :  '<span class = "text-danger"> <b>Hiden</b></span>'}
                                    </td>

                                    <td>
                                        <form action="update-false-slider">
                                            <input type="hidden" name="sliderId" value="${c.sliderId}">
                                            <label class="switch">
                                                <input type="checkbox" name="status" onchange="this.form.submit()" ${c.status ? 'checked' : ''}>
                                                <span class="slider ${c.status ? 'round-primary' : 'round-danger'}"></span>
                                            </label>


                                        </form>

                                    </td>

                                    <td>
                                        <a href="delete-slider?sliderId=${c.sliderId}" class="btn btn-danger mr-2">Delete</a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $('#sortTable').DataTable({
                                                            "language": {
                                                                "decimal": "",
                                                                "emptyTable": "No data available in table",
                                                                "info": " _START_ đến _END_ của _TOTAL_ bản ghi",
                                                                "infoEmpty": "Hiển thị 0 to 0 of 0 bản ghi",
                                                                "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                                                                "infoPostFix": "",
                                                                "thousands": ",",
                                                                "lengthMenu": "Hiển thị _MENU_ bản ghi",
                                                                "loadingRecords": "Loading...",
                                                                "processing": "",
                                                                "search": "Tìm kiếm:",
                                                                "zeroRecords": "Không tìm thấy kết quả nào",
                                                                "paginate": {
                                                                    "first": "F",
                                                                    "last": "L",
                                                                    "next": "Sau",
                                                                    "previous": "Trước"
                                                                },
                                                                "aria": {
                                                                    "sortAscending": ": activate to sort column ascending",
                                                                    "sortDescending": ": activate to sort column descending"
                                                                }
                                                            },
                                                            "lengthMenu": [5, 10, 15, 20] // Chọn số lượng bản ghi trên trang
                                                        });
                                                    });
        </script>

    </body>
</html>
