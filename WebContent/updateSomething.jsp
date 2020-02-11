<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>관리자 기능-수정</title>
</head>
<body>
<h3 align="center"> ADMINISTER FUNCTION - UPDATE  </h3>
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
%><hr>

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
<%
request.setCharacterEncoding("UTF-8");
Connection con = null; 
PreparedStatement pstmt= null;
PreparedStatement pstmt2= null;
PreparedStatement pstmt3= null;
PreparedStatement pstmt4= null;
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;

String sql = null;

try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	
	String sorted = request.getParameter("sort");
	String updated = request.getParameter("updated");
	
	if(!(sorted==null)) //분류에 대한 정보 
	{
		if(sorted.equals("Hero"))
		{
			sql = "select * From 용사 where ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			if(rs.next()) //id가 존재한다
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
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "Hero">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
						<tr>
							<td align ="center"> 속성 </td> 
							<td align ="center">기존 값 </td>
							<td align ="center">변경 값 </td>
						</tr>
						<tr>
							<td align ="center"> *ID </td> 
							<td align ="center" width = 50> <%=ID %></td>
							<td align ="center"><input type = "text" name = "heroID" size = 15 maxlength = 40> </td>
						</tr>
						<tr>
							<td align ="center"> PASSWORD </td> 
							<td align ="center" width = 50> <%=PS %></td>
							<td align ="center"><input type = "text" name = "PASSWORD"size = 15 maxlength = 40></td>
						</tr>
						<tr>
							<td align ="center"> 나이 </td> 
							<td align ="center" width = 50> <%=age %></td>
							<td align ="center"><input type = "text" name = "age" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"> 이름 </td> 
							<td align ="center" width = 50> <%=name %></td>
							<td align ="center"><input type = "text" name = "name" size = 15 maxlength = 40></td>
						</tr>
						<tr>
							<td align ="center"> 출생지 </td> 
								<td align ="center" width = 50> <%=home %></td>
							<td align ="center"><input type = "text" name = "home" size = 15 maxlength = 60></td>
						</tr>
						<tr>
							<td align ="center"> 공격력 </td> 
							<td align ="center" width = 50> <%=atk %></td>
							<td align ="center"><input type = "text" name = "att" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>		
						<tr>
							<td align ="center"> 방어력 </td> 
							<td align ="center" width = 50> <%=def %></td>
							<td align ="center"><input type = "text" name = "def" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"> 체력 </td> 
							<td align ="center" width = 50> <%=hea %></td>
							<td align ="center"><input type = "text" name = "hea" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"> 힘 </td> 
							<td align ="center" width = 50> <%=pow %></td>
							<td align ="center"><input type = "text" name = "pow" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"> 지능 </td> 
								<td align ="center" width = 50> <%=inte%></td>
							<td align ="center"><input type = "text" name = "int" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"> 마력 </td> 
							<td align ="center" width = 50> <%=mana%></td>
							<td align ="center"><input type = "text" name = "mana" onkeydown="return showKeyCode(event)" size = 15></td>
						</tr>
						<tr>
							<td align ="center"><a href="popupdetail.jsp?sort=showSpecies" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 종족</a></td> 
							<td align ="center" width = 50>
							 <%=species %></td>
							<td align ="center"> <input type = "text" name = "species"size = 15 maxlength = 40></td>
						</tr>
						<tr>
							<td align ="center"><a href="popupdetail.jsp?sort=showSkill" onClick="window.open(this.href, '', 'width=500, height=500'); return false;"> 스킬</a> </td> 
							<td align ="center" width = 50> <%=skill%></td> 
							<td align ="center"><input type = "text" name = "skill"size = 15 maxlength = 40></td>
						</tr>
					</table><hr>
					<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=a&adminfuncsel=c'" >이전 </button>
				</form>
				<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 용사 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Skill"))
		{
			sql = "select * From 스킬 where 스킬명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			
			if(rs.next())
			{
				String skill = rs.getString("스킬명");
				int hea =  rs.getInt("체력증가");
				int mana =  rs.getInt("마력증가");
			%>
			
			<form action = "updatedata.jsp" method = "POST">
			<input type ="hidden" name = "sorts" value = "Skill">
			<input type = "hidden" name = "updating" value =<%=updated %>>
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> 스킬명 </td> 
						<td align ="center" width = 100> <%=skill%></td> 
						<td align ="center"><input type = "text" name = "skillname" size = 15 maxlength = 40> </td>
						
					</tr>
					<tr>
						<td align ="center"> 체력증가(0~999) </td> 
						<td align ="center" width = 50><%=hea %></td>
						<td align ="center"><input type = "text" name = "heabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 마력증가(0~999) </td> 
						<td align ="center" width = 50> <%=mana %></td>
						<td align ="center"><input type = "text" name = "manabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=b&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 스킬 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Species"))
		{
			sql = "select * From 종족 where 종족명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
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
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "Species">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> *종족명 </td> 
						<td align ="center" width = 100> <%=species %></td> 
						<td align ="center"><input type = "text" name = "speciesname" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 공격력보정(0~999) </td> 
						<td align ="center" width = 50> <%=atk%></td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 방어력보정(0~999) </td> 
						<td align ="center" width = 50><%=def %></td>
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 체력보정(0~999) </td> 
						<td align ="center" width = 50> <%=hea %></td>
						<td align ="center"><input type = "text" name = "heabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 마력보정(0~999) </td> 
						<td align ="center" width = 50> <%=mana%></td> 
						<td align ="center"><input type = "text" name = "manabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 힘보정(0~999) </td> 
						<td align ="center" width = 50><%=pow %></td>
						<td align ="center"><input type = "text" name = "powbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 지능보정(0~999) </td> 
						<td align ="center" width = 50> <%=inte %></td>
						<td align ="center"><input type = "text" name = "intebonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=c&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 종족 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Item"))
		{
			sql = "select * From 아이템 where 아이템이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			if(rs.next())
			{
				String itemName = rs.getString("아이템이름");
				String kind =  rs.getString("종류");
				int atk =  rs.getInt("공격력_증가");
				int def = rs.getInt("방어력_증가");
				int pow = rs.getInt("힘_증가");
				int inte = rs.getInt("지능_증가");
				String ID = rs.getString("ID");
				%>
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "Item">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> *아이템이름 </td> 
						<td align ="center" width = 100> <%=itemName%></td> 
						<td align ="center"><input type = "text" name = "itemname" size = 15 maxlength = 20> </td>
					</tr>
					<tr>
						<td align ="center"> *종류 -칼,창,활,갑옷,방패 </td> 
						<td align ="center" width = 50><%=kind %></td>
						<td align ="center"><input type = "text" name = "kind" size = 15 maxlength = 10></td>
					</tr>
					<tr>
						<td align ="center"> 공격력증가량(0~99999) </td> 
						<td align ="center" width = 50> <%=atk %></td>
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center"> 방어력증가량(0~99999) </td> 
						<td align ="center" width = 50> <%=def%></td> 
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center">힘 증가량(0~99999) </td> 
						<td align ="center" width = 50> <%=pow %></td>
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center">지능 증가량(0~99999) </td> 
						<td align ="center" width = 50> <%=inte %></td>
						<td align ="center"><input type = "text" name = "intebonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showHero" onClick="window.open(this.href, '', 'width=800, height=500'); return false;"> 사용자ID</a> </td> 
						<td align ="center" width = 100> <%=ID %></td>
						<td align ="center"><input type = "text" name = "ID" size = 15 maxlength = 40></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=d&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 아이템 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("MA"))
		{
			sql = "select * From 마물군단 where 마물군단이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			if(rs.next())
			{
				String maName = rs.getString("마물군단이름");
				int unitnum =  rs.getInt("병력수");
				int atk =  rs.getInt("총공격력");
				int def = rs.getInt("총방어력");
				int speed = rs.getInt("이동력");
				int fight = rs.getInt("사기");
				%>
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "MA">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> *마물군단이름 </td> 
						<td align ="center" width = 100> <%=maName%></td>
						<td align ="center"><input type = "text" name = "maName" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 병력수 </td> 
						<td align ="center" width = 50> <%=unitnum%></td> 
						<td align ="center"><input type = "text" name = "unit" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 총공격력 </td> 
						<td align ="center" width = 50><%= atk %></td>
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 총방어력</td> 
						<td align ="center" width = 50> <%=def %></td>
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 이동력 </td> 
							<td align ="center" width = 50> <%=speed%></td> 
						<td align ="center"><input type = "text" name = "speed" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center">사기 </td> 
							<td align ="center" width = 50> <%=fight %></td>
						<td align ="center"><input type = "text" name = "fighting"onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=e&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 아이템 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("MG"))
		{
			sql = "select * From 마물장군 where 마물장군이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			if(rs.next())
			{
				String mgName = rs.getString("마물장군이름");
				int age =  rs.getInt("나이");
				int atk =  rs.getInt("군단공격력보정");
				int def = rs.getInt("군단방어력보정");
				int speed = rs.getInt("군단이동력보정");
				int fight = rs.getInt("군단사기보정");
				String enemy = rs.getString("천적종족");			
				%>
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "MG">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> *마물장군이름 </td> 
						<td align ="center" width = 100> <%=mgName%></td>
						<td align ="center"><input type = "text" name = "mgName" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 나이 </td> 
						<td align ="center" width = 50> <%=age%></td> 
						<td align ="center"><input type = "text" name = "age" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단공격력보정 </td> 
						<td align ="center" width = 50><%= atk %></td>
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단방어력보정</td> 
						<td align ="center" width = 50> <%=def %></td>
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단이동력보정 </td> 
							<td align ="center" width = 50> <%=speed%></td> 
						<td align ="center"><input type = "text" name = "speed" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center">군단사기보정 </td> 
						<td align ="center" width = 50> <%=fight %></td>
						<td align ="center"><input type = "text" name = "fighting"onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showSpecies" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 천적종족</a></td> 
						<td align ="center" width = 100> <%=enemy %></td>
						<td align ="center"><input type = "text" name = "enemy" size = 15 maxlength = 40></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=f&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 아이템 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Admin"))
		{
			sql = "select * From admin where ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,updated);
			rs = pstmt.executeQuery();
			boolean valid= true;
			
			if(rs.next())
			{
				String ID = rs.getString("ID");
				String PS = rs.getString("PS");	
				%>
				
				<form action = "updatedata.jsp" method = "POST">
				<input type ="hidden" name = "sorts" value = "Admin">
				<input type = "hidden" name = "updating" value =<%=updated %>>
					<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 속성 </td> 
						<td align ="center">기존 값 </td>
						<td align ="center">변경 값 </td>
					</tr>
					<tr>
						<td align ="center"> ID </td> 
						<td align ="center" width = 100> <%=ID%></td> 
						<td align ="center"><input type = "text" name = "ID" size = 15 maxlength = 20> </td>
					</tr>
					<tr>
						<td align ="center"> PS </td> 
						<td align ="center" width = 100> <%=PS %></td>
						<td align ="center"><input type = "text" name = "PS" size = 15 maxlength = 20></td>
					</tr>
				</table><hr>
				<input type = "submit" value = "변경" ><button type = "button"  onclick = "location.href='adminfunction.jsp?adminfunc=g&adminfuncsel=c'" >이전 </button>
			</form>
			<%
			}
			else
			{
				valid = false;
				%>	
				<script>
				      alert('존재하지 않는 아이템 입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Command"))
		{
			
		}
	}
	else //페이지에 실수로 잘못들어옴
	{
		%>	
		<script>
		      alert('잘못된 접근입니다.');
		      document.location.href="adminfunction.jsp";
		 </script>
		<%
	}
} 
catch (SQLException e)
{ 
	System.out.println("[SQL Error : " + e.getMessage() + "]");
}


%>





</body>
</html>