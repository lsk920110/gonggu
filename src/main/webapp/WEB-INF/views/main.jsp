<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">

<style>
body { 
  padding : 0px;
  magin : 0px;
  }
#wrapper { 
 positon : absolute;
 top : 500px;
 left : 50%;
 margin-left: 600px; 
}  
  
iframe{ /*헤더 푸터 지정 */
  width: 100%;
  height: 210px;
  border-style: none;
}
/**/
.swiper-container { 
	height:420px;
	border:1px solid white;
	border-radius:7px;
}
/**/
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
	height: 200px;
}
/**/
.swiper-slide img {
	width : 900px;
	height : 300px;
	 /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
/**/
.swiper-button-prev { /*왼쪽버튼*/
	top : 150px;
	height: 50px;
}
/**/
.swiper-button-next { /*오른쪽버튼*/
	top : 150px;
	height: 50px;
}
/**/
.swiper-pagination { /*페이징 */
	top : 235px;
}
/*============================================추천 공동 구매 상품 css 시작====================================================*/
/*추천 공동 구매 상품 타이틀*/
.chuchun-title-name{
	text-align: center;
}
.all-two-swiper-container{
	width: 100%;
	height: 20px;
	float: left;
	margin-left : auto;
	display: inline-block;
	lign-items:center;
	
	
}
.two-swiper-container { 
	height:420px;	
	border:1px solid white;
	/*border-radius:7px;*/
	display: inline-block;	
}
/**/
.two-swiper-wrapper{
	margin-top: 40px;
	height:130px;
	width: 130px;
	display: inline-block;
}
.two-swiper-slide {
	/*display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	/*align-items:center; /* 위아래 기준 중앙정렬 */
	/*justify-content:center; /* 좌우 기준 중앙정렬 */
	
	height:130px;
	width: 400px;
	display: inline-block;
	max-width:100%;
	margin-left : 0px;
	/*text-align:center;
	margin: 0 auto;*/
	display: inline-block;	
}
/**/
.two-swiper-slide img {
	height:130px;
	width: 130px;
	margin-left : 100px;
	max-width:100%;
	display: inline-block;
	/*top : 700px;*/
	 /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
/**/
.two-swiper-button-prev { /*왼쪽버튼*/
	top : 900px;
	height: 50px;
}
/**/
.two-swiper-button-next { /*오른쪽버튼*/
	top : 900px;
	height: 50px;
}
/**/
.two-swiper-pagination { /*페이징 */
	top : 500px;
} 
</style>
</head>
<body>
<!-- 클래스명은 변경하면 안 됨 -->
<iframe src="header"></iframe>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="resources/slide/1.png"></div>
		<div class="swiper-slide"><img src="resources/slide/2.png"></div>
		<div class="swiper-slide"><img src="resources/slide/3.png"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
<!--  ============================================추천 공동 구매 상품 html====================================================-->
<div class="all-two-swiper-container"> 
	<div class="two-swiper-container">
		<div class="chuchun-title-name" style="font-size:15pt">추천 공동 구매 상품</div>
			 <div class="two-swiper-wrapper">
			  <div class="two-swiper-slide"><img src="resources/slide/Apple iPad Air 4세대_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/make speed 겨울 방한복_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/ricotype_뉴본키트_4종 구성_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/다향오리 1등급 훈제 오리 슬라이스_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/러그_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/무로 남녀공용 티셔츠_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/미장센샴푸_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/바넥스 풀HD 소니이미지센서 블랙박스_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/서울약사신협 프로바이오 생유산균_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/센카 퍼펙트 휩 페이셜 워시 대용량 클렌징 폼.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/정원삼 6년근 고려홍삼정 365 스틱_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/애터미칫솔_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/에이지투웨니스 시그니처 에센스 커버 팩트_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/오가본 유기농 고보습 아기 영양 3종세트_대표사진.png"></div>
			  <div class="two-swiper-slide"><img src="resources/slide/우디 홈바 확장형 아일랜드 식탁_대표사진.png"></div>
	 		</div>
 <!-- 네비게이션 -->
	<div class="two-swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="two-swiper-button-prev"></div><!-- 이전 버튼 -->
 <!-- 페이징 -->
<div class="two-swiper-pagination"></div>

</div>
</div>
</body>
<script>
new Swiper('.swiper-container', {

	slidesPerView : 1, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 5, // 슬라이드간 간격
	slidesPerGroup : 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
<!-- ============================================추천 공동 구매 상품 js================================================ -->
 new Swiper('.two-swiper-container', {

		slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 5, // 슬라이드간 간격
		slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : true,

		loop : true, // 무한 반복

		pagination : { // 페이징
			el : '.two-swiper-pagination',
			clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
		},
		navigation : { // 네비게이션
			nextEl : '.two-swiper-button-next', // 다음 버튼 클래스명
			prevEl : '.two-swiper-button-prev', // 이번 버튼 클래스명
		},
	});
</script>

<!--  <iframe src="footer"></iframe>-->
</html>
