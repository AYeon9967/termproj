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
String image = null;
if(team.equals("lg")) { image = "css/images/slg.jpg"; }
else if(team.equals("samsung")) { image = "css/images/ssamsung.jpg"; }
else if(team.equals("nc")) { image = "css/images/snc.jpg"; }
else if(team.equals("kt")) { image = "css/images/skt.jpg"; }
else if(team.equals("doosan")) { image = "css/images/sdoosan.jpg"; }
else if(team.equals("ssg")) { image = "css/images/sssg.png"; }
else if(team.equals("lotte")) {	image = "css/images/slotte.jpg"; }
else if(team.equals("hanhwa")) { image = "css/images/shanhwa.jpg"; }
else if(team.equals("kiwoom")) { image = "css/images/skiwoom.png"; }
else if(team.equals("kia")) { image = "css/images/skia.png"; }

BbsDao bbsDao = BbsDao.getInstance();
List<Bbs> list = bbsDao.selectList(team);
%>
<style>
	#seats{
		margin: 25px auto;
		height: 600px;
		width: 600px;
		background-position: center;
		background-repeat: no-repeat;
		background-size: contain;
		background-image: url('<%= image %>');
	}
</style>

<body>

<%@ include file="Head.jsp" %>

<div id=seats></div>

<div class="controller">
	<table>
		<tr>
			<th width="100px">카테고리</th>
			<th width="150px">제목</th>
			<th>내용</th>
			<th width="100px">작성자</th>
			<th width="150px">날짜</th>
		</tr>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss");
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