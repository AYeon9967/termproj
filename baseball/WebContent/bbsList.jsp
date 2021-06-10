<%@page import="java.sql.Timestamp"%>
<%@page import="baseball.vo.Bbs"%>
<%@page import="java.util.List"%>
<%@page import="baseball.dao.BbsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="css/list.css">
</head>
<%
String team = request.getParameter("team");
BbsDao bbsDao = BbsDao.getInstance();
List<Bbs> list = bbsDao.selectList(team);
%>

<body>

<%@ include file="Head.jsp" %>

<div class="controller">
	<table>
		<tr>
			<td id="simg" colspan="5" height="710px"><img src="css/images/s<%= team %>.jpg"></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<th width="100px">카테고리</th>
			<th width="250px">제목</th>
			<th width="500px">내용</th>
			<th width="100px">작성자</th>
			<th width="150px">날짜</th>
		</tr>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd, hh:mm");
	int count = 0;
	
	for (Bbs b : list) {
	%>
		<tr>
			<td><%=b.getBbscategory() %></td>
			<td><b><a href="bbsview.do?bbsid=<%=b.getBbsid() %>"><%=b.getBbstitle() %></a></b></td>
			<td><%=b.getBbscontent() %></td>
			<td><%=b.getId() %></td>
			<td><%=b.getBbsdate() %></td>
		</tr>
		<%
		count++;
	}
	if (count == 0) { %> <tr><td colspan="5">작성한 게시글이 없습니다.</td></tr> <% } %>
	</table>
</div>

<div id="but">
	<% if(sessionID == null) { %>
		<p>글쓰기 활동은 회원만 가능합니다.<br>
		<a href="home.jsp"><button>홈으로</button></a>
	<% } else { %>
		<a href="bbsWrite.jsp?team=<%= team %>"><button>글쓰기</button></a> 
		<a href="home.jsp"><button>홈으로</button></a>
	<% } %>
		
	
</div>

</body>
</html>