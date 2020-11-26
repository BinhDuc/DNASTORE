<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Success</title>
</head>
<body>
    <h3><%=request.getAttribute("Message")%></h3>
    <a href="${pageContext.request.contextPath}/tatcasanpham" class="nav-link">Sản Phẩm</a>
</body>
</html>