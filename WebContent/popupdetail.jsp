<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>상세정보표출</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String detail = request.getParameter("value");
	String sort = request.getParameter("sort");
	
	Connection con = null; 
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 
	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	String sql = null;
%>

<hr style="border: solid 1px red;"><br>

<%
if(!sort.isEmpty())
{
	if(sort.equals("Hero"))
	{
		%>
		용사의 스탯 계산 공식 <br>
		힘,지능,공격력,방어력 = 스탯*종족값(%) + 아이템스탯<br>
		체력, 마력 = 스탯*종족값(%)*스킬값(%)<br>
		<h3><%=detail%></h3>
		
		<a href='javascript:window.close();'>닫기</a>
		<%
	}
	else if(sort.equals("MA"))
	{
		%>
		마물군단의 <br>
		스탯*지휘하는 장군들의 총합(%)<br>
		<h3><%=detail%></h3>
		
		<a href='javascript:window.close();'>닫기</a>
		<%
	}
	 

		if(sort.equals("showSkill"))
		{
			sql = "select * from 스킬";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			
			%>
			
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 100>no </td> 
				<td align ="center" width = 100>스킬명 </td> 
				<td align ="center"width = 100>체력증가 </td>
				<td align ="center"width = 100>마력증가</td>
			</tr>
			
			
			<%
			
			while(rs.next())
			{	
				String skill = rs.getString("스킬명");
				int hea =  rs.getInt("체력증가");
				int mana =  rs.getInt("마력증가");
				
				%>
				<tr>
					<td align ="center" width = 100> <%=count %></td> 
					<td align ="center" width = 100> <%=skill%></td> 
					<td align ="center" width = 100> <%=hea %></td>
					<td align ="center" width = 100> <%=mana %></td>
				</tr>
				
				<%
			}
			%>
			</table>
			<%
		}
		else if(sort.equals("showSpecies"))
		{
			%>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 50>종족명 </td> 
				<td align ="center"width = 50>공격력보정 </td>
				<td align ="center"width = 50>방어력보정</td>
				<td align ="center"width = 50>체력보정 </td>
				<td align ="center"width = 50>마력보정</td>
				<td align ="center"width = 50>힘보정 </td>
				<td align ="center"width = 50>지능보정</td>
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
			%>
			</table>
			<%
		}
		else if(sort.equals("showHero"))
		{
			%>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 60>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 100>종족명 </td>
			<td align ="center" width = 100>스킬명</td>
		</tr>
			<%
			
			sql = "select * from 용사";
			
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
			
			%>
			</table>
			<%
		}
		else if(sort.equals("showMA"))
		{
			%>
			<table border = 1 cellpadding =3 cellspacing = 0 >
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
		
		sql = "select * from 마물군단";
		
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
			%>
			</table>
			<%
		}
		else if(sort.equals("showMG"))
		{
			%>
			<table border = 1 cellpadding =3 cellspacing = 0 >
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
		
		sql = "select * from 마물장군";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		
		while(rs.next())
		{	
			String mgName = rs.getString("마물장군이름");
			int age =  rs.getInt("나이");
			int atk =  rs.getInt("군단공격력보정");
			int def = rs.getInt("군단방어력보정");
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
			%>
			</table>
			<%
		}
		else if(sort.equals("oneSpecies"))
		{
			%>
			용사 종족 정보<br>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 50>종족명 </td> 
				<td align ="center"width = 50>공격력보정 </td>
				<td align ="center"width = 50>방어력보정</td>
				<td align ="center"width = 50>체력보정 </td>
				<td align ="center"width = 50>마력보정</td>
				<td align ="center"width = 50>힘보정 </td>
				<td align ="center"width = 50>지능보정</td>
			</tr>
			<%
	
			sql = "select * from 종족 where 종족명=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			
			if(rs.next())
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
			pstmt.close();
			%>
			</table>
			<%
		}
		else if(sort.equals("oneHero"))
		{
			%>
		    아이템사용자 정보<br>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 60>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 100>종족명 </td>
			<td align ="center" width = 100>스킬명</td>
		</tr>
			<%
			
			sql = "select * from 용사 where ID=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			
			if(rs.next())
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
			
			%>
			</table>
			<%
		}
		else if(sort.equals("oneSkill"))
		{ 
			%>사용스킬 정보<br><%
			sql = "select * from 스킬 where 스킬명 =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			
			%>
			
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 100>no </td> 
				<td align ="center" width = 100>스킬명 </td> 
				<td align ="center"width = 100>체력증가 </td>
				<td align ="center"width = 100>마력증가</td>
			</tr>
			
			
			<%
			
			if(rs.next())
			{	
				String skill = rs.getString("스킬명");
				int hea =  rs.getInt("체력증가");
				int mana =  rs.getInt("마력증가");
				
				%>
				<tr>
					<td align ="center" width = 100> <%=count %></td> 
					<td align ="center" width = 100> <%=skill%></td> 
					<td align ="center" width = 100> <%=hea %></td>
					<td align ="center" width = 100> <%=mana %></td>
				</tr>
				
				<%
			}
			%>
			</table>
			<%
		}
		else if(sort.equals("searchHeroSkill"))
		{
			%>
			해당 스킬 사용자 정보<br>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 60>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 100>종족명 </td>
			<td align ="center" width = 100>스킬명</td>
		</tr>
			<%
			
			sql = "select * from 용사 where 스킬명=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			
			if(rs.next())
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
			
			%>
			</table>
			<%
		}
		else if(sort.equals("searchHeroSpecies"))
		{
			%>
			해당 종족의 용사 정보<br>
			<table border = 1 cellpadding =3 cellspacing = 0 >
			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 50>ID  </td>
			<td align ="center" width = 50> PS</td>
			<td align ="center" width = 50>이름</td>
			<td align ="center" width = 50>나이  </td>
			<td align ="center" width = 60>출생지</td>
			<td align ="center" width = 50>공격력  </td>
			<td align ="center" width = 50>방어력</td>
			<td align ="center" width = 50>체력 </td>
			<td align ="center" width = 50>힘</td>
			<td align ="center" width = 50>지능</td>
			<td align ="center" width = 50>마력</td>
			<td align ="center" width = 100>종족명 </td>
			<td align ="center" width = 100>스킬명</td>
		</tr>
			<%
			
			sql = "select * from 용사 where 종족명=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
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
			
			%>
			</table><%
		}
		else if(sort.equals("whoisMG"))
		{
			
			sql = "select * from 마물군단지휘 where 마물군단이름 =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">

			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단 </td> 
			<td align ="center"width = 150>마물장군</td>
			
		
			</tr>
			<%
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
			
			%></table><%
			pstmt.close();
		}
		else if(sort.equals("whoisMA"))
		{
sql = "select * from 마물군단지휘 where 마물장군이름 =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,detail);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">

			<tr>
			<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>마물군단 </td> 
			<td align ="center"width = 150>마물장군</td>
			
		
			</tr>
			<%
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
			
			%></table><%
			pstmt.close();
		}
}
else
{
	%>
	<script>
		   alert('잘못된 접근이거나 값이 존재하지 않습니다');
		   document.location.href="db_2014253054main.jsp";
	</script>
	<%
}
%>

<hr style="border: solid 1px red;"><br>
</body>
</html>