<%-- 
    Document   : useImportExport
    Created on : Jun 6, 2024, 12:47:48 PM
    Author     : hungp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/includes/adminNavbar.jsp"%>
        <br>
        <br>
        <br>
        <br>
        <div class="container-xl">
            <div class="row justify-content-end">
                <div class="col-md-12">
                    <form method="get" id="dynamicForm" action="${pageContext.request.contextPath}/userManager">
                        <div class="input-group-prepend">
                            <select class="form-select" id="operationSelect" name="operation" onchange="updateFileInput()">
                                <option value="Import">Import</option>
                                <option value="Export">Export</option>
                            </select>
                        </div>
                        <input type="file" class="form-control rounded" aria-label="File" aria-describedby="" id="fileInput" name="file"/>
                        <span class="input-group-text border-0 px-0 py-0" id="fileLabel">Select an Excel file to import</span>
                        <input type="hidden" name="action" value="search"/>
                    </form>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script>
    function updateFileInput() {
        const operationSelect = document.getElementById('operationSelect');
        const fileInput = document.getElementById('fileInput');
        const fileLabel = document.getElementById('fileLabel');

        if (operationSelect.value === 'Import') {
            fileInput.removeAttribute('webkitdirectory');
            fileInput.setAttribute('accept', '.xlsx, .xls');
            fileLabel.textContent = 'Select an Excel file to import';
        } else {
            fileInput.setAttribute('webkitdirectory', '');
            fileInput.removeAttribute('accept');
            fileLabel.textContent = 'Select a folder to export';
        }
    }

    // Initialize with the correct input settings
    updateFileInput();
</script>
</html>
