<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>마이페이지😏</title>
<style>
#app{
	margin-top : 160px;
}
#container{
	margin : 30px auto;
	width: 1000px;
}
li{
	list-style : none;
}
.my_menu1 {
	list-style : none;
	display : flex;
	justify-content: center;
	padding: 0px 0px 0px 0px;
}
.my_li1 {
	margin: 0px 30px 0px 30px;
    font-size: 17px;
}
.my_li2 {
	margin: 0px 45px 0px 45px;
    font-size: 17px;
}
.my_li2 {
	font-size: 14px;
}
.my_a1_ch {
	color : #A782C3;
}
.my_a2 {
	text-decoration: none;
	position: relative;
	text-align: center; 
	cursor: pointer;
}
.my_a2:before { 
	text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: hidden; 
	opacity: 0; 
	transition: opacity 0.3s, visibility 0.3s;
}
.my_a2:hover:before { 
	visibility: visible;
	text-decoration: none;
	opacity: 1;
}
.my_a2_ch {
    position: relative;
    text-align: center;
    cursor: pointer;
    color : #A782C3;
}
.my_a2_ch:before {
    text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: visible; 
	opacity: 1; 
}
.hrr {
	margin : 4px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.profile{
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    height: 235px;
    padding: 40px;
    box-shadow: 0px 2px 11px -3px #dddbdb;
}
.profile_img{
	width: 160px;
    border-radius: 50%;
	margin: 15px 65px 15px 68px;
}
.nickName{
    font-size: 17px;
    text-align : center;
}
.profile_left{
	float : left;
	width: 300px;
	border-right: 1px solid #eee;
}
.profile_right{
	padding : 20px 50px;
	float : left;
}
.icon{
	width: 42px;
    margin: 0px 22px 10px 3px;
}
.icon:hover{
	
}
.comment{
	text-align : center;
}
.profile_list{
	display : flex;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>	
<div id="app">
<div class="top_menu">
	<ul class="my_menu1">
		<li class="my_li1"><a class="my_a1_ch">프로필</a></li>
		<li class="my_li1"><a class="my_a1">나의 쇼핑</a></li>
		<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
		<li class="my_li1"><a class="my_a1">설정 </a></li>
	</ul>
</div>
<hr class="hrr">
	<ul class="my_menu1">
		<li class="my_li2"><a class="my_a2_ch">모두 보기</a></li>
		<li class="my_li2"><a class="my_a2">나의 문의</a></li>
		<li class="my_li2"><a class="my_a2">나의 게시글</a></li>
		<li class="my_li2"><a class="my_a2">스크랩북</a></li>
	</ul>
<hr class="hrr">
<div id="container">
	<div class="profile">
		<div class="profile_left">
			<div><img src="../css/image/profile.png" class="profile_img"></div>
			<div class="nickName">닉네임</div>
		</div>
		<div class="profile_right">
		<ul class="profile_list">
			<li><label><a href=""><img src="../css/image/bookmark.png" class="icon"><br><span class="comment">스크랩북</span></a></label></li>
			<li><label><a href=""><img src="../css/image/coupon.png" class="icon" style="width : 50px; margin: 0px 3px 10px 9px;"><br><span class="comment">내 쿠폰</span></a></label></li>
			<li><label><a href=""><img src="../css/image/qna.png" class="icon" style="width : 50px; margin: 0px 3px 10px 9px;"><br><span class="comment">내 문의</span></a></label></li>
			<li><label><a href=""><img src="../css/image/post.png" class="icon" style="width : 50px; margin: 0px 3px 10px 9px;"><br><span class="comment">내 게시글</span></a></label></li>
		</ul>
			<button class="btn">회원정보수정</button>
		</div>
		<div>
			
		</div>
	</div>
</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		
	}// created
});
</script>