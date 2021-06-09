<%@page import="baseball.vo.Bbs"%>
<%@page import="java.util.List"%>
<%@page import="baseball.dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bbsview.bbstitle } - 게시판</title>
<style>
* {
	margin: 4px 0;
}

.controller {
	padding: 25px 0;
	margin: auto;
	width: 800px;
}

#bbsTitle {
	text-align: center;
	background-color: rgb(100, 100, 100);
	width: 800px;
	height: 20px;
	padding: 12px 0;
	color: white;
}

table {
	width: 800px;
	margin: 25px 0;
	padding: 20px;
	border-collapse: collapse;
}

tr {
	height: 40px;
}

#content {
	width: 800px;
	height: 400px;
	text-align: left;
}

.btn1 {
	width: 100px;
	padding: 5px 12px;
	border: none;
	background-color: rgb(150, 60, 60);
	color: white;
}

.btn2 {
	padding: 5px 12px;
	background-color: white;
	border-color: rgb(180, 180, 180);
	border-width: 1px;
}

</style>
</head>
<body>
	<div class="controller">
		<div id="bbsTitle">
			<b>게시글 보기</b>
		</div>
		<table>
			<tr>
				<th colspan="3" align="left"><h3>${bbsview.bbstitle }</h3></th>
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
		<div id="btnCon">
			<a href="bbs.do">
				<button class="btn2">목록</button>
			</a>
		</div>
		<div>
			<a href="home.do">
				<button class="btn2">홈으로</button>
			</a>
		</div>
	</div>
</body>
</html>