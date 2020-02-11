
<%@ page import =  "java.sql.*"%>
<%@ page import =  "java.util.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>분석가 기능</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
%>
<h3 align="center">ANALYST FUNCTION</h3>
<hr style="border: solid 3px red;">
<form action = "checklogin.jsp" method = "POST">
	<% if(session.getAttribute("id")==null) {%>
		ID: <input type = "text" name = "ID">
		PS: <input type = "password" name = "PS">
		<input type = "submit" value = "login">
	<%}else {%>
		<%=session.getAttribute("id") %> <br><button type = "button"  onclick = "location.href='logout.jsp'" >로그아웃 </button>
		<button type = "button"  onclick = "location.href='adminfunction.jsp'" >관리자 기능 </button>
		<button type = "button"  onclick = "location.href='battlehelper.jsp'" >전투도우미 </button>
		
	<%} %><button type = "button"  onclick = "location.href='db_2014253054main.jsp'" >메인페이지 </button>
<hr>
<%

request.setCharacterEncoding("UTF-8");
PreparedStatement pstmt= null;
PreparedStatement pstmt2= null;
PreparedStatement pstmt3;
PreparedStatement pstmt4;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;

String sql = null;
String sql2 = null;
String sql3 = null;
String sql4 = null;
Connection con = null; 
try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt =con.createStatement();
	
	/////////////////////////////////////
	%>
	용사 상황표  <br>총스탯, 숫자 <br>
	<table border = 1 cellpadding =3 cellspacing = 0 >
		<tr>
		<td align ="center" width = 50>숫자 </td> 
		<td align ="center" width = 150>공격력총합 </td> 
		<td align ="center"width = 150>방어력총합 </td>
		
		</tr>
	
	<%
	
	
sql = "select count(ID) as 숫자 from 용사 ";
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next())
	{	
		int count =  rs.getInt("숫자");
		
		%>
			<tr>
			<td align ="center" width = 100> <%=count %></td>

		<%
	}
	pstmt.close();
	
	
	sql = "select * from 용사 ";
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	
	int finalatk=0;//초기화
	int finaldef=0;
	
	while (rs.next())
	{	
		int atk =  rs.getInt("공격력");
		int def =  rs.getInt("방어력");
		String species = rs.getString("종족명");
		String skill = rs.getString("스킬명");
		String ID = rs.getString("ID");
		
		sql2 = "select * from 종족 where 종족명=?"; //종족에 대한 쿼리문
		
		sql4 = "select ID,sum(공격력_증가) as 공증,sum(방어력_증가) as 방증,sum(힘_증가) as 힘증,sum(지능_증가) as 지증 from 아이템 where ID=? group by ID"; //아이템에 대한 쿼리문
		
		if(species!=null) //데이터베이스 내부에 종족이 저장되어 있다면 종족에 대한 값이 있다.
		{
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1,species);
			rs2 = pstmt2.executeQuery();
			//용사의 스텟의 퍼센트 
			rs2.next();
			int gatk=rs2.getInt("공격력보정");
			int gdef=rs2.getInt("방어력보정");
			
			atk = atk*gatk/100;
			def = def*gdef/100;
			
			pstmt2.close();
		}
		
		pstmt4 = con.prepareStatement(sql4);
		pstmt4.setString(1,ID);
		rs4 = pstmt4.executeQuery();
		
		if(rs4.next()) //사용중인 장비들이 있음
		{
			
			int gatk=rs4.getInt("공증");
			int gdef=rs4.getInt("방증");
			atk = atk + gatk;
			def =def + gdef;		
		}
		
		
		finalatk= finalatk +atk;
		finaldef =finaldef+def;
		pstmt4.close();	
	}
	pstmt.close();
	

	%>
	

		<td align ="center" width = 100> <%=finalatk %></td>
		<td align ="center" width = 100> <%=finaldef %></td>
	</tr>
	
	<%
	
	
	//////////////////////////////////////
	
	%></table><hr>
	  <br>종족별 현황 <br>
	<table border = 1 cellpadding =3 cellspacing = 0 >
	<tr>
	<td align ="center" width = 50>종족이름 </td> 
	<td align ="center" width = 150>용사의 수 </td> 
	</tr>

<%

sql = "select 종족명, count(종족명) as 숫자 from 용사 group by 종족명 ";

pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next())
{	
	String species = rs.getString("종족명");
	int count =  rs.getInt("숫자");
	if(species!=null)
	{
		%>
		<tr>
		<td align ="center" width = 100> <%=species %></td>
		<td align ="center" width = 100> <%=count %></td>

	<%
	}
	
}


%></table><hr><%
	//////////////////////////////////////////////////////////////////////
	%>
	마물 상황표 <br>
	<table border = 1 cellpadding =3 cellspacing = 0 >
		<tr>
		<td align ="center" width = 50>총 군단 수 </td> 
		<td align ="center" width = 50>총 병력 수  </td> 
		<td align ="center" width = 150>공격력총합 </td> 
		<td align ="center"width = 150>방어력총합 </td>
		<td align ="center" width = 150>이동력총합 </td> 
		<td align ="center"width = 150>사기총합 </td>ㄴ
		</tr>
	
	<%
	
	sql = "select count(마물군단이름) as 숫자 from 마물군단";
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next())
	{	
		int count =  rs.getInt("숫자");
		
		%>
			<tr>
			<td align ="center" width = 100> <%=count %></td>

		<%
	}
	pstmt.close();
	
	
	sql = "select sum(병력수) as 병사 from 마물군단 ";
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next())
	{	
		int unit = rs.getInt("병사");

		
		%>
		
		<td align ="center" width = 100> <%=unit %></td>
		
		
		<%
	}
	pstmt.close();
	///////////////////////////
	sql = "select * from 마물군단 ";
	
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	finalatk =0;
	finaldef = 0;
	int finalspeed =0;
	int finalfight = 0;
	
	while(rs.next())
	{	
		String name = rs.getString("마물군단이름");
		int atk = rs.getInt("총공격력");
		int def = rs.getInt("총방어력");
		int speed = rs.getInt("이동력");
		int fight = rs.getInt("사기");
		
		
		
		sql2 = "select 마물군단이름 ,sum(군단공격력보정) as 공보, sum(군단방어력보정) as 방보, sum(군단이동력보정) as 이보, sum( 군단사기보정) as 사보 from 마물군단지휘, 마물장군 where 마물군단이름 =? and 마물군단지휘.마물장군이름 = 마물장군.마물장군이름 group by 마물군단이름";
		
		pstmt2 = con.prepareStatement(sql2);
		pstmt2.setString(1,name);
		rs2 = pstmt2.executeQuery();
		
		
		if(rs2.next()) //지휘를 받고있음
		{
			int gatk=rs2.getInt("공보");
			int gdef=rs2.getInt("방보");
			int gspeed=rs2.getInt("이보");
			int gfight=rs2.getInt("사보");
			atk = atk *gatk/100;
			def = def *gdef/100;
			speed = speed* gspeed/100;
			fight  =fight  *gfight/100;

			
		}
		
		finalatk =finalatk +atk;
		finaldef = finaldef +def;
		finalspeed = finalspeed+speed;
		finalfight = finalfight +fight;
	}
	pstmt.close();
	
	%>
	<td align ="center" width = 100> <%=finalatk%></td>
	<td align ="center" width = 100> <%=finaldef %></td>
	<td align ="center" width = 100> <%=finalspeed%></td>
	<td align ="center" width = 100> <%=finalfight %></td>
	</tr>
	<%
	
	%></table><%

	
} 
catch (SQLException e)
{ 
	System.out.println("[SQL Error : " + e.getMessage() + "]");
}

%>

</body>
</html>