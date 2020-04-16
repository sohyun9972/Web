<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>	<!-- 우리가 만든 클래스를 가져오기 위해 import -->
<%@ page import="java.io.PrintWriter" %>	<!-- 자바스크립트 문장을 사용하기 위해 -->
<% request.setCharacterEncoding("UTF-8"); %>	<!-- 건너오는 모든 데이터를 UTF-8으로 받기 위해 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 한명의 회원정보를 담는 user를 javaBeans로써 사용-->
<!-- javaBean 사용알리고 id를 부여하고 scope를 해서 현재페이지 안에서만 Beans가 사용되게함 -->
<jsp:setProperty name="user" property="userID" />
<!-- 로그인페이지에서 넘겨준 userID를 그대로 받아서 한명의 사용자의 userID에 넣어줌-->
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>

<head>
<title>JSP 게시판 웹사이트</title>
</head>

<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());		// 로그인 시도
		if(result == 1) {										// UserDAO에서 로그인 시도에 따른 return값이 0,-1,-2로 넘어옴
			PrintWriter script = response.getWriter();				// 스크립트 문장을 넣을 수 있게 함
			script.println("<script>");							// 스크립트 문장을 유동적으로 실행할 수 있게
			script.println("location.href = 'main.jsp'");		// 로그인이 성공할시 main.jsp로 이동
			script.println("</script>");
		}
		else if(result == 0) {								
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");		
			script.println("history.back()");				// 이전페이지로 돌아가게, login.jsp로 돌아감
			script.println("</script>");
		}
		else if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		%>
</body>
</html>