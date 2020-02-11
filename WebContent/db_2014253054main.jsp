<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title> 2014253054main  </title>
</head>

<body >


<h3 align="center">SWEET HERO HOUSE</h3>
<hr style="border: solid 3px red;">
<% 
	request.setCharacterEncoding("UTF-8");
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	Connection con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt = con.createStatement();
	PreparedStatement pstmt;
	PreparedStatement pstmt2;
	PreparedStatement pstmt3;
	PreparedStatement pstmt4;

%>
<form action = "checklogin.jsp" method = "POST">
	<% if(session.getAttribute("id")==null) {%>
		ID: <input type = "text" name = "ID">
		PS: <input type = "password" name = "PS">
		<input type = "submit" value = "login">
	<%}else {%>
		<%=session.getAttribute("id") %> <br><button type = "button"  onclick = "location.href='logout.jsp'" >로그아웃 </button>
		<button type = "button"  onclick = "location.href='adminfunction.jsp'" >관리자 기능 </button>
		<button type = "button"  onclick = "location.href='battlehelper.jsp'" >전투도우미 </button>
		
	<%} %>
</form>
<hr>
일반사용자 기능 
<br>
<form action = "db_2014253054main.jsp" method = "POST">
	<select name ="funcselect">
		<option value = "1">용사</option>
		<option value = "2">스킬</option>
		<option value = "3">종족</option>
		<option value = "4">아이템</option>
		<option value = "5">마물군단</option>
		<option value = "6">마물장군</option>
	</select> <input type = "submit" value = "선택">  <button type = "button"  onclick = "location.href='db_2014253054main.jsp'" >초기화 </button>
</form>
<form method = "GET">
<%
	String Tselected = request.getParameter("funcselect");
	String sql=null;
	String sql2 = null;
	String sql3 = null;
	String sql4 = null;
	if(Tselected!=null)
	{
		int selected = Integer.parseInt(Tselected);
		
		%>
		<select name ="selectdetail">
		<% if(selected ==1){ %>
			<option value = "1">ID</option>
			<option value = "2">이름</option>
			<option value = "3">출생지</option>
			<option value = "4">나이</option>
		<%}else if(selected ==2){ %>
			<option value = "5">스킬명</option>
		<%}else if(selected ==3){ %>
			<option value = "6">종족명</option>
		<%}else if(selected ==4){ %>
			<option value = "7">아이템이름</option>
			<option value = "8">종류</option>
			<option value = "9">사용자ID</option>
		<%}else if(selected ==5){ %>
			<option value = "10">마물군단이름</option>
		<%}else if(selected ==6){ %>
			<option value = "11">마물장군이름</option>
			<option value = "12">천적종족</option>
			<option value = "13">지휘군단</option>
		<%} %>
			</select>  
			<input type = "text" name = "search" size = 25> 
			<input type = "submit" value = "검색">
		<br>
		<%
	}
%></form><%
	String searched = request.getParameter("search");
	String TselectedD = request.getParameter("selectdetail");
	int searchedInttype;
	if(searched !=null && TselectedD !=null)
	{

		int selected2 = Integer.parseInt(TselectedD);

		if(selected2 ==1){ sql = "select * from 용사 where ID like ?";%>용사 -ID : <%=searched %>로 검색 <%}
		else if(selected2 ==2){ sql = "select * from 용사 where 이름 like ?";%>용사 -이름 : <%=searched %>로 검색 <%}
		else if(selected2 ==3) {sql = "select * from 용사 where 출생지 like ?";%>용사 -출생지 : <%=searched %>로 검색 <%}
		else if(selected2 ==4){ sql = "select * from 용사 where 나이 like ?";%>용사 -나이 : <%=searched %>로 검색 <%}
		else if(selected2 ==5){ sql = "select * from 스킬 where 스킬명 like ?";%>스킬 -스킬명 : <%=searched %>로 검색 <%}
		else if(selected2 ==6){sql = "select * from 종족 where 종족명 like ?";%>종족-종족명 : <%=searched %>로 검색 <%}
		else if(selected2 ==7){ sql = "select * from 아이템 where 아이템이름 like ?";%>아이템 -아이템이름 : <%=searched %>로 검색 <%}
		else if(selected2 ==8){ sql = "select * from 아이템 where 종류 like ?";%>아이템 -종류 : <%=searched %>로 검색 <%}
		else if(selected2 ==9){ sql = "select * from 아이템 where ID like ?";%>ID -이름 : <%=searched %>로 검색 <%}
		else if(selected2 ==10){ sql = "select * from 마물군단 where 마물군단이름 like ?";%>마물군단 -마물군단이름 : <%=searched %>로 검색 <%}
		else if(selected2 ==11){ sql = "select * from 마물장군 where 마물장군이름 like ?";%>마물장군 -마물장군이름 : <%=searched %>로 검색 <%}
		else if(selected2 ==12){ sql = "select * from 마물장군 where 천적종족 like ?";%>마물장군 -천적종족 : <%=searched %>로 검색 <%}
		else if(selected2 ==13){ sql = "select * from 마물군단지휘 where 마물군단이름 like ?";%>마물장군 -지휘군단 : <%=searched %>로 검색 <%}
		
		%><br>
		
		<form action = "popupdetail.jsp" method = "Get">
		<input type ="hidden" name = "sort" value = "0">  <!-- 이 값을 통해서 디테일 종류 값을 넘긴다. -->>
		<input type ="hidden" name = "value" value = "0">  <!-- 이 값을 통해서 디테일의 값을 넘긴다. -->>
		
		<table border = 1 cellpadding =3 cellspacing = 0  bgcolor = "ffffff"><% 
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,"%"+ searched + "%");
		
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		int count = 1;
		
		
		if(selected2==5) 
		{
			%>
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 150>스킬명 </td> 
				<td align ="center"width = 150>체력증가 </td>
				<td align ="center"width = 150>마력증가</td>
			</tr><%
		}
		else if(selected2>=1 && selected2<=4)
		{
			%>
			<tr>
				<td align ="center" width = 50>no </td> 
				<td align ="center" width = 50>ID  </td>
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
		}
		else if(selected2==6)
		{
			%>
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 100>종족명 </td> 
				<td align ="center" width = 100>공격력보정  </td>
				<td align ="center" width = 100>방어력보정</td>
				<td align ="center" width = 100>체력보정 </td>
				<td align ="center" width = 100>마력보정</td>
				<td align ="center" width = 100>힘보정 </td>
				<td align ="center" width = 100>지능보정</td>
			</tr>
			<%
		}
		else if(selected2>=7 && selected2<=9)
		{
			%>
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 100>아이템이름 </td> 
				<td align ="center" width = 100>종류  </td>
				<td align ="center" width = 100>공격력증가</td>
				<td align ="center" width = 100>방어력증가</td>
				<td align ="center" width = 100>힘증가</td>
				<td align ="center" width = 100>지능증가 </td>
				<td align ="center" width = 100>사용자ID</td>
			</tr>
			<%
		}
		else if(selected2==10)
		{
			%>
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 100>마물군단이름 </td> 
				<td align ="center" width = 100>병력수 </td>
				<td align ="center" width = 100>총공격력</td>
				<td align ="center" width = 100>총방어력</td>
				<td align ="center" width = 100>이동력</td>
				<td align ="center" width = 100>사기 </td>
			</tr>
			<%
		}
		else if(selected2>=11 && selected2<=13)
		{
			%>
			<tr>
			<td align ="center" width = 50>no </td> 
				<td align ="center" width = 100>마물장군이름 </td> 
				<td align ="center" width = 100>나이 </td>
				<td align ="center" width = 150>군단공격력보정</td>
				<td align ="center" width = 150>군단방어력보정</td>
				<td align ="center" width = 150>군단이동력보정</td>
				<td align ="center" width = 100>군단사기보정</td>
				<td align ="center" width = 100>천적종족</td>
			</tr>
			<%
		}
		%>
		
		<%
		while(rs.next())
		{
			
			if(selected2>=1 && selected2<=4) 
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
				
				
				int finalatk=atk;//초기화
				int finaldef=def;
				int finalhea=hea;
				int finalpow=pow;
				int finalinte=inte;
				int finalmana=mana;
				
				
				sql2 = "select * from 종족 where 종족명=?"; //종족에 대한 쿼리문
				sql3 = "select * from 스킬 where 스킬명=?"; //스킬에 대한 쿼리문
				sql4 = "select ID,sum(공격력_증가) as 공증,sum(방어력_증가) as 방증,sum(힘_증가) as 힘증,sum(지능_증가) as 지증 from 아이템 where ID=? group by ID"; //아이템에 대한 쿼리문
				
				String linksql = "popupdetail.jsp?sort=Hero&value=";
 				String linkatk =linksql+atk;
				String linkdef =linksql+def;
				String linkpow=linksql+pow;
				String linkinte=linksql+inte;
				String linkmana=linksql+mana;
				String linkhea =linksql+hea;
				
				String detaillink1 =null;
				String detaillink2 =null;
				
				if(species!=null) //데이터베이스 내부에 종족이 저장되어 있다면 종족에 대한 값이 있다.
				{
					pstmt2 = con.prepareStatement(sql2);
					pstmt2.setString(1,species);
					rs2 = pstmt2.executeQuery();
					//용사의 스텟의 퍼센트 
					rs2.next();
					int gatk=rs2.getInt("공격력보정");
					int gdef=rs2.getInt("방어력보정");
					int ghea=rs2.getInt("체력보정");
					int gpow=rs2.getInt("힘보정");
					int ginte=rs2.getInt("지능보정");
					int gmana=rs2.getInt("마력보정");
					
					finalatk = finalatk*gatk/100;
					finaldef = finaldef*gdef/100;
					finalhea = finalhea*ghea/100;
					finalpow = finalpow*gpow/100;
					finalinte = finalinte*ginte/100;
					finalmana = finalmana*gmana/100;
					
					linkatk = linkatk+ "*" +gatk + "/100";
					linkdef =  linkdef+ "*" +gdef + "/100";
					linkhea = linkhea+ "*" +ghea + "/100";
					linkpow = linkpow+"*" +gpow + "/100";
					linkinte = linkinte + "*" +ginte + "/100";
					linkmana = linkmana+ "*" +gmana + "/100";
					detaillink1 = "popupdetail.jsp?sort=oneSpecies&value="+species;
					pstmt2.close();
				}
				
				
				if(skill!=null)
				{
					pstmt3 = con.prepareStatement(sql3);
					pstmt3.setString(1,skill);
					rs3 = pstmt3.executeQuery();
					//종족에서 곱해진 값에다가 추가로 곱한다
					rs3.next();
					int ghea=rs3.getInt("체력증가");
					int gmana=rs3.getInt("마력증가");
					finalhea = finalhea* ghea/100;
					finalmana = finalmana* gmana/100;
					
					linkhea = linkhea+ "*" +ghea + "/100";
					linkmana = linkmana + "*" +gmana + "/100";
					detaillink2 = "popupdetail.jsp?sort=oneSkill&value="+skill;
					pstmt3.close();
				}

				
				pstmt4 = con.prepareStatement(sql4);
				pstmt4.setString(1,ID);
				rs4 = pstmt4.executeQuery();
				
				if(rs4.next()) //사용중인 장비들이 있음
				{
					
					int gatk=rs4.getInt("공증");
					int gdef=rs4.getInt("방증");
					int ginte=rs4.getInt("지증");
					int gpow=rs4.getInt("힘증");
					finalatk = finalatk + gatk;
					finaldef = finaldef + gdef;
					finalpow = finalpow + ginte;
					finalinte = finalinte + gpow;
					
					linkatk = linkatk + "+" +gatk;
					linkdef =  linkdef + "+" +gdef;
					linkpow = linkpow + "+" +gpow;
					linkinte = linkinte+ "+" +ginte;
					
					
				}
				
				pstmt4.close();	

				%>
				
				<tr>
					<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50><%=ID %></td>
					<td align ="center" width = 50> <%=name %></td>
					<td align ="center" width = 50> <%=age %></td>
					<td align ="center" width = 50> <%=home %></td>
					<td align ="center" width = 50><a href=<%=linkatk%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
													<%=finalatk %></a>(<%=atk %>)</td>
					<td align ="center" width = 50> <a href=<%=linkdef%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finaldef %></a>(<%=def %>)</td>
					<td align ="center" width = 50> <a href=<%=linkhea%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finalhea %></a>(<%=hea %>)</td>
					<td align ="center" width = 50><a href=<%=linkpow%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					 <%=finalpow %></a>(<%=pow %>)</td>
					<td align ="center" width = 50> <a href=<%=linkinte%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finalinte %></a>(<%=inte%>)</td>
					<td align ="center" width = 50><a href=<%=linkmana%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					 <%=finalmana %></a>(<%=mana%>)</td>
					<td align ="center" width = 50><a href=<%=detaillink1 %> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=species %></a></td> 
					<td align ="center" width = 50> <a href=<%=detaillink2 %> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=skill%></a></td> 

				</tr>
				
				<%
		
				
				
			}
			else if(selected2==5)
			{
				String skill = rs.getString("스킬명");
				int heabonus =  rs.getInt("체력증가");
				int manabonus =  rs.getInt("마력증가");
				String detaillink = "popupdetail.jsp?sort=searchHeroSkill&value="+skill;

				%>
				<tr>
					<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50><a href=<%=detaillink%> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=skill%></a> </td> 
					<td align ="center" width = 50><%=heabonus %></td>
					<td align ="center" width = 50> <%=manabonus %></td>
				</tr>
				<%
			}
			else if(selected2==6)
			{
				String species = rs.getString("종족명");
				int atkbonus =  rs.getInt("공격력보정");
				int defbonus =  rs.getInt("방어력보정");
				int heabonus =  rs.getInt("체력보정");
				int manabonus =  rs.getInt("마력보정");
				int powbonus =  rs.getInt("힘보정");
				int intebonus =  rs.getInt("지능보정");
				String detaillink = "popupdetail.jsp?sort=searchHeroSpecies&value="+species;
				%>
				<tr>
					<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50> <a href=<%=detaillink %> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=species %></a></td> 
					<td align ="center" width = 50><%=atkbonus %></td>
					<td align ="center" width = 50> <%=defbonus %></td>
					<td align ="center" width = 50><%=heabonus %></td>
					<td align ="center" width = 50> <%=manabonus %></td>
					<td align ="center" width = 50><%=powbonus %></td>
					<td align ="center" width = 50> <%=intebonus %></td>
				</tr>
				<%
			}
			else if(selected2>=7 && selected2<=9)
			{
				String item = rs.getString("아이템이름");
				String kindofitem = rs.getString("종류");
				int atkbonus =  rs.getInt("공격력_증가");
				int defbonus =  rs.getInt("방어력_증가");
				int powbonus =  rs.getInt("힘_증가");
				int intebonus =  rs.getInt("지능_증가");
				String ID = rs.getString("ID");
				
				String detaillink = "popupdetail.jsp?sort=oneHero&value="+ID;
				%>
				<tr>
					<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50> <%=item%></td> 
					<td align ="center" width = 50><%=kindofitem %></td>
					<td align ="center" width = 50> <%=atkbonus %></td>
					<td align ="center" width = 50><%=defbonus %></td>
					<td align ="center" width = 50> <%=powbonus %></td>
					<td align ="center" width = 50><%=intebonus %></td>
					<td align ="center" width = 50> <a href=<%=detaillink %> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=ID %></a></td>
				</tr>
				<%
			}
			else if(selected2==10)
			{
				String armyname = rs.getString("마물군단이름");
				int unitnum =  rs.getInt("병력수");
				int totalatk =  rs.getInt("총공격력");
				int totaldef =  rs.getInt("총방어력");
				int speed =  rs.getInt("이동력");
				int fighting =  rs.getInt("사기");
				
				int finalatk = totalatk;
				int finaldef = totaldef;
				int finalspeed = speed;
				int finalfighting = fighting; 
				
				
				sql2 = "select 마물군단이름 ,sum(군단공격력보정) as 공보, sum(군단방어력보정) as 방보, sum(군단이동력보정) as 이보, sum( 군단사기보정) as 사보 from 마물군단지휘, 마물장군 where 마물군단이름 =? and 마물군단지휘.마물장군이름 = 마물장군.마물장군이름 group by 마물군단이름";
						 

				String linksql = "popupdetail.jsp?sort=MA&value="; //monsterarmy 
				String linkatk =linksql+totalatk;
				String linkdef=linksql+totaldef;
				String linkspeed=linksql+speed;
				String linkfight=linksql+fighting;

				
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1,armyname);
				rs2 = pstmt2.executeQuery();
				String link = "popupdetail.jsp?sort=whoisMG&value=" +armyname;
				
				if(rs2.next()) //지휘를 받고있음
				{
					int gatk=rs2.getInt("공보");
					int gdef=rs2.getInt("방보");
					int gspeed=rs2.getInt("이보");
					int gfight=rs2.getInt("사보");
					finalatk = finalatk *gatk/100;
					finaldef = finaldef *gdef/100;
					finalspeed =  finalspeed* gspeed/100;
					finalfighting  =finalfighting  *gfight/100;
					
					linkatk = linkatk + "*" +gatk+ "/100";;
					linkdef =  linkdef + "*" +gdef+ "/100";;
					linkspeed = linkspeed + "*" +gspeed+ "/100";;
					linkfight = linkfight+ "*" +gfight+ "/100";;
					
				}
				%>
				<tr>
					<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50><a href=<%=link%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> <%=armyname%></a></td> 
					<td align ="center" width = 50><%=unitnum %></td>
					<td align ="center" width = 50><a href=<%=linkatk%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finalatk %></a> (<%=totalatk %>)</td>
					<td align ="center" width = 50><a href=<%=linkdef%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finaldef %></a>(<%=totaldef %>)</td>
					<td align ="center" width = 50><a href=<%=linkspeed%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finalspeed %></a>(<%=speed %>)</td>
					<td align ="center" width = 50><a href=<%=linkfight%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"> 
					<%=finalfighting %></a>(<%=fighting %>)</td>
				</tr>
				<%
			}
			else if(selected2>=11 && selected2<=13)
			{
				String name = rs.getString("마물장군이름");
				int age =  rs.getInt("나이");
				int atkbonus =  rs.getInt("군단공격력보정");
				int defbonus =  rs.getInt("군단방어력보정");
				int speedbonus =  rs.getInt("군단이동력보정");
				int fightbonus =  rs.getInt("군단사기보정");
				String enemy = rs.getString("천적종족");
				String datalink = "popupdetail.jsp?sort=oneSpecies&value=" +enemy;
				
				String link = "popupdetail.jsp?sort=whoisMA&value=" +name;
				%>
				<tr>
				<td align ="center" width = 50> <%=count %></td> 
					<td align ="center" width = 50> <a href=<%=link%> onClick="window.open(this.href, '', 'width=400, height=230'); return false;"><%=name %></a></td> 
					<td align ="center" width = 50> <%=age%></td> 
					<td align ="center" width = 50><%=atkbonus %></td>
					<td align ="center" width = 50> <%=defbonus %></td>
					<td align ="center" width = 50><%= speedbonus%></td>
					<td align ="center" width = 50> <%=fightbonus %></td>
					<td align ="center" width = 50><a href=<%=datalink %> onClick="window.open(this.href, '', 'width=500, height=700'); return false;"> <%=enemy%></a></td>
				</tr>
				<%
			}
			
			count = count+1;
		}
		
		rs.close();
		stmt.close();
		pstmt.close();
	   	con.close();
	
		%></table><%
		%></form><%
	}
	%>
<hr>
<button type = "button"  onclick = "location.href='analyst.jsp'" >분석가 기능 </button>

<hr>
</body>
</html>