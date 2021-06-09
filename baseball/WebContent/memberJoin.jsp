<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구볼래? 회원가입</title>
<link rel="stylesheet" href="css/join.css">
</head>
<body>
	<h1>Welcome to 야구볼래?</h1>
	<form action="join.do" method="post" id="signup">
	<p>* 필수 입력 사항</p>
		<fieldset>
			<legend>가입 정보</legend>
			<ul>
				<li>
           			<label for="id">아이디 *</label>
           			<input type="text" name="id" placeholder="8-16자 이내" autofocus required>
          			${msg }<br>
        		</li>
        		<li>
          			<label for="pwd">비밀번호 *</label>
         			<input type="password" name="pwd" placeholder="영문, 숫자, 특수문자 혼합" required>
         		</li>
         		<li>
          			<label for="favorite">관심구단</label>
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
         		</li>
			</ul>
		</fieldset>
		<fieldset>
			<legend>회원 정보</legend>
			<ul>
				<li>
          			<label for="name">이름 *</label>
          			<input type="text" name="name" placeholder="공백없이 입력하세요" required>
         		</li>       
         		<li>
           			<label for="mail">이메일</label>
           			<input type="email" name="mail">
        		</li>
			</ul>
		</fieldset>
		<fieldset>
			<input class="button" type="submit" value="가입하기">
		</fieldset>
	</form>
	
</body>
</html>