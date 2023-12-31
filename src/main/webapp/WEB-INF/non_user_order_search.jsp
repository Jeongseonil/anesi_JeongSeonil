<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.orInputBox{
	display: flex;
	width: 270px;
	height: 40px;
	max-width: 270px;
    margin: 8px 0;
    line-height: 40px;
    transition: background-color 0.3s;
}
.orInputBox > input{
	padding: 8px 15px 9px;
	border-radius: 4px;
	border: 1px solid;
	transition : border-color 0.3s;
	border-color: #dbdbdb;
    width: 100%;
    font-weight: bold;
    margin-left: 10px;
}
.orInputBox1 > input{
	padding: 8px 15px 9px;
	border-radius: 4px;
	border: 1px solid;
	transition : border-color 0.3s;
	border-color: #dbdbdb;
    width: 163px;
    height : 21px;
    font-weight: bold;
    margin-left: 15px;
}
.orInputBox2 > input{
	padding: 8px 15px 9px;
	border-radius: 4px;
	border: 1px solid;
	transition : border-color 0.3s;
	border-color: #dbdbdb;
    width: 305px;
    height : 21px;
    font-weight: bold;
    margin-left: 10px;
    margin-bottom: 15px;
}
.user-flex1 span{
	width: 72px;
}
.orSelectBox{
	display: flex;
	width: 50px;
	height: 40px;
	max-width: 270px;
    margin: 8px 0;
    line-height: 40px;
    margin-right: 10px;
    font-weight: bold;
    transition: background-color 0.3s;
    font-family: 'Pretendard-Regular';
}
.orSelectBox select{
	padding: 8px 5px 9px 5px;
	border-radius: 4px;
	border: 1px solid;
	transition : border-color 0.3s;
	border-color: #dbdbdb;
    width: 60px;
    font-weight: bold;
    margin-left: 10px;
}
.content{
	width : 800px;
	margin: 0 auto;
	margin-top: 200px;
}
.order-chekc-title1{
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 30px;
}
.order-chekc-title2{
	font-size: 18px;
	font-weight: 500;
	border-bottom: 1px solid #dbdbdb ;
	padding-bottom: 10px;
	margin-bottom: 10px;
}
.table-wrap{
	display: flex;
}
.user-flex1 label{
	display: flex;
    align-items: center;
    color: #757575;
    margin-right: 60px;
}
.user-flex2 label{
	display: flex;
    align-items: center;
    color: #757575;
}
.user-flex2 span{
	width: 40px;
}
.addrButton{
	height: 40px;
	border: 1px solid #A782C3;
	background-color: #fff;
	color: #A782C3;
	border-radius: 5px;
	font-weight: bold;
}
.addr2{
	width: 600px;
	margin-left: 30px;
}
.add-label{
	margin-bottom: 10px;
}
.inpRead {
    background-color: #f5f5f5;
}
.product-img img{
	width: 100px;
	height: 100px;
	border-radius: 5px;
}
.order-product-title{
	font-size: 18px;
	font-weight: 500;
	padding-bottom: 10px;
	margin-bottom: 10px;
	border-bottom: 1px solid #dbdbdb ;
	margin-top: 10px;
}
.order-product{
	display: flex;
	margin-top: 10px;
}
.order-product-name{
	font-size: 16px;
	font-weight: 700;
	color: #424242;
	margin-top: 9px;
}
.order-product-option{
	font-size: 16px;
	color: #828c94;
	margin-top: 13px;
	font-weight: 600;
}
.order-product-price{
	margin-top: 13px;
	font-size: 18px;
}
.order-content{
	margin-left: 10px;
}
.order-product-cnt{
	font-size: 14px;
	color: #828c94;
}
.btn1{
	float: right;
	margin-right: 10px;
	width: 100%;
	margin-bottom: 20px;
}
.btn1 button{
	width: 100px;
	height: 40px;
	background-color: #fff;
	color: #A782C3;
	border: 1px solid #A782C3;
	border-radius: 5px;
	font-size: 15px;
	font-weight: 600;
}
.btn1 span{
	font-size: 14px;
	color: #828c94;
}
.delivery{
	border: 1px solid #dbdbdb ;
	border-radius: 5px;
	padding: 10px;
	margin-bottom: 10px;
}
.deliverySit-chekc{
	font-size: 16px;
	font-weight: 600;
	color: #A782C3;
}
.order-product-wrap{
	
}
.inpMargin{
	margin-left: 0px !important;
}
.orInputBox3{
	width: 70px;
}
</style>
</head>
<!-- 비회원 주문 조회페이지 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="order-chekc-title1">
					주문 조회
				</div>
				<div class="order-chekc-title2">
					배송지
				</div>
				<div class="table-wrap">
					<div class="user-flex1">
						<label>
						    <span>배송지명</span>
						    <div class="orInputBox">
						        <input v-model="addrKind" :readonly="!(deliverySit <= 2)" :class="{'inpRead' : !(deliverySit <= 2)}">
						    </div>
						</label>
						<label>
						    <span>받는 사람</span>
						    <div class="orInputBox">
						        <input v-model="receiptName" :readonly="!(deliverySit <= 2)" :class="{'inpRead' : !(deliverySit <= 2)}">
						    </div>
						</label>
						<label>
						    <span>휴대전화</span>
						    <div class="orSelectBox" v-if="deliverySit <= 2">
						        <select v-model="phone1">
						            <option value="010">010</option>
						            <option value="011">011</option>
						            <option value="016">016</option>
						            <option value="017">017</option>
						            <option value="018">018</option>
						            <option value="019">019</option>
						        </select>
						    </div>
						    <div class="orInputBox orInputBox3" v-else>
						        	<input readonly="readonly" class="inpRead" v-model="phone1">
				        		</div>
						    <div class="orInputBox1">
						        <input v-model="phone2" placeholder="입력해주세요" :readonly="!(deliverySit <= 2)" :class="{'inpRead' : !(deliverySit <= 2)}">
						    </div>
						</label>
					</div>
					<div class="user-flex2">
						<label class="add-label">
							<span>주소</span>
							<button class="addrButton" @click="fnSearchAddr" v-if="deliverySit <= 2">주소찾기</button>
							<div class="orInputBox">
						        <input v-model="zipCode" readonly class="inpRead" :class="{'inpMargin' : !(deliverySit <= 2)}">
						    </div> 
						</label>
						<label>
							<div class="orInputBox2 addr2">
						        <input v-model="addr" readonly class="inpRead">
						    </div>
						</label>
						<label>
							<div class="orInputBox2 addr2">
						        <input v-model="addr2" placeholder="상세주소 입력" :readonly="!(deliverySit <= 2)" :class="{'inpRead' : !(deliverySit <= 2)}">
						    </div>
						</label>
					</div>
					
				</div>
				<div class="btn1">
					<button @click="fnAddrUpdate" v-if="deliverySit < 3">변경</button> <span>배송이 시작되면 배송지를 변경할 수 없습니다.</span>
				</div>
				<div class="order-product-wrap">
					<div class="order-product-title">
						주문상품
					</div>
					<div class="delivery"  v-for="item in nonUserOrder">
						<div class="deliverySit-chekc" v-if="item.deliverySit == 1">
							결제완료
						</div>
						<div class="deliverySit-chekc" v-if="item.deliverySit == 2">
							배송준비
						</div>
						<div class="deliverySit-chekc" v-if="item.deliverySit == 3">
							배송중
						</div>
						<div class="deliverySit-chekc" v-if="item.deliverySit == 4">
							배송완료
						</div>
						<div class="order-product">
							<div class="product-img">
								<img  :src="item.imgPath+'/'+item.imgName">
							</div>
							<div class="order-content">
								<div class="order-product-name">
									{{item.productName}}
								</div>
								<div class="order-product-option">
									{{item.optionName}}
								</div>
								<div class="order-product-price">
									{{item.orderPrice | formatPrice}}원 <span class="order-product-cnt">| {{item.cnt}}개</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
} 
var app = new Vue({
	el : '#app',
	data : {
		paymentNo : '${map.paymentNo}',
		orderEmail : '${map.orderEmail}',
		nonUserOrder : [],
		phone1 : "",
		phone2 : "",	
		addrKind : "",
		receiptName : "",
		zipCode : "",
		addr : "",
		addr2 : "",
		deliverySit : 0,
		deliverySitCheck : "",
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
	methods : {
		fnNonUserOrder(){
			var self = this;
			var nparmap = {paymentNo : self.paymentNo , orderEmail : self.orderEmail};
            $.ajax({
                url : "../nonUserOrder.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.nonUserOrder = data.nonUserOrder;	
                	self.phone1 = (self.nonUserOrder[0].receiptPhone).substring(0,3);
                	self.phone2 = (self.nonUserOrder[0].receiptPhone).substring(3,11);
                	self.addrKind = self.nonUserOrder[0].addrKind;
                	self.receiptName = self.nonUserOrder[0].receiptName;
                	self.zipCode = self.nonUserOrder[0].zipCode;
                	self.addr = self.nonUserOrder[0].addr;
                	self.addr2 = self.nonUserOrder[0].addr2;
                	self.deliverySit = self.nonUserOrder[0].deliverySit;
                	
                }
            });
		},
		fnSearchAddr : function (){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
		},
		fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		self.zipCode=zipNo;
    		self.addr=roadAddrPart1;
    		self.addr2=addrDetail;
    	},
    	fnAddrUpdate(){
    		var self = this;
    		var phone=self.phone1+self.phone2;
			var nparmap = {paymentNo : self.paymentNo , addrKind : self.addrKind, phone : phone, receiptName : self.receiptName, zipCode : self.zipCode, addr : self.addr, addr2 : self.addr2, addrNo : self.nonUserOrder[0].addrNo};
            $.ajax({
                url : "../nonUserOrderUpdate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.fnNonUserOrder();
                }
            });
    	}
	}, // methods
	created : function() {
		var self = this;
		self.fnNonUserOrder();
	}// created
});
</script>