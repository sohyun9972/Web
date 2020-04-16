<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 게시판 웹사이트</title>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collpsed"
				data-toggle="colapse" data-target="#bs-example-navbar-collapse=1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 Web 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">					
				<li><a href="main.jsp">메인</a></li>		
   				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">	
				<li class="dropdown">					
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>		
					<ul class="dropdown-menu">											
						<li class="active"><a href="login.jsp">로그인</a></li>			
						<li><a href="join.jsp">회원가입</a></li>							
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">				<!-- 로그인 양식만들기, container를 사용하여 감싸주기 -->
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">	<!-- post는 정보를 숨기면서 보내는 방식, loginAction.jsp페이지에 로그인 정보를 넘겨줌 -->
					<h3 style="text-align: center;">로그인 화면</</h3>
					<div class="from-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>									<!-- placeholder는 아무것도 입력되지 않았을때 보여지는것 -->
					<div class="from-group">
						<input type="password" class="form-control" placeholer="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">	<!-- 로그인 버튼 구현 -->
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div><!-- 나는 개똥벌레 친구가 없네 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>