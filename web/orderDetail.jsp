<%-- 
    Document   : OrderDetail
    Created on : Jun 5, 2024, 11:40:07 PM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <style>
        .product-image {
            width: 100%;
            height: auto;
            background-color: #f8f9fa;
        }
        .product-details {
            margin-top: 20px;
        }
        .product-price {
            font-size: 24px;
            color: #ff0000;
        }
        .product-description {
            margin-top: 10px;
        }
    </style>
    <body>
        <%@include file="includes/navbar.jsp"%>
        <c:set var="i" value="${requestScope.orderDetail}"/>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a style="text-decoration: none" href="home">Home</a></li>
                    <li class="breadcrumb-item"><a style="text-decoration: none" href="profile">My Account</a></li>
                    <li class="breadcrumb-item"><a style="text-decoration: none" href="myOrder">My Order</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><strong>Order Detail</strong></li>
                </ol>
            </nav>
            <hr>
            <div class="row justify-content-end">
                <div class="col-md-12">
                    <form method="get" action="${pageContext.request.contextPath}/myOrder">
                        <div class="input-group rounded mb-5">
                            <div class="input-group-prepend">
                                <select class="form-select" id="searchCriteria" name="criteria">
                                    <option value="Serial">Serial Number</option>
                                    <option value="Category">Category</option>
                                    <option value="ProductName">Product Name</option>
                                    <option value="Brand">Brand</option>
                                    <option value="Price">Price</option>
                                    <option value="<%= request.getParameter("criteria") %>" <%=(request.getParameter("criteria") == null) ? "" : "selected" %> hidden><%= request.getParameter("criteria") %></option>
                                </select>
                            </div>
                            <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" id="searchInput" name="query"/>
                            <span class="input-group-text border-0 px-0 py-0" id="search-addon">
                                <button type="submit" style="background: none; border: none; padding: 0;">
                                    <i class="fas fa-search mx-5"></i>
                                </button>
                            </span>
                            <input class="form-control input_type" type="text" name="action" value="searchViewDetail" hidden>
                            <input class="form-control input_type" type="text" name="id" value="${requestScope.orderId}" hidden>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="mb-5">
                        <label>Filter by:</label>
                        <select class="form-select" onchange="location = this.value;">
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}">None</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&filter=Laptop">Laptop</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&filter=Mouse">Mouse</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&filter=Headphone">Headphone</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&filter=Keyboard">Keyboard</option>
                            <option value="<%= request.getParameter("filter") %>" <%=(request.getParameter("filter") == null) ? "" : "selected" %> hidden><%= request.getParameter("filter") %></option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="mb-5">
                        <label>Sort by:</label>
                        <select class="form-select" onchange="location = this.value;">
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}">None</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&sortBy=SerialNumber">Serial Number</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&sortBy=CategoryName">Category</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&sortBy=ProductName">Name</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&sortBy=ProductBrand">Brand</option>
                            <option value="<%=request.getContextPath()%>/myOrder?action=viewDetail&id=${requestScope.orderId}&sortBy=Price">Price</option>
                            <option value="<%= request.getParameter("sortBy") %>" <%=(request.getParameter("sortBy") == null) ? "" : "selected" %> hidden><%= request.getParameter("sortBy") %></option>
                        </select>
                    </div>
                </div>
            </div>
            <c:if test="${main != null}">
                <form id="myform" action="myOrder" method="post">
                    <div class="row d-flex align-items-center">
                        <div class="form-group">
                            <label class="col-lg-3 control-label"></label>
                            <div class="col-lg-8">
                                <input class="form-control input_type" type="text" name="action" value="viewDetail" hidden>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label"></label>
                            <div class="col-lg-8">
                                <input class="form-control input_type" type="text" name="id" value="${requestScope.orderId}" hidden>
                            </div>
                        </div>
                        <label for="page-size-select" class="ps-3"><strong>Products per page:</strong></label>
                        <div class="col-md-1">
                            <select class="form-select" name="pageSize" id="page-size-select" onchange="document.getElementById('myform').submit()">
                                <option value="5" <c:if test="${pageSize == 5}">selected</c:if>>5</option>
                                <option value="10" <c:if test="${pageSize == 10}">selected</c:if>>10</option>
                                <option value="15" <c:if test="${pageSize == 15}">selected</c:if>>15</option>
                                <option value="20" <c:if test="${pageSize == 20}">selected</c:if>>20</option>
                                </select>
                                <noscript>
                                <button type="submit" value="Go">Go</button>
                                </noscript>
                            </div>
                        </div>
                    </form>
            </c:if>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Serial Number</th>
                        <th scope="col">Category</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Price</th>
                        <th scope="col">View</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${requestScope.orderDetail != null}">
                        <c:forEach items="${requestScope.orderDetail}" var="i" varStatus="loop">
                            <tr class="fw-normal" >
                                <td>${loop.index +1}</td>
                                <td>${i.serialNumber}</td>
                                <td>${i.categoryName}</td>
                                <td>${i.productName}</td>
                                <td>${i.productBrand}</td>
                                <td>${i.getFormattedPrice()}VND</td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/myOrder?action=viewProductDetail&id=${i.productId}" 
                                       class="text-primary" title="View" data-toggle="tooltip">
                                        <button class="btn btn-light text-primary"><i class="fa-solid fa-eye"></i></button>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </c:if>
            </table>
            <c:if test="${main != null}">

                <div>
                    <p>Showing ${start} to ${end} of ${totalProducts} entries</p>
                </div>
                <ul class="pagination">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="myOrder?pageSize=${pageSize}&index=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach begin="1" end="${num}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="myOrder?pageSize=${pageSize}&index=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage < num}">
                        <li class="page-item">
                            <a class="page-link" href="myOrder?pageSize=${pageSize}&index=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </c:if>

        </div>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    </body>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <%@include file="includes/footer.jsp"%>
    <%@include file="includes/finish.jsp"%>
</html>
