<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구볼래? 회원가입</title>
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>

<%@ include file="Head.jsp" %>

<div class="controller">
<form action="join.do" method="post">
		<table>
			<tr>
				<td width="300px"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><h3>가입정보</h3></td>
			</tr>
			<tr>
				<td>아이디 *<br></td>
				<td><input type="text" name="id" placeholder="8-16자 이내" autofocus required ></td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td><input type="password" name="pwd" placeholder="영문, 숫자, 특수문자 혼합" required></td>
			</tr>
			<tr>
				<td><label for="favorite">관심구단</label></td>
				<td>
          			<select name="favorite">
          				<option value="null">관심구단을 선택해주세요</option>
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
				<td colspan="2" align="center"><h3>회원정보</h3></td>
			</tr>
			<tr>
				<td>이름 *</td>
				<td><input type="text" name="name" placeholder="공백없이 입력하세요" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="mail"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input id="sbutton" type="submit" value="가입하기"></td>
			</tr>
		</table>
</form>
	<div>
		<button> -- </button>
		<a href="home.jsp"><button>홈으로</button></a>
	</div>
</div>

</body>
</html>