<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구볼래? 로그인</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<%@ include file="Head.jsp" %>
<div class="controller">
	<form action="login.do" method="post" >
		<table>
			<tr>
				<td colspan="2" align="center"><h1>Let's Play Baseball!</h1></td>
			</tr>
			<tr>
				<td width="300px"></td>
				<td></td>
			</tr>
			<tr>
				<td>아이디<br></td>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" required></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input id="sbutton" type="submit" value="LOGIN"></td>
			</tr>
			<tr>
				<td></td>
				<td align="right">${error }</td>
			</tr>
		</table>	
	</form>
	<div>
		<button> -- </button>
		<a href="home.jsp"><button>홈으로</button></a>
	</div>
</div>
</body>
</html>