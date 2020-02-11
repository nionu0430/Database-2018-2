<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
public boolean isInteger( String input ) {
    try {
        Integer.parseInt( input );
        return true;
    }
    catch( Exception e ) {
        return false;
    }
	}
%>
<%!
public boolean isNumber( String input ) {
    try {
    	  Double.parseDouble(input);
          return true;
      } catch(NumberFormatException e) {
          return false;
	}
}
%>
<% 
request.setCharacterEncoding("UTF-8");
Connection con = null; 
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt =con.createStatement();
	

	String ID = request.getParameter("heroID");
	String PS = "1234"; //기본값은 1234
	PS = request.getParameter("PASSWORD");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String home = request.getParameter("home");
	String atk = request.getParameter("att");
	String def =request.getParameter("def");
	String hea = request.getParameter("hea");
	String pow = request.getParameter("pow");
	String inte =request.getParameter("int");
	String mana = request.getParameter("mana");
	String species = request.getParameter("species");
	String skill = request.getParameter("skill");
	String sql = null;

	///

	boolean speciesin = false;
	
	///////////종족명,스킬명-존재검사, id-중복검사 필요
	sql = "select ID From 용사 where ID=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,ID);
	rs = pstmt.executeQuery();

	if(ID.isEmpty())
	{
		%>	
		<script>
		      alert('용사 ID를 입력해주세요.');
		      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=b";
		 </script>
		<%
	}
	
	if(PS.isEmpty())
	{
		PS = "1234";
	}
	if(rs.next()) //id검사         //id 중복검사
	{
		%>	
		<script>
		      alert('중복된 아이디입니다.');
		      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=b";
		 </script>
		<%
	}

	pstmt.close();
	
	if(!skill.isEmpty()) //스킬입력시 해당스킬이 목록에 있는지 검사
	{
		sql = "Select 스킬명 From 스킬 where 스킬명=?";
		pstmt = con.prepareStatement(sql);
	
		pstmt.setString(1,skill);
		rs = pstmt.executeQuery();
		if(!rs.next())
		{
			%>	
			<script>
			      alert('없는 스킬입니다.');
			      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=b";
			 </script>
			<%
		}	
		pstmt.close();
	
		sql = "Select 스킬명 From 용사 where 스킬명=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,skill);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
			%>	
			<script>
			      alert('다른 용사가 사용중인 스킬입니다.');
			      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=b";
			 </script>
			<%
		}	
		pstmt.close();

	}


	if(!species.isEmpty()) //스킬입력시 해당스킬이 목록에 있는지 검사
	{
		sql = "select 종족명 from 종족 where 종족명=?";
		pstmt = con.prepareStatement(sql);
	
		pstmt.setString(1,species);
		rs = pstmt.executeQuery();
		if(rs.next())
		{
			speciesin = true;
		}	
		pstmt.close();
		if(!speciesin)
		{
			%>	
			<script>
			      alert('없는 종족입니다.');
			      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=b";
			 </script>
			<%
		}
	}

	sql = "insert into 용사 values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	
	
	pstmt.setString(1,ID);
	pstmt.setString(2,PS);
	pstmt.setString(3,name);
	pstmt.setString(4,age);
	pstmt.setString(5,home);
	pstmt.setString(6,atk);
	pstmt.setString(7,def);
	pstmt.setString(8,hea);
	pstmt.setString(9,pow);
	pstmt.setString(10,inte);
	pstmt.setString(11,mana);
	pstmt.setString(12,species);
	pstmt.setString(13,skill);
		
	pstmt.executeUpdate();
	
		//int r = pstmt.executeUpdate();
		// pstmt.excuteQuery() : select 
		// pstmt.excuteUpdate() : insert, update, delete ..


	rs.close();
	stmt.close();
	pstmt.close();
	%>	
	<script>
	      alert('등록 성공.');
	      document.location.href="adminfunction.jsp";
	 </script>
	<%
} 
catch (SQLException e)
{ 
	System.out.println("[SQL Error : " + e.getMessage() + "]");
}


%>

</body>
</html>