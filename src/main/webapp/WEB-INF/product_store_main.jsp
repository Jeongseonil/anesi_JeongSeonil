<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>��ǰ����������</title>
<style>




.product-main-category__image{
	width:100px;
	height:100px;
}


.production-item-thumnail__image{
	width:250px;
	height:250px;
}

.product-main-category__name{
	font-size : 15px;
}
.won_icon,.production-item-price__orginal2{
	text-decoration: line-through;
}

.production-item__content{
	width:220px;
	height:338px;
  	float : left;
	  margin : 50px;
}

#product-main-category__total > li {
        display: inline-block;
        position: relative;
        top: 10px;
      }
#product-main-category__total > li > a {
  display:block; position:relative; padding-bottom:19px;
  margin: 40px;
}
#product-main-category__total > li > a > img {
  width:100px; height:100px;
}
#product-main-category__total > li > a > span {
  position:absolute; bottom:0; left:50%; color:#666; line-height:1.462em; white-space:nowrap; transform:translate(-50%, 0)
}
      
.category-order_toggle{
	float : right;
	margin-right : 100px;
	background-color:#A782C3;
	border: #fff;
	text-align: center;
	border-radius:10px; 
	padding:8px;
	height:35px; 
	width: 100px;
	font-family: 'Pretendard-Regular';
	color :  #fff;
	
	
	
  }
.category-order_toggle:hover {
    background-color:rgb(235, 236, 237);
    transition: 0.7s;
    
}  
.category-order-list {

  list-style-type: none;
  padding: 0;
  margin: 0;
}

.category-order-list li {

  /* ī�װ��� ��Ÿ�ϸ� */
  padding: .5em;
  border-bottom: 1px solid #ccc;
}
.category-order-list-container {
	background :  #fff;
   	width: 100px;
   	float : right;
    

}

.aaa {
  color: #A782C3; /* ���ϴ� ���� */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* �׸��� �߰� */
  font-size: 18px; /* ���ϴ� ũ�� */
  /* �ٸ� ��Ÿ�� �Ӽ��� �߰� ���� */
}


</style>
</head>
<!-- �ּ� �� �����ּ��� -->
<body>
<jsp:include page="header.jsp"></jsp:include>


	<div id="store_main">
	<div><h1>ī�װ���</h1></div>
	<ul id ="product-main-category__total">
	
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>����</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>����</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>�к긯</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>����</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>����/�Ĺ�</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>�ݷ�����</span></a></li>
		
	</ul>
	
<!-- ��ǰ �����ϴ� ��ư-->	
<button class="category-order_toggle">
	  ����<i class="fa-solid fa-chevron-down"></i>
</button>
<div class="category-order-list-container" style="display:none;">


	
  <ul class="category-order-list" >
    <li value=""><a>��ü</a></li>
    <li value="LowestPrice"><a @click="fnOrderBy('LowestPrice')">���ݳ�����</a></li>
    <li value="HighestPrice"><a @click="fnOrderBy('HighestPrice')">���ݳ�����</a></li>
    <li value="NewArrival"><a @click="fnOrderBy('NewArrival')">�ֽż�</a></li>
    <li><a>--�������ԡ�--</a></li>
    <li value="HighestPurchase"><a @click="fnOrderBy('HighestPurchase')">���ų�����</a></li>
    <li value="HighestScrap"><a @click="fnOrderBy('HighestScrap')">��ũ��������</a></li>
    <li value="ManyReview"><a @click="fnOrderBy('ManyReview')">���丹����</a></li>
  </ul>
</div>

  
	<div><h1>�α��ǰ</h1></div>
	
		<div class="production-item__content" v-for="item in list">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header" >
			    <span class="production-item-header__brand" >{{item.manufacturer}}</span>
			    <span class="production-item-header__name">{{item.productName}}</span>
			    <div class="production-item-header__kind">{{item.categoryName}} 
			    <span class="production-item-header__country">{{item.country}}</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal" v-if="item.discountPrice!=''">
			    ����
			    <span class="won_icon">��</span>
			    <span class="production-item-price__orginal2" >{{item.productPrice}}</span>
			   </span>
			    
			    
			    <!-- production-item-price__sell  : �Ĵ� ���� -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">��</span>
			    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{item.discountPrice}}</span>
			    <span class="production-item-price__sell2" v-else>{{item.productPrice}}</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : ����-->
		       <div class="production-item-rating">
		       	<!-- �����-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    	<a><i class="fa-solid fa-share-nodes"></i></a>
		    	<a><i class="fa-regular fa-bookmark"></i></a>
	    </div> <!-- class="production-item__content" ��-->
		
	</div>

	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>

$(document).ready(function() {
    // ��ǰ���� ��ư Ŭ�� �̺�Ʈ �߰�
    $('.category-order_toggle').click(function() {
       $('.category-order-list-container').slideToggle('fast');
    });
});


var app = new Vue({
	el : '#store_main',
	data : {
		list : [],
		item : "",
		//��ǰ �����ϴ� ����Ʈ �±� v-model �̸�
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
		},
		


	    fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // ī�װ��� ���İ� ����
            self.fnGetList(); // AJAX ��û ������
	      }
     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>