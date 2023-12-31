<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="UTF-8">
<title>Footer</title>
<style>

.momo {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.8);
}

.modal-content {
  margin: auto;
  width: 80%;
  max-width: 720px;
  position: relative;
  top: 50%;
  transform: translateY(-50%);
}

.momoclose {
  position: absolute;
  top: 10px;
  right: 20px;
  font-size: 28px;
  font-weight: bold;
  color: white;
  cursor: pointer;
}

#youtubeFrame {
    width : calc(50vw - (20px *2));
    height : calc(50vh - (20px *2));
}

  
  
  @keyframes textLoop {
    0% {
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
    }
    100% {
      -webkit-transform: translate3d(-100%, 0, 0);
      transform: translate3d(-100%, 0, 0);
    }
  }

#f_img{
	margin-left : 70px;
	margin-right : 30px;
	width : 130px;
	height : 130px;
  	float : left;
}

#container_footer{
	font-size : 12px;
	height: 150px;
}

#anesi_info{
	margin : 0px 0px 5px;
	font-size : 14px;
	
}

#f_part1 {
	
    float : left;
    width :40%;
    padding-left : 20px;
}

#f_part2 {

  margin-top : 20px; 
}
#f_part3 {

   float : left;
    width :15%;
}
#f_part4 {
    float : left;
    width :20%;
}

#admin {
    font-size: 19px;
    background: #a782c3;}

#f_part5 {
    float : left;
    width :5%;

}
#f_part6 {
    text-align: center;
    padding: 10px ;
    margin-top : 150px;
    
}
.content_bold{
	font-weight : bold;
}

/*파트1의 content */
.pt1_content{
	font-weight : bold;
}
.pt_title{
	font-weight : bold;
	font-size : 13px;
	margin-bottom : 5px;
}
.pt2_content{
	margin-right:10px;

}
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
#topbutton{
	width : 50px;
	opacity: 0.7;
	
}
.hr_1 {
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.btnCenter{
	border : none;
	border: 1px solid #A782C3;
    color: #A782C3;
    background-color: white;
    border-radius: 4px;
    margin: 10px 0px;
    transition: background 0.3s;
    cursor: pointer;
    padding: 5px 10px;
    box-shadow: 1px 2px 5px -2px gainsboro;
    font-family: 'Pretendard-Regular';
}
.btnCenter:hover{
	border: 1px solid white;
	background-color: #A782C3;
	color: white;
}
</style>
</head>
<!-- 주석 꼭 남겨주세요 넹 -->
<body>



	<div id="container_footer">
	<!-- 로고 클릭시 main화면으로 전환 또는, 제일 상단으로-->
	<!-- 이미지를 포함 모든 링크는 href="javascript:;"-->
	
	<hr class="hr_1">
	<a href="../main.do">
    <img id="f_img" src="../css/image/anesilogo.png" >
    </a>
    <div id="f_part1">
       <div class="pt_title"><p id="anesi_info">ANESI 기본정보</p></div>
       <div class="내용">
           <div>
          	<span class="content_bold" >상호명</span>
         	<span>아네시(anesi)</span>
         	
          	<span class="content_bold" >대표자명</span>
         	<span>정선일</span>
           </div>
           <div>
          	<span class="content_bold" >사업장 주소</span>
         	<span>인천시 부평구 경원대로 1366,(부평동, 스테이션타워 7F)</span>
           </div>
         	
           <div>
          	<span class="content_bold" >대표 전화</span>
         	<span>1588-8282</span>
         	
          	<span class="content_bold" >사업자 등록번호</span>
         	<span>152-85-74445</span>
         	
          	<span class="content_bold" >통신판매업 신고번호</span>
         	<span>15-45-7822</span>
           </div>
           
           <div>
           	<span class="content_bold">개인정보보호책임자</span>
         	<span>최인경</span>
           </div>
       </div>
       
       <div id="f_part2">
     	<span class="pt2_content"><a href="javascript:;">회사소개</a></span>
     	<span class="pt2_content"><a href="../usepolicy.do">이용약관</a></span>
     	<span class="pt2_content"><a href="../privacy.do">개인정보처리방침</a></span>
     	<span class="pt2_content"><a href="javascript:;">이용안내</a></span>
   		</div>
   </div>
   
   
   
	   <div id="f_part3">
	       <div class="pt_title"> 고객센터</div>
	       <div class="내용">
	           <div>상담/주문전화 1588-2222
	           </div>
	           
	           <div>상담주문이메일
	           <span>test@test.com</span>
	           </div>
	           <div>CS운영시간
		           <div>Daily 10:00-18:00</div>
		           <div>Lunch 12:00-13:00</div>
		           <div>Sat&Sun&Holiday Day Off</div>
	           </div>
	       </div>
	   </div>
   
	   <div id="f_part4">
	       <div class="pt_title"> 결제정보</div>
	       <div class="내용">
	          
	           <div>무통장 계좌정보
	           <span>신한은행 110-409-609660</span>
	           </div>
	           <div>예금주 정선일</div>
	         <div style="margin-top:15px;"><a id="customer" href="http://localhost:8080/customerService.do"><button class="btnCenter">고객센터 바로가기</button></a></div>
	       </div>
	   </div>
   	 
	   <div id="f_part5">
	       <div class="pt_title"> SNS</div>
	       <div class="내용">
	          
	           <div><a href="https://www.instagram.com/" target="blank">instagram</a></div>
	           <div><a href="https://www.youtube.com/youtube" target="blank">youtube</a></div>
	           <div><a href="https://ko-kr.facebook.com/" target="blank">facebook</a></div>
	           <div><a href="https://www.kakaocorp.com/" target="blank">kakao</a></div>
	           <div><a href="https://twitter.com/" target="blank">twitter</a></div>
	           <div><a href="http://blog.naver.com/" target="blank">blog</a></div>
	       </div>
	   </div>
	   
	 <div id="f_part6">
	 
	    <span>Copyright <i class="fa-regular fa-copyright"></i> 아네시. All Rights Reserved. Hosting by Anesi Corp.</span>
	      
	   </div>
	    
	   
	   
   </div>
<a class="btn_gotop">
	<img id="topbutton" src="../css/image/Main/topbutton.png">
</a>


<div id="myModal" class="momo">
  <div class="modal-content">
    <span class="momoclose">&times;</span>
    <iframe id="youtubeFrame" width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
  </div>
</body>
</html>
<script>

var kkeys = [], konami = "38,38,40,40,38";
$(document).keydown(function(e) {
  kkeys.push( e.keyCode );
  if ( kkeys.toString().indexOf( konami ) >= 0 ){
    kkeys = [];
    openModal("https://www.youtube.com/embed/jOTfBlKSQYY");
  }
});

function openModal(videoUrl) {
  var modal = document.getElementById("myModal");
  var youtubeFrame = document.getElementById("youtubeFrame");
  var span = document.getElementsByClassName("momoclose")[0];
  
  youtubeFrame.src = videoUrl;
  modal.style.display = "block";
  
  span.onclick = function() {
    youtubeFrame.src = "";
    modal.style.display = "none";
  }
  
  window.onclick = function(event) {
    if (event.target == modal) {
      youtubeFrame.src = "";
      modal.style.display = "none";
    }
  }
}


$(window).scroll(function(){
	if ($(this).scrollTop() > 200){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
});
</script>