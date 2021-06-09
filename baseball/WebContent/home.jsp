<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야구볼래? 홈 화면</title>
<link rel="stylesheet" href="css/home.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

</head>
<script>
  		$(function(){
			$('#slider-div').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 4000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false,		// 세로 방향 슬라이드 옵션
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true, 	//드래그 가능 여부 
			});
  		})
</script>
<body>

<%@ include file="Head.jsp" %>

<div id="container">
	<div id="slider-div">
		    <div><img src="css/images/img01.jpg"></div>
		    <div><img src="css/images/img02.jpg"></div>
		    <div><img src="css/images/img03.jpg"></div>
	</div>

	<div id="contents">
		<a href="bbslist.do?team=lg"><div class="teams" id="lg"><p>LG TWINS<br><br><b>엘지 트윈스</b></p></div></a>
		<a href="bbslist.do?team=kia"><div class="teams" id="kia"><p>KIA TIGERS<br><br><b>기아 타이거즈</b></p></div></a>
		<a href="bbslist.do?team=samsung"><div class="teams" id="samsung"><p>SAMSUNG LIONS<br><br><b>삼성 라이온즈</b></p></div></a>
		<a href="bbslist.do?team=nc"><div class="teams" id="nc"><p>NC DINOS<br><br><b>엔씨 다이노스</b></p></div></a>
		<a href="bbslist.do?team=lotte"><div class="teams" id="lotte"><p>LOTTE GIANTS<br><br><b>롯데 자이언츠</b></p></div></a>
		<a href="bbslist.do?team=doosan"><div class="teams" id="doosan"><p>DOOSAN BEARS<br><br><b>두산 베어스</b></p></div></a>
		<a href="bbslist.do?team=kt"><div class="teams" id="kt"><p>KT WIZ<br><br><b>케이티 위즈</b></p></div></a>
		<a href="bbslist.do?team=ssg"><div class="teams" id="ssg"><p>SSG LANDERS<br><br><b>에스에스지 랜더스</b></p></div></a>
		<a href="bbslist.do?team=kiwoom"><div class="teams" id="kiwoom"><p>KIWOOM HEROES<br><br><b>키움 히어로즈</b></p></div></a>
		<a href="bbslist.do?team=hanhwa"><div class="teams" id="hanhwa"><p>HANHWA EAGLES<br><br><b>한화 이글스</b></p></div></a>
	</div>
	<footer id="footer">
	<hr>
		<p>(주)야구볼래컴퍼니</p>
		<p>주소:  (17092)경기 용인시 처인구 용인대학로 134 용인대학교</p>
		<p>대표:  이아연</p>
		<p>사업자 등록번호:  408-56-120408</p>
	</footer>
</div>

</body>
</html>