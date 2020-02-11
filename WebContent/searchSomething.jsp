<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>관리자 기능-검색</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	Connection con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt = con.createStatement();
	PreparedStatement pstmt;
	ResultSet rs = null;
%>
<h3 align="center"> ADMINISTER FUNCTION - SEARCH  </h3>
<hr style="border: solid 3px red;">

<% 
if(session.getAttribute("id")!=null) {%>
	<%=
	session.getAttribute("id") %> <br><button type = "button"  onclick = "location.href='logout.jsp'" >로그아웃 </button>
	<button type = "button"  onclick = "location.href='db_2014253054main.jsp'" >메인페이지 </button>
	<%
} else
{
	%>
	<script>
	   alert('로그인이 필요한 기능입니다.');
	   document.location.href="db_2014253054main.jsp";
	</script>
	<%
}


%>
<hr>

<form action = "adminfunction.jsp" method = "GET">
	<input type ="radio" name = "adminfunc" value="a">용사
	<input type ="radio" name = "adminfunc" value="b">스킬
	<input type ="radio" name = "adminfunc" value="c">종족
	<input type ="radio" name = "adminfunc" value="d">아이템
	<input type ="radio" name = "adminfunc" value="e">마물군단
	<input type ="radio" name = "adminfunc" value="f">마물장군
	<input type ="radio" name = "adminfunc" value="g">관리자
	<input type ="radio" name = "adminfunc" value="h">마물지휘
	
	<select name ="adminfuncsel">
		<option value = "a">검색</option>
		<option value = "b">등록</option>
		<option value = "c">수정</option>
		<option value = "d">선택</option>
	</select>
	<input type = "submit" value = "확인">
</form>

<hr style="border: solid 1px green;">
<h4> 검색결과 </h4>  
종류 = 
<%


String selected = request.getParameter("search");
String sorts = request.getParameter("sort");
String sql = null;


%>
 <%=sorts%> , 검색어 =  <%=selected %> <br>
<button type = "button"  onclick = "javascript:history.back()" >이전 </button>
<hr style="border: solid 1px green;">

 <%
if(selected!="" && sorts!=null)
{
	%>
	<table border = 1 cellpadding =3 cellspacing = 0 >
	<%
	if(sorts.equals("Hero")) //용사 검색
	{
		%>
		<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 50>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 50>종족명 </td>
			<td align ="center" width = 50>스킬명</td>
		</tr>
		<%
		sql = "select * from 용사 where ID like ?";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			
			String ID = rs.getString("ID");
			String PS = rs.getString("PASSWORD");
			String name = rs.getString("이름");
			int age = rs.getInt("나이");
			String home = rs.getString("출생지");
			int atk =  rs.getInt("공격력");
			int def =  rs.getInt("방어력");
			int hea =  rs.getInt("체력");
			int pow =  rs.getInt("힘");
			int inte =  rs.getInt("지능");
			int mana =  rs.getInt("마력");
			String species = rs.getString("종족명");
			String skill = rs.getString("스킬명");
				
			

			if(name==null)
			{
				name = "정보없음";
			}
			
			if(species==null)
			{
				species = "정보없음";
			}
			
			if(skill==null)
			{
				skill = "스킬없음";
			}
			if(home==null)
			{
				home = "정보없음";
			}
			
			%>
			
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID %></td>
				<td align ="center" width = 50> <%=PS %></td>
				<td align ="center" width = 50> <%=name %></td>
				<td align ="center" width = 50> <%=age %></td>
				<td align ="center" width = 50> <%=home %></td>
				<td align ="center" width = 50> <%=atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=hea %></td>
				<td align ="center" width = 50> <%=pow %></td>
				<td align ="center" width = 50> <%=inte%></td>
				<td align ="center" width = 50> <%=mana%></td>
				<td align ="center" width = 50> <%=species %></td>
				<td align ="center" width = 50> <%=skill%></td> 
			</tr>
			<%
			
			count = count +1;
		}
		pstmt.close();
		
		
		sql = "select * from 용사 where 이름 like ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery(); 
		
		while(rs.next())
		{	
			String ID = rs.getString("ID");
			String PS = rs.getString("PASSWORD");
			String name = rs.getString("이름");
			int age = rs.getInt("나이");
			String home = rs.getString("출생지");
			int atk =  rs.getInt("공격력");
			int def =  rs.getInt("방어력");
			int hea =  rs.getInt("체력");
			int pow =  rs.getInt("힘");
			int inte =  rs.getInt("지능");
			int mana =  rs.getInt("마력");
			String species = rs.getString("종족명");
			String skill = rs.getString("스킬명");
				
			if(species==null)
			{
				species = "정보없음";
			}
			
			if(skill==null)
			{
				skill = "스킬없음";
			}
			if(home==null)
			{
				home = "정보없음";
			}
			
			
			%>
			
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID %></td>
				<td align ="center" width = 50> <%=PS %></td>
				<td align ="center" width = 50> <%=name %></td>
				<td align ="center" width = 50> <%=age %></td>
				<td align ="center" width = 50> <%=home %></td>
				<td align ="center" width = 50> <%=atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=hea %></td>
				<td align ="center" width = 50> <%=pow %></td>
				<td align ="center" width = 50> <%=inte%></td>
				<td align ="center" width = 50> <%=mana%></td>
				<td align ="center" width = 50> <%=species %></td>
				<td align ="center" width = 50> <%=skill%></td> 
			</tr>
			<%
			count = count +1;
		}
		
		pstmt.close();
	}
	else if(sorts.equals("Skill"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>스킬명 </td> 
			<td align ="center"width = 150>체력증가 </td>
			<td align ="center"width = 150>마력증가</td>
		</tr>
		<%
		
		sql = "select * from 스킬 where 스킬명 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String skill = rs.getString("스킬명");
			int hea =  rs.getInt("체력증가");
			int mana =  rs.getInt("마력증가");
			
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=skill%></td> 
				<td align ="center" width = 50><%=hea %></td>
				<td align ="center" width = 50> <%=mana %></td>
			</tr>
			<%
			count = count +1;
		}
			
	}
	else if(sorts.equals("Species"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>종족명 </td> 
			<td align ="center"width = 150>공격력보정 </td>
			<td align ="center"width = 150>방어력보정</td>
			<td align ="center"width = 150>체력보정 </td>
			<td align ="center"width = 150>마력보정</td>
			<td align ="center"width = 150>힘보정 </td>
			<td align ="center"width = 150>지능보정</td>
		</tr>
		<%
		
		sql = "select * from 종족 where 종족명 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String species = rs.getString("종족명");
			int atk =  rs.getInt("공격력보정");
			int def =  rs.getInt("방어력보정");
			int hea = rs.getInt("체력보정");
			int mana= rs.getInt("마력보정");
			int pow= rs.getInt("힘보정");
			int inte= rs.getInt("지능보정");
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=species %></td> 
				<td align ="center" width = 50> <%=atk%></td> 
				<td align ="center" width = 50><%=def %></td>
				<td align ="center" width = 50> <%=hea %></td>
				<td align ="center" width = 50> <%=mana%></td> 
				<td align ="center" width = 50><%=pow %></td>
				<td align ="center" width = 50> <%=inte %></td>
			</tr>
			<%
		}
	}
	else if(sorts.equals("Item"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이템이름 </td> 
			<td align ="center"width = 150>종류 </td>
			<td align ="center"width = 150>공격력증가</td>
			<td align ="center"width = 150>방어력증가</td>
			<td align ="center"width = 150>힘증가</td>
			<td align ="center"width = 150>지능증가</td>
			<td align ="center"width = 150>사용자ID</td>
		</tr>
		<%
		
		sql = "select * from 아이템 where 아이템이름 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String itemName = rs.getString("아이템이름");
			String kind =  rs.getString("종류");
			int atk =  rs.getInt("공격력_증가");
			int def = rs.getInt("방어력_증가");
			int pow = rs.getInt("힘_증가");
			int inte = rs.getInt("지능_증가");
			String ID = rs.getString("ID");
			
			if(ID ==null)
			{
				ID = "주인없음";
			}
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=itemName%></td> 
				<td align ="center" width = 50><%=kind %></td>
				<td align ="center" width = 50> <%=atk %></td>
				<td align ="center" width = 50> <%=def%></td> 
				<td align ="center" width = 50> <%=pow %></td>
				<td align ="center" width = 50> <%=inte %></td>
				<td align ="center" width = 50> <%=ID %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("MA"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단이름 </td> 
			<td align ="center"width = 150>병력수 </td>
			<td align ="center"width = 150>총공격력</td>
			<td align ="center"width = 150>총방어력</td>
			<td align ="center"width = 150>이동력</td>
			<td align ="center"width = 150>사기</td>
		</tr>
		<%
		
		sql = "select * from 마물군단 where 마물군단이름 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String maName = rs.getString("마물군단이름");
			int unitnum =  rs.getInt("병력수");
			int atk =  rs.getInt("총공격력");
			int def = rs.getInt("총방어력");
			int speed = rs.getInt("이동력");
			int fight = rs.getInt("사기");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=maName%></td> 
				<td align ="center" width = 50> <%=unitnum%></td> 
				<td align ="center" width = 50><%= atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=speed%></td> 
				<td align ="center" width = 50> <%=fight %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("MG"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물장군이름 </td> 
			<td align ="center"width = 150>나이 </td>
			<td align ="center"width = 150>공격력보정</td>
			<td align ="center"width = 150>방어력보정</td>
			<td align ="center"width = 150>이동력보정</td>
			<td align ="center"width = 150>사기보정</td>
			<td align ="center"width = 150>천적종족</td>
		
		</tr>
		<%
		
		sql = "select * from 마물장군 where 마물장군이름 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String mgName = rs.getString("마물장군이름");
			int age =  rs.getInt("나이");
			int atk =  rs.getInt("군단공격력보정");
			int def = rs.getInt("군단방어력력보정");
			int speed = rs.getInt("군단이동력보정");
			int fight = rs.getInt("군단사기보정");
			String enemy = rs.getString("천적종족");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=mgName%></td> 
				<td align ="center" width = 50> <%=age%></td> 
				<td align ="center" width = 50><%= atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=speed%></td> 
				<td align ="center" width = 50> <%=fight %></td>
				<td align ="center" width = 50> <%=enemy %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("Admin"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이디 </td> 
			<td align ="center"width = 150>비밀번호 </td>
			
		
		</tr>
		<%
		
		sql = "select * from admin where ID like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String ID = rs.getString("ID");
			String PS = rs.getString("PS");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID%></td> 
				<td align ="center" width = 50> <%=PS %></td>
				
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("Command"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단 </td> 
			<td align ="center"width = 150>마물장군</td>
			
		
		</tr>
		<%
		
		sql = "select * from 마물군단지휘 where 마물군단이름 like ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ selected + "%");
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String ID = rs.getString("마물군단이름");
			String PS = rs.getString("마물장군이름");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID%></td> 
				<td align ="center" width = 50> <%=PS %></td>
				
			</tr>
			<%
			count = count +1;
		}
		
		
	}
	
	%>
	</table>
	<%
}
else  //입력된 값이 없으면 전체를 보여준다
{
	%>
	<table border = 1 cellpadding =3 cellspacing = 0 >
	<%
	if(sorts.equals("Hero")) //용사 검색
	{
		%>
		<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 50>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 50>종족명 </td>
			<td align ="center" width = 50>스킬명</td>
		</tr>
		<%
		sql = "select * from 용사 ";
				
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			
			String ID = rs.getString("ID");
			String PS = rs.getString("PASSWORD");
			String name = rs.getString("이름");
			int age = rs.getInt("나이");
			String home = rs.getString("출생지");
			int atk =  rs.getInt("공격력");
			int def =  rs.getInt("방어력");
			int hea =  rs.getInt("체력");
			int pow =  rs.getInt("힘");
			int inte =  rs.getInt("지능");
			int mana =  rs.getInt("마력");
			String species = rs.getString("종족명");
			String skill = rs.getString("스킬명");
				
			if(name==null)
			{
				name = "정보없음";
			}
			
			if(species==null)
			{
				species = "정보없음";
			}
			
			if(skill==null)
			{
				skill = "스킬없음";
			}
			if(home==null)
			{
				home = "정보없음";
			}
			
			%>
			
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID %></td>
				<td align ="center" width = 50> <%=PS %></td>
				<td align ="center" width = 50> <%=name %></td>
				<td align ="center" width = 50> <%=age %></td>
				<td align ="center" width = 50> <%=home %></td>
				<td align ="center" width = 50> <%=atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=hea %></td>
				<td align ="center" width = 50> <%=pow %></td>
				<td align ="center" width = 50> <%=inte%></td>
				<td align ="center" width = 50> <%=mana%></td>
				<td align ="center" width = 50> <%=species %></td>
				<td align ="center" width = 50> <%=skill%></td> 
			</tr>
			<%
			
			count = count +1;
		}
		pstmt.close();

	}
	else if(sorts.equals("Skill"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>스킬명 </td> 
			<td align ="center"width = 150>체력증가 </td>
			<td align ="center"width = 150>마력증가</td>
		</tr>
		<%
		
		sql = "select * from 스킬";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String skill = rs.getString("스킬명");
			int hea =  rs.getInt("체력증가");
			int mana =  rs.getInt("마력증가");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=skill%></td> 
				<td align ="center" width = 50><%=hea %></td>
				<td align ="center" width = 50> <%=mana %></td>
			</tr>
			<%
			count = count +1;
		}
			
	}
	else if(sorts.equals("Species"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>종족명 </td> 
			<td align ="center"width = 150>공격력보정 </td>
			<td align ="center"width = 150>방어력보정</td>
			<td align ="center"width = 150>체력보정 </td>
			<td align ="center"width = 150>마력보정</td>
			<td align ="center"width = 150>힘보정 </td>
			<td align ="center"width = 150>지능보정</td>
		</tr>
		<%
		sql = "select * from 종족 ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String species = rs.getString("종족명");
			int atk =  rs.getInt("공격력보정");
			int def =  rs.getInt("방어력보정");
			int hea = rs.getInt("체력보정");
			int mana= rs.getInt("마력보정");
			int pow= rs.getInt("힘보정");
			int inte= rs.getInt("지능보정");
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=species %></td> 
				<td align ="center" width = 50> <%=atk%></td> 
				<td align ="center" width = 50><%=def %></td>
				<td align ="center" width = 50> <%=hea %></td>
				<td align ="center" width = 50> <%=mana%></td> 
				<td align ="center" width = 50><%=pow %></td>
				<td align ="center" width = 50> <%=inte %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("Item"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이템이름 </td> 
			<td align ="center"width = 150>종류 </td>
			<td align ="center"width = 150>공격력증가</td>
			<td align ="center"width = 150>방어력증가</td>
			<td align ="center"width = 150>힘증가</td>
			<td align ="center"width = 150>지능증가</td>
			<td align ="center"width = 150>사용자ID</td>
		</tr>
		<%
		
		sql = "select * from 아이템 ";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String itemName = rs.getString("아이템이름");
			String kind =  rs.getString("종류");
			int atk =  rs.getInt("공격력_증가");
			int def = rs.getInt("방어력_증가");
			int pow = rs.getInt("힘_증가");
			int inte = rs.getInt("지능_증가");
			String ID = rs.getString("ID");
			
			if(ID ==null)
			{
				ID = "주인없음";
			}
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=itemName%></td> 
				<td align ="center" width = 50><%=kind %></td>
				<td align ="center" width = 50> <%=atk %></td>
				<td align ="center" width = 50> <%=def%></td> 
				<td align ="center" width = 50> <%=pow %></td>
				<td align ="center" width = 50> <%=inte %></td>
				<td align ="center" width = 50> <%=ID %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("MA"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단이름 </td> 
			<td align ="center"width = 150>병력수 </td>
			<td align ="center"width = 150>총공격력</td>
			<td align ="center"width = 150>총방어력</td>
			<td align ="center"width = 150>이동력</td>
			<td align ="center"width = 150>사기</td>
		</tr>
		<%
		
		sql = "select * from 마물군단 ";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String maName = rs.getString("마물군단이름");
			int unitnum =  rs.getInt("병력수");
			int atk =  rs.getInt("총공격력");
			int def = rs.getInt("총방어력");
			int speed = rs.getInt("이동력");
			int fight = rs.getInt("사기");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=maName%></td> 
				<td align ="center" width = 50> <%=unitnum%></td> 
				<td align ="center" width = 50><%= atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=speed%></td> 
				<td align ="center" width = 50> <%=fight %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("MG"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물장군이름 </td> 
			<td align ="center"width = 150>나이 </td>
			<td align ="center"width = 150>공격력보정</td>
			<td align ="center"width = 150>방어력보정</td>
			<td align ="center"width = 150>이동력보정</td>
			<td align ="center"width = 150>사기보정</td>
			<td align ="center"width = 150>천적종족</td>
		
		</tr>
		<%
		
		sql = "select * from 마물장군 ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String mgName = rs.getString("마물장군이름");
			int age =  rs.getInt("나이");
			int atk =  rs.getInt("군단공격력보정");
			int def = rs.getInt("군단방어력력보정");
			int speed = rs.getInt("군단이동력보정");
			int fight = rs.getInt("군단사기보정");
			String enemy = rs.getString("천적종족");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=mgName%></td> 
				<td align ="center" width = 50> <%=age%></td> 
				<td align ="center" width = 50><%= atk %></td>
				<td align ="center" width = 50> <%=def %></td>
				<td align ="center" width = 50> <%=speed%></td> 
				<td align ="center" width = 50> <%=fight %></td>
				<td align ="center" width = 50> <%=enemy %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("Admin"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이디 </td> 
			<td align ="center"width = 150>비밀번호 </td>
			
		
		</tr>
		<%
		
		sql = "select * from admin";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String ID = rs.getString("ID");
			String PS = rs.getString("PS");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID%></td> 
				<td align ="center" width = 50> <%=PS %></td>
				
			</tr>
			<%
			count = count +1;
		}
	}
	else if(sorts.equals("Command"))
	{
		%>
		<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단 </td> 
			<td align ="center"width = 150>마물장군</td>
			
		
		</tr>
		<%
		
		sql = "select * from 마물군단지휘 ";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String ID = rs.getString("마물군단이름");
			String PS = rs.getString("마물장군이름");
			
			%>
			<tr>
				<td align ="center" width = 50> <%=count %></td> 
				<td align ="center" width = 50> <%=ID%></td> 
				<td align ="center" width = 50> <%=PS %></td>
			</tr>
			<%
			count = count +1;
		}
	}
	
	%>
	</table>
	<%
}




%>
</body>
</html>