<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="baseball.vo.Player" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>

<%@ include file="Head.jsp" %>

<%
	Player player = (Player)request.getAttribute("player");
	String fteam = (String)request.getAttribute("fteam");
	String update = "원하는 정보를 수정 후 회원 정보 수정 버튼을 눌러주세요";
	String upok = (String)request.getAttribute("update");
	String id = (String)request.getAttribute("id");
	if(upok != null) { update = id + "님의 " +upok;}
%>

<div class="controller">
<form action="playerupdate.do" method="post">
		<table>
			<tr>
				<td width="300px"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><h1>MYPAGE</h1></td>
			</tr>
			<tr>
				<td>아이디<br><p>* 아이디는 수정이 불가합니다<p></td>
				<td><input type="text" name="id" required readonly value="${player.id }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pwd" required value="${player.pwd }"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required value="${player.name }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" value="${player.email }"></td>
			</tr>
			<tr>
				<td><label for="favorite">관심구단</label></td>
				<td>
          			<select name="favorite">
          				<option value="${player.favorite }" selected> -<%=fteam %>- </option>
          				<option value="lg">엘지 트윈스</option>
          				<option value="samsung">삼성 라이온즈</option>
          				<option value="doosan">두산 베어스</option>
          				<option value="kiwoom">키움 히어로즈</option>
          				<option value="ssg">에스에스지 랜더스</option>
          				<option value="hanhwa">한화 이글스</option>
          				<option value="kt">케이티 위즈</option>
          				<option value="kia">기아 타이거즈</option>
          				<option value="lotte">롯데 자이언츠</option>
          				<option value="nc">엔씨 다이노스</option>
          			</select>
          		</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><%= update %></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input id="sbutton" type="submit" value="회원 정보 수정"></td>
			</tr>
		</table>
</form>
	<div>
		<a href="logout.do"><button>로그아웃</button></a>
		<a href="home.jsp"><button>홈으로</button></a>
	</div>
</div>

</body>
</html>