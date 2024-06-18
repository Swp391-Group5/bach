<%-- 
    Document   : homeAdmin
    Created on : Mar 5, 2024, 11:28:56 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <%@include file="/includes/head.jsp" %>
    </head>
    <body>
        <%--<%@ include file="/includes/sidebar.jsp" %>--%>
        <%@include file="/includes/adminNavbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <div style="margin-top: 100px">
                        <h1>Admin</h1>
                        <p>Name: ${sessionScope.user.employeeName}</p>
                        <p>Phone No: ${sessionScope.user.employeePhoneNumber}</p>
                        <p>Email: ${sessionScope.user.employeeEmail}</p>
                        <%@include file="/includes/footer.jsp"%>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%--<%@include file="/includes/finish.jsp"%>--%>
</html>
