
<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title> 2014253054login  </title>
</head>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	Connection con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt = con.createStatement();
	
	String ID = request.getParameter("ID");
	String PS = request.getParameter("PS");
	boolean login =false;
	String sql = null;
	
	ResultSet rs = stmt.executeQuery("Select * From admin");

	while(rs.next())
	{
		String InID = rs.getString("ID");
		String InPS = rs.getString("PS");
		if(InID.equals(ID) && InPS.equals(PS))
		{
			login = true;
			break;
		}
	}

	rs.close();
	stmt.close();
    con.close();
	
	if(login ==true)
	{
	session.setAttribute("id", ID);
	%>	
	<script>
	      alert('로그인 성공');
	      document.location.href="db_2014253054main.jsp";
	 </script>
	<%
	}
	else
	{
	%>	
	<script>
		  alert('로그인 실패');
		  document.location.href="db_2014253054main.jsp";
	 </script>
	<%
	}
	
%>
</body>
</html>