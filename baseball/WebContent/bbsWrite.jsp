<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="css/write.css">
</head>
<body>

<%
	String team = request.getParameter("team");

	//이미지 처리
	String saveDirectory = pageContext.getServletContext().getRealPath("/upimg");
	System.out.println(saveDirectory);
	
	File saveDir = new File(saveDirectory);
	if (!saveDir.exists()) saveDir.mkdirs();
	
	HttpSession s = request.getSession();
	s.setAttribute("saveDirectory", saveDirectory);
%>

<%@ include file="Head.jsp" %>

<div id="write">
	<form action="bbswrite.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="100px">카테고리</td>
				<td>
				<select name="bbsCategory" id="category">
					<option>1루</option>
					<option>3루</option>
					<option>외야</option>
				</select>
				</td>
			</tr>
			<tr>	
				<td>게시판 정보</td>
				<td><input type="text" name="team" value="<%= team %>" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bbsTitle" id="title" required/></td>
			</tr>
			<tr>	
				<td colspan="2">
				<textarea rows="12" cols="50" name="bbsContent" required></textarea></td>
			</tr>
			<tr>	
				<td colspan="2">
				<input type="file" name="bbsImg"></td>
			</tr>
			<tr>	
				<td colspan="2" align="right">
				<input type="submit" value="작성하기" id="button"></td>
			</tr>
		</table>
	</form>
	
	<div>
		<a href="bbslist.do?team=<%= team %>"><button>게시판</button></a>
		<a href="home.jsp"><button>홈으로</button></a>
	</div>
</div>
</body>
</html>