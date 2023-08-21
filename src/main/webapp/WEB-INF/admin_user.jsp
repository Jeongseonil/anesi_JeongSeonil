<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/mainCss.css" rel="stylesheet">
<link href="../../css/admin_user.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">

<meta charset="UTF-8">
<title>고객관리</title>

</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
			<div id="container">
				<div class="containerTitle">고객관리</div>
			<!-- 	<div class="containerCheckList">
					<div class="checkList">
						<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>전체</div>
							<div><span class="numText">{{list.length}}</span>건</div> 
						</div>
					</div>
					<div class="checkList">
						<div class="iconBack"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>판매중</div>
							<div><span class="numText">{{list.length - soldOut}}</span>건</div> 
						</div>
					</div>
					<div class="checkList">
						<div class="iconBack"><i class="fa-solid fa-cart-arrow-down fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>품절</div>
							<div><span class="numText">{{soldOut}}</span>건</div> 
						</div>
					</div>
					<div class="checkList">
						<div class="iconBack"><i class="fa-solid fa-pause fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>판매중지</div>
							<div><span class="numText">{{stop}}</span>건</div> 
						</div>
					</div>
					<div class="checkList">
						<div class="iconBack"><i class="fa-solid fa-ban fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>판매종료</div>
							<div><span class="numText">{{end}}</span>건</div> 
						</div>
					</div>
				</div> -->
				<div class="containerProductList">
					<div class="productListTitle">
						<span>고객목록 (총 {{list.length}}개)</span>
					</div>
					<div class="btnBox">
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('N')">선택판매</button>
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('S')">선택중지</button>
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('Y')">선택종료</button>
					</div>
					<div class="tableBox">
						<div class="table-container">
							<table>
								<tr>
									<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
									<th>수정</th>
									<th>고객번호</th>
									<th>고객아이디</th>
									<th>고객성함</th>
									<th>등록일</th>
									<th>수정일</th>
									<th>계정삭제여부</th>
									<th>로그인시도횟수</th>
								</tr>
								<tr v-for="item in list">
									<td><input type="checkbox" v-model="checkList" :value="item.userNo" @change="updateAllCheck"></td>
									<td><button class="btn1" @click="fnUserEdit(item.userNo)">수정</button></td>
									<td>{{item.userNo}}</td>
									<td>{{item.userEmail}}</td>
									<td>{{item.userName}}</td>
									<td>{{item.cDateTime}}</td>
									<td>{{item.uDateTime}}</td>
									<td>{{item.deleteYn}}</td>
									<td>{{item.cnt}}</td>
									
								</tr>
							</table>
						</div>
					</div>
				</div>
<!-- 				<div class="modal" v-if="showScrapModal">
			        <div class="modal-card">
			        	<div class="modalTitle">상품정보 수정</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">상품번호</span>
			        		<span>{{producInfo[0].userNo}}</span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">상품명</span>
			        		<span><input v-model="producInfo[0].userName" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">가격</span>
			        		<span><input v-model="producInfo[0].userPrice" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">할인율</span>
			        		<span><input v-model="producInfo[0].discount" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1 modalStyle2">
			        		<span class="modalSpan1">옵션</span>
		        			<div v-if="producInfo.length != 0">
		        				<table class="modalTable">
		        					<tr>
		        						<th class="modalTdTr">옵션이름</th>
		        						<th class="modalTdTr">옵션 가격 증가량</th>
		        						<th class="modalTdTr">옵션 재고 수량</th>
		        					</tr>
		        					<tr v-for="item in producInfo">
		        						<td class="modalTdTr"><input v-model="item.optionName"  class="modalSpan2 inputStyle"></td>
		        						<td class="modalTdTr"><input v-model="item.optionPrice" class="modalSpan2 inputStyle"></td>
		        						<td class="modalTdTr"><input v-model="item.productStock" class="inputStyle"></td>
		        					</tr>
		        				</table>
		        			</div>
			        	</div>
		        		<div class="modalStyle4">
		        			<span>
		        				<button class="btn1 btn2 btn3" @click="fnOptionAdd">옵션+</button>
		        				<button class="btn1 btn2" @click="fnOptionDel">옵션-</button>
		        				<span>(최소 1개 최대 5개)</span>
		        			</span>
		        			<span>
			        			<button class="btn1 btn2" @click="fnUpdateuser">저장</button>
			        			<button @click="closeModal" class="btn1 btn2 btn3">취소</button>
		        			</span>
		        		</div>
			        </div>
		        </div> -->
				</div>
			</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		item : "",
		
		checkList : [],
		allChecked : false,
		
		showScrapModal : false,
		userInfo : [],

		
	},// data
	methods : {
		//고객 전체 검색
		fnGetUser(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/admin/userList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
						
					}
            });
		},
		 // 올체크
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.list.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.list.map(item => item.userNo);
		    }
		},
		// 체크박스 체크
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.list.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		//상품 상세&옵션 정보
		fnUserEdit(userNo){
			var self = this;
			var nparmap = {userNo};
            $.ajax({
                url : "/admin/userInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.userInfo = data.info;
                	self.userNo = userNo;
                	
                }
            });
			
		},
		/*// 모달열기
		openScrapModal: function() {
			var self = this;
			self.showScrapModal = true;
		},
		// 모달 닫기
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
			location.reload();
		},
		//수정 정보 업데이트
		fnUpdateProduct(){
			var self = this;
			var discountYn = '';
			if(self.producInfo[0].discount !='0'){
				discountYn = 'Y';
			} else{
				discountYn = 'N';
			}
			var nparmap = {productNo : self.productNo, productName : self.producInfo[0].productName, productPrice : self.producInfo[0].productPrice, discount : self.producInfo[0].discount, discountYn, };
			$.ajax({
                url : "/admin/productUpdate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                }
            });
			for(let i = 0; i < self.optionCnt; i++){
				var nparmap2 = {optionNo : self.producInfo[i].optionNo, optionName : self.producInfo[i].optionName, optionPrice : self.producInfo[i].optionPrice, productStock : self.producInfo[i].productStock};
				$.ajax({
	                url : "/admin/optionUpdate.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap2,
	                success : function(data) {
	                }
	            });
			}
			for(let i=self.optionCnt; i < self.optionCnt+self.addOptionCnt; i++){
				var nparmap3 = {productNo : self.productNo, optionName : self.producInfo[i].optionName, optionPrice : self.producInfo[i].optionPrice, productStock : self.producInfo[i].productStock};
				$.ajax({
	                url : "/admin/optionInsert.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap3,
	                success : function(data) {
	                }
	            });
			}
			if(self.delectOption.length != 0){
				var list = JSON.stringify(self.delectOption);
				var nparmap4 = {list};
				$.ajax({
	                url : "/admin/optionDelete.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap4,
	                success : function(data) {
	                }
	            });
			}
			alert("저장성공");
			self.closeModal();
			
		},
		//옵션 추가
		fnOptionAdd(){
			var self = this
			console.log();
			if(self.producInfo.length < 5){
				self.producInfo.push({productNo : self.productNo, optionName : '', productStock : 0, optionPrice : 0});
				self.addOptionCnt++;
			}
		},
		//옵션 제거
		fnOptionDel(){
			var self = this;
			if(self.producInfo.length > 1){
				if(self.addOptionCnt > 0){
					self.addOptionCnt--;
				} else {
					self.optionCnt--;
					self.delectOption.push(self.producInfo[self.producInfo.length-1].optionNo);
					console.log(self.delectOption);
				}
				self.producInfo.pop();
			}
		},
		//상품 상태
		fnCheckSituation(situation){
			var self = this;
			if(self.checkList.length > 0){
				var checkList = JSON.stringify(self.checkList);
				var nparmap = {	checkList, situation};
				$.ajax({
	                url : "/admin/productSituation.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	alert(data.cnt+"개 업데이트");
	                	self.checkList = []
	                	self.fnGetProduct();
	                	self.allChecked = false;
	                }
	            });
			}
		}, */
	}, // methods
	created : function() {
		var self = this;
		self.fnGetUser();
	}// created
});
</script>