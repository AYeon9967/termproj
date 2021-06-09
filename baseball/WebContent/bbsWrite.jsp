<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
<%
	String team = request.getParameter("team");
%>

<form action="bbswrite.do" method="post">

	<input type="hidden" name="team" value="<%= team %>">

	<select name="bbsCategory" id="category">
		<option>1루</option>
		<option>3루</option>
		<option>외야</option>
	</select><br>
		
	제목: <input type="text" name="bbsTitle" required id="title" /><br>

	<textarea rows="12" cols="50" name="bbsContent" required></textarea><br>
	
	<input type="file" name="bbsImg"><br>
							
	<input type="submit" value="작성하기" class="button">
</form>

</body>
</html>