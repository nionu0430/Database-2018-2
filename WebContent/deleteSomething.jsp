<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>Insert title here</title>
</head>
<body>


<% 
request.setCharacterEncoding("UTF-8");
Connection con = null; 
PreparedStatement pstmt= null;
PreparedStatement pstmt2= null;
String sql = null;
String sql2 = null;
ResultSet rs = null;

try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt =con.createStatement();

	String sorted = request.getParameter("sort");

	if(!(sorted==null))
	{ 
		String deleted = request.getParameter("deleted");
		String deleted2 = request.getParameter("deleted2");
		
		if(sorted.equals("Hero"))
		{
			
			sql = "delete from 용사 where ID=?";
			sql2 = "select * from 용사 where ID=?";
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			
			if(rs.next())
			{
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,deleted);
				pstmt.executeUpdate();
				pstmt.close();
				
				%>	
				<script>
				      alert('삭제완료.');
				      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";
				 </script>
				<%
			}
			
			pstmt2.close();
		}
		else if(sorted.equals("Skill"))
		{
			sql = "delete from 스킬 where 스킬명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%
		}
		else if(sorted.equals("Species"))
		{
			sql = "delete from 종족 where 종족명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%
		}
		else if(sorted.equals("Item"))
		{
			sql = "delete from 아이템 where 아이템이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%
		}
		else if(sorted.equals("MA"))
		{
			sql = "delete from 마물군단 where 마물군단이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%

		}
		else if(sorted.equals("MG"))
		{
			sql = "delete from 마물장군 where 마물장군이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%
		}
		else if(sorted.equals("Command"))
		{
			sql = "delete from 마물군단지휘 where 마물군단이름=? and 마물장군이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.setString(2,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%

		}
		else if(sorted.equals("Admin"))
		{
			sql = "delete from admin where ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,deleted);
			pstmt.executeUpdate();
			pstmt.close();
			%>	
			<script>
			      alert('삭제완료.');
			      document.location.href="adminfunction.jsp?";
			 </script>
			<%

		}
	}

} 
catch (SQLException e)
{ 
	System.out.println("[SQL Error : " + e.getMessage() + "]");
}


%>

</body>
</html>