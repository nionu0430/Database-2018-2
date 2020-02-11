
<%@ page import =  "java.sql.*"%>
<%@ page import =  "java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
session.invalidate();
%>
	
<script>
	   alert('로그아웃 완료');
	   document.location.href="db_2014253054main.jsp";
</script>
	
</body>
</html>