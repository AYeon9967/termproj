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
				<th colspan="3" align="left"><h2>${bbsview.bbstitle }</h2></th>
			</tr>
			<tr>
				<td width="30%">카테고리 : ${bbsview.bbscategory }</td>
				<td width="30%">작성자 : ${bbsview.id }</td>
				<td width="30%" align="right">${bbsview.bbsdate }</td>
			</tr>
			<tr id="content" valign="top" style="border-top-color: rgb(100, 100, 100); border-top-width: 1px">
				<td colspan="3">${bbsview.bbscontent }</td>
			</tr>
			<tr>
				<td colspan="3"> ${bbsview.bbsimg }</td>
			</tr>
		</table>
	<div>
		<a href="bbslist.do?team=${bbsview.team }"><button>게시판</button></a>
		<a href="home.jsp"><button>홈으로</button></a>
	</div>
</div>
</body>
</html>