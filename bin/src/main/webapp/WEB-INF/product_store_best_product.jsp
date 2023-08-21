<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<!-- ����� ���� CSS-->
<link href="../css/store_main.css" rel="stylesheet">
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>�α��ǰ</title>
<style>
</style>
</head>
<body>
<jsp:include page="product_store_main_ontop_category.jsp"></jsp:include>
<div id="store_main_best">
<h1>����Ʈ��ǰ</h1>
<!-- ��ǰ �����ϴ� ��ư-->	
	<div class="production-item__content" v-for="item in list" >
			<div class="production-item-header"  @click="fnProductView(item.productNo)">
	            <a  class="production-item-thumnail">
	                <div class="production-item-thumnail__overlay"></div>
				    <img class="production-item-thumnail__image"alt="�����" :src="item.imgPath + '/' + item.imgName">
			    </a>
		  		  <div class="brand_name">
            		<span class="production-item-header__brand">{{item.manufacturer}}</span>
                	<span class="production-item-header__name">{{item.productName}}</span>
            	</div>
                <div class="category_country">
                    <span class="production-item-header__kind">{{item.categoryName}},</span>
                    <span class="production-item-header__country">{{item.country}}</span>
                </div>
		    </div>
			 
           <div class="production-item-price">
                <div class="production-item-price__orginal" v-if="item.discountPrice!=''">����
                    <span class="won_icon">��</span>
                    <span class="production-item-price__orginal2">{{ formatPrice(item.productPrice) }}</span>
                    <span class="production-item-price__percent">{{ item.discount }}%</span>
                </div>
                <!-- production-item-price__sell  : �Ĵ� ���� -->
                <div class="production-item-price__sell">
                    <span class="won_icon">��</span>
                    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{formatPrice(item.discountPrice)}}</span>
                    <span class="production-item-price__sell2" v-else>{{ formatPrice(item.productPrice) }}</span>
                </div>
            </div>
            
		         <!--  production-item-rating : ����-->
            <div class="production-item-rating">
                <!-- �����-->
                <i class="fa-solid fa-star" style="color: #A782C3;"></i>
                <span class="production-item-rating__score ">{{item.csatAvg}}.5</span>
            </div>
	           <!-- ��ٱ��Ϲ�ư-->
	             <a class="cart_button">
				    <i
				      @click="userId ? (cartList.includes(item.productNo) ? fnUpdateUserCart(item) : fnInsertUserCart(item)) : (nonuserCartList.includes(item.productNo) ? fnUpdateUserCart(item) : fnAddNonUserCart(item))"
				      class="fa-solid fa-cart-shopping fa-xl"
				    ></i>
				  </a>
	            <!-- �����ϱ��ư-->
	            <a class="share_button" @click="shareSelectedOption()"><i class="fa-solid fa-share-nodes fa-xl"></i></a>
	            <!-- ��ũ����ư-->
	            <a v-if="userId!=''" class="scrap_button">
	                <i @click="fnInsertScrapbook(item)" v-if="!(scrapbookList.includes(item.productNo))" class="fa-regular fa-bookmark modal-toggle-button  fa-xl"></i>
	                <i @click="fnDeleteScrapbook(item)" v-if="scrapbookList.includes(item.productNo)"class="fa-regular fa-solid fa-bookmark  fa-xl " style="color:#A782C3;"></i>
	            </a>
	            <a v-else class="scrap_button">
	                <i @click="openScrapModal"class="fa-regular fa-bookmark modal-toggle-button fa-xl"></i>
	            </a>
    	    </div> <!-- class="production-item__content" ��-->
	    
	    
    	<div class="modal" v-if="showCartModal" >
		  <div class="modal-card">
		    <h2>��ٱ��Ͽ� �߰�</h2>
		    <p>��ǰ�� ��ٱ��Ͽ� ��ҽ��ϴ�.��ٱ��Ϸ� �̵��Ͻðڽ��ϱ�?</p>
		    <button @click="closeModal" class="left_button">���ΰ���ϱ�</button>
		    <button @click="fnMoveCart" class="right_button">��ٱ��Ϸ� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModal">
		  <div class="modal-card"  v-if="userId!=''">
		    <h2>��ũ���Ͽ� ���</h2>
		    <p>��ǰ�� ��ũ���Ǿ����ϴ�.</p>
		    <button @click="closeModal" class="left_button">���ΰ���ϱ�</button>
		    <button @click="fnMoveScrapbook" class="right_button">��ũ�������� �̵��ϱ�</button>
		  </div>
		  
		  <div class="modal-card"  v-else>
		    <h2>�α����� ��� �����մϴ�.</h2>
		    <p>�α����Ͻðڽ��ϱ�?</p>
		    <button @click="closeModal" class="left_button">���ΰ���ϱ�</button>
		    <button @click="fnMoveLoginPage" class="right_button">�α����������� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapDeleteModal">
		  <div class="modal-card">
		    <h2>��ũ���Ͽ��� �����Ǿ����ϴ�.</h2>
		    <button @click="closeModal" class="left_button">���ΰ���ϱ�</button>
		    <button @click="fnMoveScrapbook" class="right_button">��ũ�������� �̵��ϱ�</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModalBan">
		  <div class="modal-card">
		    <h2>�̹� ����ǰ�Դϴ�.</h2>
		    <p>��ũ������ Ȯ�����ּ���</p>
		    <button @click="closeModal" class="left_button">���ΰ���ϱ�</button>
		    <button @click="fnMoveMyPage" class="right_button">��ũ�������� �̵��ϱ�</button>
		  </div>
		</div>
	
    </div>
</body>
</html>
<script>

$(document).ready(function() {
    // ��ǰ���� ��ư Ŭ�� �̺�Ʈ �߰�
    var isListOpen = false; // Flag to track the state of the list container

    $('.category-order_toggle').click(function() {
        if (!isListOpen) { // ���� ����� �����ִ� ��쿡�� ����
            $('.category-order-list-container').slideDown('slow');
            isListOpen = true;
        }
    });
    // ��� �׸� Ŭ�� �̺�Ʈ �߰�
    $('.category-order-list a').click(function() {
        // ��� �׸��� Ŭ���ϸ� ����� �ݽ��ϴ�.
        $('.category-order-list-container').slideUp('slow');
        isListOpen = false;
    });
});

var app = new Vue({
	el : '#store_main_best',
	data : {
		list : [],
		list2 : [],
		item : "",
		showCartModal: false,
		showScrapModal: false,
		showScrapModalBan: false,
		showScrapDeleteModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		userNo : '${sessionNo}',
		categoryNo : '${map.no}',
		categoryName : "",
		productNo : "",
		scrapbookList : [],
		cartList : [],
		nonuserCartList : [],
		nonuserNo : ""


	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {productNo : self.productNo};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                	self.list = data.list;
                	self.list2=data.list2;
              	
                }
            }); 
		},
		


	     fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // ī�װ��� ���İ� ����
            self.fnGetList(); // AJAX ��û ������
	     },
	     formatPrice: function(price) {
	            // 100�� �ڸ����� �����Ͽ� ǥ���ϸ� õ �������� ��ǥ(,)�� �߰��մϴ�.
	            const truncatedPrice = Math.floor(price / 100) * 100;
	            return truncatedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      },
     
    	 // ��� ����
	    openCartModal: function() {
	       var self = this;
	       self.showCartModal = true;
	    },
	    openScrapModal: function() {
	       var self = this;
	       self.showScrapModal = true;
	    },
	    openScrapDeleteModal: function() {
	       var self = this;
	       self.showScrapDeleteModal = true;
	    },
	    // ��� �ݱ�
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	      this.showScrapModalBan = false;
	      this.showScrapDeleteModal = false;
	      location.reload();
	    },
	    //��޿��� �������̵� �Լ�
	    fnMoveCart : function() {
     		location.href = "/product/cart.do";
	    },
	    fnMoveMyPage : function() {
     		location.href = "/mypage.do";
	    },
	    fnMoveLoginPage : function() {
     		location.href = "/login.do";
	    },
	    
	    fnCheckCart : function() {
    	  var self = this;
          var nparmap = {nonuserNo : self.nonuserNo, userNo: self.userNo};      
          $.ajax({
             url : "/product/selectCartList.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             	for(let i=0; i<data.list.length;i++){
	                	if(self.userNo != '' && self.userNo != null) {
	                        self.cartList.push(data.list[i].productNo.toString());
	                	}else{
	                        self.nonuserCartList.push(data.list[i].productNo.toString());
	                	}
                  }
                }
         }); 
		},
		
	   fnInsertUserCart : function(item) {
	    	var self = this;
         var nparmap = { userNo: self.userNo, productNo: item.productNo};
         $.ajax({
             url : "/product/insertCart.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             	/* alert("��Ͽ�"); */
                console.log(self.userNo);
             }
         }); 
         self.openCartModal();
         console.log(self.showCartModal);
		}, 
		
	    fnUpdateUserCart : function(item) {
	    	var self = this;
         var nparmap = { userNo: self.userNo, productNo: item.productNo};
         $.ajax({
             url : "/product/addCartCnt.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 

             }
         }); 
         self.openCartModal();
         console.log(self.showCartModal);

		}, 
		fnCheckScrap : function(item) {
	    	var self = this;
         var nparmap = {userNo: self.userNo};
         $.ajax({
             url : "/product/selectScrapList.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             	for(let i=0; i<data.list.length;i++){
                     self.scrapbookList.push(data.list[i].productNo.toString());
                  }
             }
         }); 
         
		},
	    fnInsertScrapbook : function(item) {
	    	var self = this;
         var nparmap = { userNo: self.userNo, productNo: item.productNo};
        
         $.ajax({
             url : "/product/insertScrap.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             	
             }
         }); 
         self.openScrapModal();
         console.log(self.showScrapModal);
		},
		
	    fnDeleteScrapbook : function(item) {
	    	var self = this;
         var nparmap = { userNo: self.userNo, productNo: item.productNo};
        
         $.ajax({
             url : "/product/deleteScrap.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             }
         }); 
         self.openScrapDeleteModal();
         console.log(self.showScrapModal);
		},
		//'��ǰ�󼼺���' ������ �̵�
		fnProductView : function(productNo){
	    	var self = this;
	    	   $.pageChange("/product/view.do",{no : productNo});//�����ʿ������ �Ķ���� ������{}
		},
		
		//��ȸ�� ��ȣ ��Ű�ҷ����� �� 
		fnaaa : function(item){
			var self = this;
         var nparmap = '';
         //{ nonuserNo: self.nonuserNo, productNo: item.productNo};
			 $.ajax({
	                url : "/nonUserCookie.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.nonuserNo = data.value;
	            		self.fnCheckCart();

	                }
            }); 
		},
		//��ȸ�� ��ٱ��� �߰�
		fnAddNonUserCart : function(item) {
	    	var self = this;
         var nparmap = 
         	{nonuserNo: self.nonuserNo, productNo: item.productNo}
         console.log(self.nonuserNo);
         $.ajax({
             url : "/product/addNonUserCart.dox",
             dataType:"json",	
             type : "POST", 
             data : nparmap,
             success : function(data) { 
             }
         }); 
         self.openCartModal();
         console.log(self.showCartModal);
		}

  }, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnaaa();
		self.fnCheckScrap();
	}// created
});



</script>