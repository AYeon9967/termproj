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
	<form id="login" method="post" action="login.do">
		<h1>Let's Play Baseball!</h1>
		<fieldset>
			<ul>
				<li>
					<label for="id">아이디</label>
           			<input type="text" name="id" required>
				</li>
				<li>
          			<label for="pwd">비밀번호</label>
         			<input type="password" name="pwd" required>
         		</li>
			</ul>
			${error }<br>
			<input type = "submit" value = "LOGIN">
		</fieldset>

	</form>

</body>
</html>