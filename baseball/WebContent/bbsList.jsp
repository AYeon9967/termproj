<%@page import="java.sql.Timestamp"%>
<%@page import="baseball.vo.Bbs"%>
<%@page import="java.util.List"%>
<%@page import="baseball.dao.BbsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<style>
.controller {
	padding: 25px 0;
	margin: auto;
	width: 840px;
	text-align: center;
}
table {
	width: 840px;
	padding: 10px 0;
	border-collapse: collapse;
}
th {
	background-color: rgb(100, 100, 100);
	color: white;
}
button {
	margin: 4px 0;
	padding: 10px 0;
	width: 840px;
	background-color: rgb(255, 80, 80);
	color: white;
	border: none;
}
a {
	text-decoration: none;
	color: black;
}
a:hover {
	text-decoration-line: underline;
}
</style>
</head>
<body>
<%
String sessionID = (String)session.getAttribute("id");

String team = request.getParameter("team");
String image = null;
if(team.equals("lg")) { image = "css/images/lg.jpg"; }
else if(team.equals("samsung")) { image = "css/images/samsung.jpg"; }
else if(team.equals("nc")) { image = "css/images/nc.jpg"; }
else if(team.equals("kt")) { image = "css/images/kt.jpg"; }
else if(team.equals("doosan")) { image = "css/images/doosan.jpg"; }
else if(team.equals("ssg")) { image = "css/images/ssg.jpg"; }
else if(team.equals("lotte")) {	image = "css/images/lotte.jpg"; }
else if(team.equals("hanhwa")) { image = "css/images/hanhwa.jpg"; }
else if(team.equals("kiwoom")) { image = "css/images/kiwoom.jpg"; }
else if(team.equals("kia")) { image = "css/images/kia.jpg"; }

BbsDao bbsDao = BbsDao.getInstance();
List<Bbs> list = bbsDao.selectList(team);
%>
<div class="controller">

<div>
	<img src=<%= image %>>
</div>

<table>
<tr>
<th width="100px">카테고리</th>
<th width="40px">번호</th>
<th width="150px">제목</th>
<th>내용</th>
<th width="100px">작성자</th>
<th width="150px">날짜</th>
<th width="40px">조회</th>
</tr>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
int count = 0;
for (Bbs b : list) {
	%>
	<tr>
	<td><%=b.getBbscategory() %></td>
	<td><%=b.getBbsid() %></td>
	<td><b><a href="bbsview.do?bbsId=<%=b.getBbsid() %>"><%=b.getBbstitle() %></a></b></td>
	<td><%=b.getBbscontent() %></td>
	<td><%=b.getId() %></td>
	<td><%=b.getBbsdate() %></td>
	</tr>
	<%
	count++;
}
if (count == 0) {
	%>
		<tr><td colspan="7">작성한 게시글이 없습니다.</td></tr>	
	<%
}
System.out.println("현재 게시글 " + count + "개");

%>
</table>
<p>
	<% if(sessionID == null) { %>
			<p>글쓰기 활동은 회원만 가능합니다.
	<% } else { %>
			<a href="bbsWrite.jsp?team=<%= team %>"><button>글쓰기</button></a><br />
	<% } %>
<a href="home.jsp"><button>HOME</button></a>
</p>
</div>
</body>
</html>