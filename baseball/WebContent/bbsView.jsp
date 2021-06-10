<%@page import="baseball.vo.Bbs"%>
<%@page import="java.util.List"%>
<%@page import="baseball.dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bbsview.bbstitle } - 게시판</title>
<link rel="stylesheet" href="css/view.css">
</head>
<body>

<%@ include file="Head.jsp" %>

<div class="controller">
		<table>
			<tr>
				<th rowspan="3" align="center" width="650px" id="upimg"><img id="img" src="upimg/${bbsview.bbsimg }"></th>
				<th colspan="3" align="left"><h1>${bbsview.bbstitle }</h1></th>
			</tr>
			<tr>
				<td width="200px">카테고리 : ${bbsview.bbscategory }</td>
				<td width="200px">작성자 : ${bbsview.id }</td>
				<td width="200px" align="right">${bbsview.bbsdate }</td>
			</tr>
			<tr id="content" valign="top" style="border-top-color: rgb(100, 100, 100); border-top-width: 1px">
				<td colspan="3"><h3>${bbsview.bbscontent }</h3></td>
			</tr>
			<tr>
				<td align="right">${error }</td>
				<td><a href="bbsdelete.do?bbsid=${bbsview.bbsid }"><button>게시물 삭제</button></a></td>
				<td><a href="bbslist.do?team=${bbsview.team }"><button>게시판</button></a></td>
				<td><a href="home.jsp"><button>홈으로</button></a></td>
			</tr>	
		</table>
	<div>
		
		
	</div>
</div>
</body>
</html>