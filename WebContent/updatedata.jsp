<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>관리자 기능-수정</title>
</head>
<body>


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
try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 
	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt =con.createStatement();
	String sql = null;
	
	String sorted = request.getParameter("sorts");
	String updating = request.getParameter("updating");
	if(!(sorted==null)&&!(updating==null)) //분류에 대한 정보 
	{
		if(sorted.equals("Hero"))
		{
			String last = "updateSomething.jsp?sort=Hero&updated=" + updating;
			boolean valid = true;
			String ID = request.getParameter("heroID");
			String PS = request.getParameter("PASSWORD");
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
			
			
			if(!(ID=="")) //아이디가 들어오면 
			{
				sql = "select ID From 용사 where ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,ID);
				rs = pstmt.executeQuery();
				
				if(rs.next()) //id검사         //id 중복검사
				{
					valid =false;
					%>	
					<script>
					      alert('중복된 id 입니다.');
					      document.location.href="updateSomething.jsp?sort=Hero&updated=" +updating;
					 </script>
					<%
				}
				pstmt.close();
			}
			
			if(!(species=="")) //종족
			{
				sql = "select 종족명 From 종족 where 종족명=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,species);
				rs = pstmt.executeQuery();
				
				if(!(rs.next())) //종족이 없다
				{
					valid =false;
					%>	
					<script>
					      alert('없는 종족 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";
					 </script>
					<%
				}
				pstmt.close();
			}
			if(!(skill=="")) //스킬
			{
				sql = "select 스킬명 From 스킬 where 스킬명=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,skill);
				rs = pstmt.executeQuery();
				
				if(!(rs.next())) //스킬
				{
					valid =false;
					%>	
					<script>
					      alert('없는 스킬 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";

					 </script>
					<%
				}
				pstmt.close();
				
				sql = "select 스킬명 From 용사 where 스킬명=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,skill);
				rs = pstmt.executeQuery();
				
				if(rs.next()) //스킬
				{
					valid =false;
					%>	
					<script>
					      alert('이미 사용되는 스킬 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";

					 </script>
					<%
				}
				pstmt.close();
			}
			
			if(valid)
			{
				if(!(ID.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set ID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,ID);
				
					pstmt.executeUpdate();
					
					pstmt.close();
				}
				if(!(ID.isEmpty())) //ps
				{
					sql = "update 용사 set PASSWORD=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,PS);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(age.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 나이=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,age);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(name.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 이름=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,name);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(home.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set home=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,home);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(atk.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 공격력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,atk);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(def.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 방어력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,def);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(hea.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 체력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,hea);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(pow.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 힘=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,pow);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(inte.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 지능=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,ID);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(mana.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 마력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,mana);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(species.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 종족명=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,species);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(skill.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 용사 set 스킬명=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,skill);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				
				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";
				 </script>
				<%
			}
			//UPDATE PLAYER
			//SET BACK_NO = 99;


			%>	
			<script>
			      alert('변경 실패.');
			      document.location.href="adminfunction.jsp?adminfunc=a&adminfuncsel=c";
			 </script>
			<%
		}
		else if(sorted.equals("Skill"))
		{
			String skillname = request.getParameter("skillname");
			String heabonus = request.getParameter("heabonus");
			String manabonus = request.getParameter("manabonus");
			boolean valid = true;
			
			sql = "select 스킬명 From 스킬 where 스킬명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,skillname);
			rs = pstmt.executeQuery();

			if(rs.next()) //id검사         //id 중복검사
			{
				valid = false;
				%>	
				<script>
				      alert('중복된 스킬명입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
			if(valid)
			{
				if(!(skillname.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 스킬 set 스킬명=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,skillname);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(heabonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 스킬 set 체력증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,heabonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(manabonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 스킬 set 마력증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,manabonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
			
		}
		else if(sorted.equals("Species"))
		{
			String speciesname = request.getParameter("speciesname");
			String atkbonus = request.getParameter("atkbonus");
			String defbonus = request.getParameter("defbonus");
			String heabonus = request.getParameter("heabonus");
			String manabonus = request.getParameter("manabonus");
			String powbonus = request.getParameter("powbonus");
			String intebonus = request.getParameter("intebonus");
			boolean valid = true;
			
			sql = "select 종족명 From 종족 where 종족명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,speciesname);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) //id검사         //id 중복검사
			{
				valid = false;
				%>	
				<script>
				      alert('중복된 종족명입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=c";
				 </script>
				<%
			}
			if(valid)
			{
				if(!(speciesname.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 종족명=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,speciesname);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(atkbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 공격력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,atkbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(defbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 방어력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,defbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(heabonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 체력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,heabonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(manabonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 마력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,manabonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(powbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 힘보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,powbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(intebonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 종족 set 지능보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,intebonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				
				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=c";
				 </script>
				<%
			}

		}
		else if(sorted.equals("Item"))
		{
			String itemname = request.getParameter("itemname");
			String kind = request.getParameter("kind");
			String atkbonus = request.getParameter("atkbonus");
			String defbonus = request.getParameter("defbonus");
			String powbonus = request.getParameter("powbonus");
			String intebonus = request.getParameter("intebonus");
			String ID = request.getParameter("ID");
			boolean valid = true;
			
			
			
			if(!(kind=="")) //
			{
				if(!(kind.equals("칼")||kind.equals("창")||kind.equals("활")||kind.equals("갑옷")||kind.equals("방패")))
				{
					valid = false;
					%>	
					<script>
					      alert('올바르지 않은 아이템 종류입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=c";
					 </script>
					<%
				}
			}

			if(!(ID=="")) //
			{
				sql = "select ID From 용사 where ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,ID);
				rs = pstmt.executeQuery();
				
				if(!(rs.next()))
				{
					valid = false;
					%>	
					<script>
					      alert('존재하지 않는 용사 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=c";
					 </script>
					<%
				}
				pstmt.close();
			}
			
			sql = "select 아이템이름 From 아이템 where 아이템이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,itemname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) //id검사         //id 중복검사
			{
				valid = false;
				%>	
				<script>
				      alert('중복된 아이템이름입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=c";
				 </script>
				<%
				
				
			}
			if(valid)
			{
				if(!(itemname.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set 아이템이름=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,itemname);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(atkbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set 공격력_증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,atkbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(defbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set 방어력_증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,defbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(powbonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set 힘_증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,powbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(intebonus.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set 지능_증가=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,intebonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(ID.isEmpty())) //아이디가 들어오면 
				{
					sql = "update 아이템 set ID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,ID);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("MA"))
		{

			
			String maName = request.getParameter("maName");
			String unit = request.getParameter("unit");
			String atkbonus = request.getParameter("atkbonus");
			String defbonus = request.getParameter("defbonus");
			String speed = request.getParameter("speed");
			String fighting = request.getParameter("fighting");
			boolean valid = true;
			
			

			if(!(maName=="")) //
			{
				sql = "select 마물군단이름 From 마물군단 where 마물군단이름=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,maName);
				rs = pstmt.executeQuery();
				
				if((rs.next()))
				{
					valid = false;
					%>	
					<script>
					      alert('중복된 군단명 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=c";
					 </script>
					<%
				}
				pstmt.close();
			}
			
			
			if(valid)
			{
				if(!(maName.isEmpty())) //
				{
					sql = "update 마물군단 set 마물군단이름=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,maName);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(unit.isEmpty())) //
				{
					sql = "update 마물군단 set 병력수=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,maName);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(atkbonus.isEmpty())) //
				{
					sql = "update 마물군단 set 총공격력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,atkbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(defbonus.isEmpty())) //
				{
					sql = "update 마물군단 set 총방어력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,defbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(speed.isEmpty())) //
				{
					sql = "update 마물군단 set 이동력=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,speed);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(fighting.isEmpty())) //
				{
					sql = "update 마물군단 set 사기=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,fighting);
					pstmt.executeUpdate();
					pstmt.close();
				}
				

				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("MG"))
		{
			String mgName = request.getParameter("mgName");
			String age = request.getParameter("age");
			String atkbonus = request.getParameter("atkbonus");
			String defbonus = request.getParameter("defbonus");
			String speed = request.getParameter("speed");
			String fighting = request.getParameter("fighting");
			String enemy = request.getParameter("enemy");
			
			boolean valid = true;
			
			

			if(!(mgName=="")) //
			{
				sql = "select 마물장군이름 From 마물장군 where 마물장군이름=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,mgName);
				rs = pstmt.executeQuery();
				
				if((rs.next()))
				{
					valid = false;
					%>	
					<script>
					      alert('중복된 장군명 입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=c";
					 </script>
					<%
				}
				pstmt.close();
			}
			
			if(!(enemy=="")) //
			{
				sql = "select 종족명 From 종족 where 종족명=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,enemy);
				rs = pstmt.executeQuery();
				
				if(!(rs.next()))
				{
					valid = false;
					%>	
					<script>
					      alert('존재하지 않는 종족입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=c";
					 </script>
					<%
				}
				pstmt.close();
			}
			
			
			if(valid)
			{
				if(!(mgName.isEmpty())) //
				{
					sql = "update 마물장군 set 마물장군이름=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,mgName);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(age.isEmpty())) //
				{
					sql = "update 마물장군 set 나이=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,age);
					pstmt.executeUpdate();
					pstmt.close();
				}

				if(!(atkbonus.isEmpty())) //
				{
					sql =  "update 마물장군 set 군단공격력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,atkbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(defbonus.isEmpty())) //
				{
					sql = "update 마물장군 set 군단방어력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,defbonus);
					pstmt.executeUpdate();
					pstmt.close();
				}
				
				if(!(speed.isEmpty())) //
				{
					sql =  "update 마물장군 set 군단이동력보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,speed);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(fighting.isEmpty())) //
				{
					sql =  "update 마물장군 set 군단사기보정=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,fighting);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(enemy.isEmpty())) //
				{
					sql =  "update 마물장군 set 천적종족=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,enemy);
					pstmt.executeUpdate();
					pstmt.close();
				}
				

				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=c";
				 </script>
				<%
			}
		}
		else if(sorted.equals("Admin"))
		{
			String ID = request.getParameter("ID");	
			String PS = request.getParameter("PS");
			boolean valid = true;
			
			sql = "select ID From admin where ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,ID);
			rs = pstmt.executeQuery();

			if(rs.next()) //id검사         //id 중복검사
			{
				valid = false;
				%>	
				<script>
				      alert('중복된 스킬명입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=c";
				 </script>
				<%
			}
			if(valid)
			{
				if(!(ID.isEmpty())) //아이디가 들어오면 
				{
					sql = "update admin set ID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,ID);
					pstmt.executeUpdate();
					pstmt.close();
				}
				if(!(PS.isEmpty())) //아이디가 들어오면 
				{
					sql = "update admin set PS=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,PS);
					pstmt.executeUpdate();
					pstmt.close();
				}
			
				
				
				%>	
				<script>
				      alert('변경 완료.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=c";
				 </script>
				<%
			}
			else
			{
				%>	
				<script>
				      alert('변경 실패.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=c";
				 </script>
				<%
			}
			
		}
		else if(sorted.equals("Command"))
		{
			
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