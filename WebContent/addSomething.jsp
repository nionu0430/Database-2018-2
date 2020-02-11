<%@ page import =  "java.sql.*"%>
<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<html>
<head>
<meta http-equiv = "Content-type" content = "text/html; charset = UTF-8">
<title>관리자 기능-등록</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
Connection con = null; 
PreparedStatement pstmt= null;
ResultSet rs = null;
String sql = null;

try {
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; 

	con = DriverManager.getConnection(DB_URL, "System", "Jm&Jelv4ev");	
	Statement stmt =con.createStatement();
	
	String sorted = request.getParameter("sort");
	
	if(!(sorted==null))
	{
		if(sorted.equals("Skill"))
		{
			String skillname = request.getParameter("skillname");
			String heabonus = request.getParameter("heabonus");
			String manabonus = request.getParameter("manabonus");
			boolean valid = true;
			
			if(heabonus.isEmpty() ||manabonus.isEmpty() ||skillname.isEmpty())
			{
				 valid = false;
				%>	
				<script>
				      alert('정보를 모두입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=b";
				 </script>
				<%
			}
			
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
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=b";
				 </script>
				<%
			}
				
			
			pstmt.close();
			
			if(valid)
			{
				sql = "insert into 스킬 values(?,?,?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,skillname);
				pstmt.setString(2,heabonus);
				pstmt.setString(3,manabonus);
				
				pstmt.executeUpdate();
	
				rs.close();
				pstmt.close();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=b&adminfuncsel=b";
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
			
			if(speciesname.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('종족명을 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=b";
				 </script>
				<%
			}

			sql = "select 종족명 From 종족 where 종족명=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,speciesname);
			rs = pstmt.executeQuery();


			if(rs.next()) //  중복검사
			{
				valid = false;
				pstmt.close();
				%>	
				<script>
				      alert('중복된 종족명입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=b";
				 </script>
				<%

			}
			
			pstmt.close();
			if(valid)
			{
				sql = "insert into 종족 values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,speciesname);
				pstmt.setString(2,atkbonus);
				pstmt.setString(3,defbonus);
				pstmt.setString(4,heabonus);
				pstmt.setString(5,manabonus);
				pstmt.setString(6,powbonus);
				pstmt.setString(7,intebonus);

				pstmt.executeUpdate();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=c&adminfuncsel=b";
				 </script>
				<%
			}
		
				
			
			rs.close();
			pstmt.close();
			
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
			if(itemname.isEmpty() ||kind.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('아이템이름과 종류를 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
				 </script>
				<%
			}
			
			if(!(kind.equals("칼")||kind.equals("창")||kind.equals("활")||kind.equals("갑옷")||kind.equals("방패")))
			{
				valid = false;
				%>	
				<script>
				      alert('올바르지 않은 아이템 종류입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
				 </script>
				<%
			}
			
			if(!(ID.isEmpty())) //id 가 입력되었을때
			{
				sql = "select ID From 용사 where ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,ID);
				rs = pstmt.executeQuery();
				if(!rs.next()) //  중복검사
				{
					valid = false;
					pstmt.close();
					%>	
					<script>
					      alert('존재하지 않는 용사입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
					 </script>
					<%
				}
				pstmt.close();
			}
			
			

			sql = "select 아이템이름 From 아이템 where 아이템이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,itemname);
			rs = pstmt.executeQuery();
		

			if(rs.next()) //  중복검사
			{
				valid = false;
				pstmt.close();
				%>	
				<script>
				      alert('이미 존재하는 아이템입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
				 </script>
				<%
			}

			if(valid)
			{
				pstmt.close();
				sql = "insert into 아이템 values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,itemname);
				pstmt.setString(2,kind);
				pstmt.setString(3,atkbonus);
				pstmt.setString(4,defbonus);
				pstmt.setString(5,powbonus);
				pstmt.setString(6,intebonus);
				pstmt.setString(7,ID);

				pstmt.executeUpdate();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
				 </script>
				<%
			}
			else
			{
				
				%>	
				<script>
				      alert('등록에 문제가 생겼습니다.');
				      document.location.href="adminfunction.jsp?adminfunc=d&adminfuncsel=b";
				 </script>
				<%
			}
				
			rs.close();
			pstmt.close();

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
			
			if(maName.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('마물군단이름을 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=b";
				 </script>
				<%
			}

			sql = "select 마물군단이름 From 마물군단 where 마물군단이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,maName);
			rs = pstmt.executeQuery();
		
			if(rs.next()) //  중복검사
			{
				valid = false;
				pstmt.close();
				%>	
				<script>
				      alert('이미 존재하는 군단입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=b";
				 </script>
				<%
			}

			if(valid)
			{
				pstmt.close();
				sql = "insert into 마물군단 values(?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,maName);
				pstmt.setString(2,unit);
				pstmt.setString(3,atkbonus);
				pstmt.setString(4,defbonus);
				pstmt.setString(5,speed);
				pstmt.setString(6,fighting);
	
				pstmt.executeUpdate();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=b";
				 </script>
				<%
			}
			else
			{
				
				%>	
				<script>
				      alert('등록에 문제가 생겼습니다.');
				      document.location.href="adminfunction.jsp?adminfunc=e&adminfuncsel=b";
				 </script>
				<%
			}
				
			rs.close();
			pstmt.close();

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
			
			if(mgName.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('마물군단이름을 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=b";
				 </script>
				<%
			}
			
			if(!(enemy.isEmpty()))
			{
				sql = "select 종족명 From 종족 where 종족명=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,enemy);
				rs = pstmt.executeQuery();
				if(!rs.next()) //  중복검사
				{
					valid = false;
					pstmt.close();
					%>	
					<script>
					      alert('존재하지 않는 종족입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=b";
					 </script>
					<%
				}
				pstmt.close();
			}

			sql = "select 마물장군이름 From 마물장군 where 마물장군이름=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mgName);
			rs = pstmt.executeQuery();
		
			if(rs.next()) //  중복검사
			{
				valid = false;
				pstmt.close();
				%>	
				<script>
				      alert('이미 존재하는 장군입니다.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=b";
				 </script>
				<%
			}

			if(valid)
			{
				pstmt.close();
				sql = "insert into 마물장군 values(?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,mgName);
				pstmt.setString(2,age);
				pstmt.setString(3,atkbonus);
				pstmt.setString(4,defbonus);
				pstmt.setString(5,speed);
				pstmt.setString(6,fighting);
				pstmt.setString(7,enemy);
	
				pstmt.executeUpdate();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=b";
				 </script>
				<%
			}
			else
			{
				
				%>	
				<script>
				      alert('등록에 문제가 생겼습니다.');
				      document.location.href="adminfunction.jsp?adminfunc=f&adminfuncsel=b";
				 </script>
				<%
			}
				
			rs.close();
			pstmt.close();

		}
		else if(sorted.equals("Command"))
		{
			String maName = request.getParameter("maName");	
			String mgName = request.getParameter("mgName");
			boolean valid = true;
			
			if(mgName.isEmpty()||maName.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('마물장군과 마물군단을 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=h&adminfuncsel=b";
				 </script>
				<%
			}
			else
			{
				sql = "select 마물군단이름 From 마물군단 where 마물군단이름=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,maName);
				rs = pstmt.executeQuery();
				if(!(rs.next())) //  중복검사
				{
					valid = false;
					pstmt.close();
					%>	
					<script>
					      alert('존재하지 군단입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=h&adminfuncsel=b";
					 </script>
					<%
				}
				pstmt.close();
				
				sql = "select 마물장군이름 From 마물장군 where 마물장군이름=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,mgName);
				rs = pstmt.executeQuery();
				if(!(rs.next())) //  중복검사
				{
					valid = false;
					pstmt.close();
					%>	
					<script>
					      alert('존재하지 않는 장군입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=h&adminfuncsel=b";
					 </script>
					<%
				}
				pstmt.close();
				
				if(valid)
				{
					pstmt.close();
					sql = "insert into 마물군단지휘 values(?,?)";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1,maName);
					pstmt.setString(2,mgName);
					
					pstmt.executeUpdate();
					
					%>	
					<script>
					      alert('등록 성공.');
					      document.location.href="adminfunction.jsp?adminfunc=h&adminfuncsel=b";
					 </script>
					<%
				}
				else
				{
					%>	
					<script>
					      alert('등록에 문제가 생겼습니다.');
					      document.location.href="adminfunction.jsp?adminfunc=h&adminfuncsel=b";
					 </script>
					<%
				}
				rs.close();
				pstmt.close();
			}
			

		}
		else if(sorted.equals("Admin"))
		{
			String ID = request.getParameter("ID");	
			String PS = request.getParameter("PS");
			boolean valid = true;
			
			if(ID.isEmpty()||PS.isEmpty())
			{
				valid = false;
				%>	
				<script>
				      alert('아이디와 비밀번호를 입력해주세요.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=b";
				 </script>
				<%
			}
			
			if(!(ID.isEmpty()))
			{
				sql = "select ID From admin where ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,ID);
				rs = pstmt.executeQuery();
				if(rs.next()) //  중복검사
				{
					valid = false;
					pstmt.close();
					%>	
					<script>
					      alert('중복된 ID입니다.');
					      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=b";
					 </script>
					<%
				}
				pstmt.close();
			}

		

			if(valid)
			{
				pstmt.close();
				sql = "insert into admin values(?,?)";

				pstmt = con.prepareStatement(sql);

				pstmt.setString(1,ID);
				pstmt.setString(2,PS);
				
				pstmt.executeUpdate();
				
				%>	
				<script>
				      alert('등록 성공.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=b";
				 </script>
				<%
			}
			else
			{
				
				%>	
				<script>
				      alert('등록에 문제가 생겼습니다.');
				      document.location.href="adminfunction.jsp?adminfunc=g&adminfuncsel=b";
				 </script>
				<%
			}
				
			rs.close();
			pstmt.close();

		}
	}
	else
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