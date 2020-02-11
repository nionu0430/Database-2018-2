<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>관리자 기능</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	Connection con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt = con.createStatement();
	PreparedStatement pstmt;
	String sql =null;
	ResultSet rs = null;
%>
<h3 align="center">ADMINISTER FUNCTION</h3>
<hr style="border: solid 3px red;">

<% if(session.getAttribute("id")!=null) {%>
	<%=session.getAttribute("id") %> <br><button type = "button"  onclick = "location.href='logout.jsp'" >로그아웃 </button>
	<button type = "button"  onclick = "location.href='db_2014253054main.jsp'" >메인페이지 </button>
<%}else
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
		<option value = "d">제거</option>
	</select>
	<input type = "submit" value = "확인">
</form>
<hr style="border: solid 1px green;">
<script>
		function showKeyCode(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if(( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) 
					|| keyID == 8 || keyID == 46  )
			{
				return;
			}
			else
			{
				return false;
			}
		}
</script>
<%
	String selected = request.getParameter("adminfunc");
	String funsel = request.getParameter("adminfuncsel");
	
	
	
	
if(selected!=null&&funsel!=null)
{
	if(selected.equals("a")) //용사
	{
		if(funsel.equals("a")) //용사 검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 용사의 ID 또는 이름을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="Hero">
				<input type="submit" value="검색">
			</form>
		<%
		}//////////aa끝
		else if(funsel.equals("b"))
		{
			%>
			<form action = "addHero.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> *ID </td> 
						<td align ="center"><input type = "text" name = "heroID" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> PASSWORD </td> 
						<td align ="center"><input type = "text" name = "PASSWORD"size = 15 maxlength = 40></td>
					</tr>
					<tr>
						<td align ="center"> 나이 </td> 
						<td align ="center"><input type = "text" name = "age" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 이름 </td> 
						<td align ="center"><input type = "text" name = "name" size = 15 maxlength = 40></td>
					</tr>
					<tr>
						<td align ="center"> 출생지 </td> 
						<td align ="center"><input type = "text" name = "home" size = 15 maxlength = 60></td>
					</tr>
					<tr>
						<td align ="center"> 공격력 </td> 
						<td align ="center"><input type = "text" name = "att" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>		
					<tr>
						<td align ="center"> 방어력 </td> 
						<td align ="center"><input type = "text" name = "def" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 체력 </td> 
						<td align ="center"><input type = "text" name = "hea" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 힘 </td> 
						<td align ="center"><input type = "text" name = "pow" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 지능 </td> 
						<td align ="center"><input type = "text" name = "int" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 마력 </td> 
						<td align ="center"><input type = "text" name = "mana" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showSpecies" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 종족</a></td> 
						<td align ="center"><input type = "text" name = "species"size = 15 maxlength = 40></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showSkill" onClick="window.open(this.href, '', 'width=500, height=500'); return false;"> 스킬</a> </td> 
						<td align ="center"><input type = "text" name = "skill"size = 15 maxlength = 40></td>
					</tr>
				</table>
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////ab끝
		else if(funsel.equals("c")) //수정
		{
			
			String link = "updataSomthing.jsp?sort=Hero&updated=";
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Hero">
				수정하려는 용사의 아이디를 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 용사의 목록<hr>
			<%
			sql = "select * from 용사";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		} //ac끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Hero">
				삭제하려는 용사의 아이디를 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 용사의 목록<hr>
			<%
			sql = "select * from 용사";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			}//ad끝
			pstmt.close();
		%></table><%
		}
	}
	if(selected.equals("b")) //스킬
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 스킬 이름을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="Skill">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////ba끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> 스킬명 </td> 
						<td align ="center"><input type = "text" name = "skillname" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 체력증가(0~999) </td> 
						<td align ="center"><input type = "text" name = "heabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 마력증가(0~999) </td> 
						<td align ="center"><input type = "text" name = "manabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "Skill">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////bb끝
		else if(funsel.equals("c")) //수정
		{
			
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Skill">
				수정하려는 스킬명을 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 스킬 목록<hr>
			<%
			sql = "select * from 스킬";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
				<tr>
					<td align ="center" width = 50>no </td> 
					<td align ="center" width = 150>스킬명 </td> 
					<td align ="center"width = 150>체력증가 </td>
					<td align ="center"width = 150>마력증가</td>
				</tr>
		<%
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
			
			%></table><%
			pstmt.close();
		} //bc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Skill">
				제거하려는 스킬명을 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 스킬 목록<hr>
			<%
			sql = "select * from 스킬";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
				<tr>
					<td align ="center" width = 50>no </td> 
					<td align ="center" width = 150>스킬명 </td> 
					<td align ="center"width = 150>체력증가 </td>
					<td align ="center"width = 150>마력증가</td>
				</tr>
		<%
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
			pstmt.close();
			%></table><%
			
		}//bd끝
	}
	if(selected.equals("c")) //c종족
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 종족명을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="Species">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////ca끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> *종족명 </td> 
						<td align ="center"><input type = "text" name = "speciesname" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 공격력보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 방어력보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 체력보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "heabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 마력보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "manabonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 힘보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "powbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
					<tr>
						<td align ="center"> 지능보정(0~999) </td> 
						<td align ="center"><input type = "text" name = "intebonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 3></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "Species">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////cb끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Species">
				수정하려는 종족명을 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 종족 목록<hr>
			<%
			sql = "select * from 종족";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		} //cc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Species">
				제거하려는 종족명을 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 종족 목록<hr>
			<%
			sql = "select * from 종족";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		}//cd끝
	}
	if(selected.equals("d")) //d아이템
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 아이템 이름을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="Item">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////aa끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> *아이템이름 </td> 
						<td align ="center"><input type = "text" name = "itemname" size = 15 maxlength = 20> </td>
					</tr>
					<tr>
						<td align ="center"> *종류 -칼,창,활,갑옷,방패 </td> 
						<td align ="center"><input type = "text" name = "kind" size = 15 maxlength = 10></td>
					</tr>
					<tr>
						<td align ="center"> 공격력증가량(0~99999) </td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center"> 방어력증가량(0~99999) </td> 
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center">힘 증가량(0~99999) </td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center">지능 증가량(0~99999) </td> 
						<td align ="center"><input type = "text" name = "intebonus" onkeydown="return showKeyCode(event)" size = 15 maxlength = 5></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showHero" onClick="window.open(this.href, '', 'width=800, height=500'); return false;"> 사용자ID</a> </td> 
						<td align ="center"><input type = "text" name = "ID" size = 15 maxlength = 40></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "Item">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////db끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Item">
				수정하려는 아이템명을 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 아이템 목록<hr>
			<%
			sql = "select * from 아이템";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		} //dc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Item">
				제거하려는 아이템명을 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 아이템 목록<hr>
			<%
			sql = "select * from 아이템";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		}//dd끝
	}
	if(selected.equals("e")) //마물군단
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 마물군단이름을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="MA">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////ea끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> *마물군단이름 </td> 
						<td align ="center"><input type = "text" name = "maName" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 병력수 </td> 
						<td align ="center"><input type = "text" name = "unit" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 총공격력 </td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 총방어력</td> 
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 이동력 </td> 
						<td align ="center"><input type = "text" name = "speed" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center">사기 </td> 
						<td align ="center"><input type = "text" name = "fighting"onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "MA">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////eb끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="MA">
				수정하려는 군단이름을 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 군단 목록<hr>
			<%
			sql = "select * from 마물군단";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		} //ec끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="MA">
				제거하려는 군단이름을 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 군단 목록<hr>
			<%
			sql = "select * from 마물군단";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		}//ed끝
	}
	if(selected.equals("f")) //마물장군
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 마물장군이름을 입력하세요. <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="MG">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////fa끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> *마물장군이름 </td> 
						<td align ="center"><input type = "text" name = "mgName" size = 15 maxlength = 40> </td>
					</tr>
					<tr>
						<td align ="center"> 나이 </td> 
						<td align ="center"><input type = "text" name = "age" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단공격력보정 </td> 
						<td align ="center"><input type = "text" name = "atkbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단방어력보정</td> 
						<td align ="center"><input type = "text" name = "defbonus" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"> 군단이동력보정 </td> 
						<td align ="center"><input type = "text" name = "speed" onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center">군단사기보정 </td> 
						<td align ="center"><input type = "text" name = "fighting"onkeydown="return showKeyCode(event)" size = 15></td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showSpecies" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 천적종족</a></td> 
						<td align ="center"><input type = "text" name = "enemy" size = 15 maxlength = 40></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "MG">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////fb끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="MG">
				수정하려는 마물장군이름을 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 장군 목록<hr>
			<%
			sql = "select * from 마물장군";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		} //fc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="MG">
				제거하려는 마물장군이름을 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 장군 목록<hr>
			<%
			sql = "select * from 마물장군";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
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
			
			%></table><%
			pstmt.close();
		}//fd끝
	}
	if(selected.equals("g")) //관리자
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				찾으려는 관리자 아이디를 입력하세요. <input type="text" name="search" maxlength = 20>
				<input type="hidden" name="sort" value="Admin">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////ga끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"> ID </td> 
						<td align ="center"><input type = "text" name = "ID" size = 15 maxlength = 20> </td>
					</tr>
					<tr>
						<td align ="center"> PS </td> 
						<td align ="center"><input type = "text" name = "PS" size = 15 maxlength = 20></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "Admin">
				<input type = "submit" value = "추가" > 
				
			</form>
			<%
		}///////////gb끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Admin">
				수정하려는 관리자 아이디를 입력하세요. <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 관리자 목록<hr>
			<%
			sql = "select * from admin";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
			<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이디 </td> 
			<td align ="center"width = 150>비밀번호 </td>
			
		
		</tr>
			<%
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
			
			%></table><%
			pstmt.close();
		} //gc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Admin">
				제거하려고 하는 관리자 아이디를 입력하세요. <input type="text" name="deleted" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 관리자 목록<hr>
			<%
			sql = "select * from admin";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 1;
			%>
			<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
			<tr>
		<td align ="center" width = 50>no </td> 
			<td align ="center" width = 150>아이디 </td> 
			<td align ="center"width = 150>비밀번호 </td>
			
		
		</tr>
			<%
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
			
			%></table><%
			pstmt.close();
		}//gd끝
	}
	else if(selected.equals("h"))
	{
		if(funsel.equals("a")) //검색
		{
			%>
			<form action="searchSomething.jsp" method="GET">
				지휘자를 알고싶은 마물군단 이름을 입력하세요 <input type="text" name="search" maxlength = 40>
				<input type="hidden" name="sort" value="Command">
				<input type="submit" value="검색">
			</form>
			<%
		}//////////ha끝
		else if(funsel.equals("b")) //등록
		{
			%>
			<form action = "addSomething.jsp" method = "POST">
				<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff">
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showMA" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 군단이름</a></td> 
						<td align ="center"><input type = "text" name = "maName" size = 15 maxlength = 20> </td>
					</tr>
					<tr>
						<td align ="center"><a href="popupdetail.jsp?sort=showMG" onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> 장군이름</a></td> 
						<td align ="center"><input type = "text" name = "mgName" size = 15 maxlength = 20></td>
					</tr>
				</table>
				<input type = "hidden" name = "sort" value = "Command">
				<input type = "submit" value = "추가" >
			</form>
			<%
		}///////////hb끝
		else if(funsel.equals("c")) //수정
		{
			%>
			<form action="updateSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Command">
				지휘자를 수정하려는 마물군단을 입력하세요 <input type="text" name="updated" maxlength = 40>
				<input type="submit" value="수정">
			</form>
			<hr>수정할 수 있는 마물지휘 목록<hr>
			<%
			sql = "select * from 마물군단지휘";
			
			pstmt = con.prepareStatement(sql);
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
		} //hc끝
		else if(funsel.equals("d")) //삭제
		{
			%>
			<form action="deleteSomething.jsp" method="GET">
			<input type="hidden" name="sort" value="Command">
				삭제하려는 지휘관계를 입력하세요<br>
				마물군단<input type="text" name="deleted" maxlength = 40>
				마물장군<input type="text" name="deleted2" maxlength = 40>
				<input type="submit" value="제거">
			</form>
			<hr>제거할 수 있는 마물지휘 목록<hr>
			<%
			sql = "select * from 마물군단지휘";
			
			pstmt = con.prepareStatement(sql);
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
		}//hd끝
	}
}
%>

</body>
</html>