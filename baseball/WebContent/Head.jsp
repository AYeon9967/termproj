<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
ul {
  list-style: none;
}
a {
  text-decoration: none;
}
#header {
  width: 1600px;
  height: 290px;
  margin: 0px auto;
  background: #980000;
  background: linear-gradient(180deg, #980000, #FFFFFF)
}
#logo {
  float: center;
  height: 150px;
  width: 400px;
  margin: 0px auto;
  padding: 40px;
}
nav {
  float: right;
  width: 230px;
  height: 50px; 
}
#topMenu {  
  height: 60px;
  margin: 0 auto;
}
#topMenu > li {
  float: left; 
  position: relative;  
}
#topMenu > li > a{
  display: block;
  font-size: 1.1em;
  font-weight: 600;
  padding: 10px 15px;
  color: black;
}
</style>
<body>

<header id="header">
		<div id="logo">
			<a href="home.jsp"><img src="css/images/LOGO.png"></a>
		</div>
	<% 
		String sessionID = (String)session.getAttribute("id");
		if(sessionID == null) { %>
			<nav>
			<ul id="topMenu">
					<li><a href="memberLogin.jsp">로그인</a></li>
					<li><a href="memberJoin.jsp">회원가입</a></li>
			</ul>
			</nav>
	<% } else { %>
		<nav>
			<ul id="topMenu">
				<li> <a href="mypage.do"><%= sessionID %> 님 접속중</a> </li>
			</ul>
		</nav>
	<% } %>
</header>

</body>
</html>