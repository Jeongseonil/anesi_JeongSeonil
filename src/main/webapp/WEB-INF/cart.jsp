<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/Cart.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<meta charset="UTF-8">
<title>장바구니</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div id="cart-app">
    <div id="container">
  
     <div class="cart-item container mb-4" v-for="item in cartItemsUnique">
    <div class="row align-items-center">
      <div class="col-md-3">
        <img class="img-fluid" :src="item.imgPath + '/' + item.imgName" />
      </div>
     
	
	
	<div class="col-md-4">
    <h5>{{ item.productName }}</h5>
  <h5>제조사: {{ item.manufacturer }}</h5>
 <h5 class="production-item-price__orginal">정가: {{ numberWithCommas(item.productPrice) }}원</h5>
<span class="production-item-price__percent">-{{ item.discount }}%</span>
<h4 class="production-item-price__sell">할인가격: {{ numberWithCommas(calculateDiscountedPrice(item)) }}원</h4>
        <div class="main-option">
  <select class="option-box" v-model="item.selectedOption" @change="optionSelected(item)">
    <option disabled value="">옵션을 선택해주세요</option>
    <option v-for="(opt, index) in item.options" :key="opt.optionNo + '-' + index" :value="opt.optionNo">
      {{ opt.optionName }} +{{ opt.optionPrice }}원
    </option>
  </select>
</div>


 <button v-on:click="goToPurchasePage([item.productNo])" class="btn btn-sm btn-danger">구매하기</button>
      <div class="col-md-3">
        <button class="btn btn-sm btn-danger" v-on:click="deleteItem(item)">
          <i class="fas fa-trash-alt" aria-hidden="true" id="delete"></i> 삭제
        </button>
      </div>
    </div>
  </div>
</div>






			<div class="col-md-12 text-right mt-2">
     <button v-on:click="goToPurchasePage(cartItems.map(item => item.productNo))" class="btn btn-primary" style="width: 300px; float: right; height:30px">전체 구매하기</button>
    </div>
  </div>
</div>
</div>

    
  <template>
	  <paginate
	    :page-count="pageCount"
	    :page-range="3"
	    :margin-pages="2"
	    :click-handler= "goToPurchasePage"
	    :container-class="'pagination'"
	    :page-class="'page-item'">
	  </paginate>
	</template>

</body>
</html>
<script src="../js/jquery.js"></script>
<script>
Vue.component('paginate', VuejsPaginate)
new Vue({
	 el: '#cart-app',
	  data: {
	    cartItems: [],
	    optionName: "",
	    option1: "",
	    option: [],
	    optionPrice: "",
	    selectedOptions: [],
	    selectPage: 1,
	    pageCount: 1,
	    cnt: 0, // 선택된 옵션 정보를 저장할 배열
	    productList: [],
	    productNoList: [],
	    totalPrice: 0
	  
	  },
    computed: {
    	 cartItemsUnique() {
    		    const unique = [... new Set(this.cartItems.map(item => item.productNo))];
    		    return unique.map(pno => {
    		      return this.cartItems.find(item => item.productNo === pno);
    		    });
    		  },
    		  discountedPrice() {
    			    if (this.cartItems.length > 0 && this.cartItems[0].discountYn === 'Y') {
    			      return Math.floor((this.cartItems[0].productPrice * ((100 - this.cartItems[0].discount) / 100)) / 100) * 100;
    			    }
    			    return null;
    			  },
    	
    	
      
     
     
    },
    mounted() {
      this.loadCartList();
    },
    
    methods: {
    	loadCartList() {
    		  const self = this;
    		  const userNo = '${sessionNo}';
    		    $.ajax({
    		      url: '/product/viewCartList.dox',
    		      method: 'POST',
    		      dataType: 'json',
    		      data: { userNo: userNo },
    		      success: function(response) {
    		        console.log(response);

    		       
    		        
    		        // 중복 상품 제거
    		        const uniqueItemsMap = new Map();
    		        response.list.forEach(item => {
    		          if (!uniqueItemsMap.has(item.productNo)) {
    		            uniqueItemsMap.set(item.productNo, item);
    		          }
    		        });

    		        const uniqueItems = Array.from(uniqueItemsMap.values());

    		        // 상품별로 옵션 가져오기
    		        Promise.all(uniqueItems.map(item => {
    		          return new Promise(resolve => {
    		            self.fnOption(item.productNo, function(options) {
    		              // 각 상품의 옵션을 추가
    		              item.options = [{ optionNo: '', optionName: '상품을 선택하세요.', optionPrice: 0 }].concat(options);
    		              // 옵션 배열에 해당 상품의 옵션들을 추가해준다.
    		              self.option = self.option.concat(options);
    		              resolve();
    		            });
    		          });
    		        })).then(() => {
    		          // 모든 상품의 옵션이 로드된 후에 cartItems 할당
    		          self.cartItems = uniqueItems;
    		        });

    		      }
    		    });
    		},
    		  numberWithCommas(x) {
    		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    		  },
    		optionSelected(item) {
    			  const selectedOption = item.options.find(opt => opt.optionNo === item.selectedOption);
    			  console.log(selectedOption);

    			  if (selectedOption) {
    			    this.addToSelectedOptions(item); // 새롭게 추가된 메소드 호출
    			    this.calculateTotalPrice(); // 추가된 부분. 총 가격을 계산하기 위함.
    			  }
    			},
    			  calculateDiscountedPrice(product) {
    			    if (product.discountYn === 'Y') {
    			      return Math.floor((product.productPrice * ((100 - product.discount) / 100)) / 100) * 100;
    			    }
    			    return product.productPrice;
    			},
      deleteItem(item) {
    	    const requestData = {
    	        productNo: item.productNo,
    	        userNo: '${sessionNo}'
    	    };
    	    console.log(requestData);
    	  
    	    $.ajax({
    	        url: "/product/deleteCartlist.dox",
    	        method: "POST",
    	        data: requestData
    	    })
    	    .done(function(response) {
    	        if (response.success) {
    	            alert(response.success);
    	            location.reload();
    	        } else {
    	            alert("삭제 실패");
    	        }
    	    })
    	    .fail(function() {
    	        alert("요청 처리 실패");
    	    });
    	},
    	  calculateDiscountedPrice(product) {
    	    if (product.discountYn === 'Y') {
    	      return Math.floor(((100 - product.discount) / 100) * product.productPrice / 100) * 100;
    	    }
    	    return product.productPrice;
    	  },
    	  formatPrice(price) {
    	    return price.toLocaleString() // 예시: 1234500 -> "1,234,500"
    	  },
    	deleteAllCartItems(item) {
    	    // userNo를 requestData 객체에 추가
    	    const requestData = {
    	        userNo: '${sessionNo}'
    	    };
    	    console.log(requestData);

    	    $.ajax({
    	        url: "/product/deleteAllCartItems.dox",
    	        method: "POST",
    	        data: requestData
    	    })
    	    .done(function (response) {
    	        if (response.success) {
    	            alert(response.success);
    	            location.reload();
    	        } else {
    	            alert("삭제 실패");
    	        }
    	    })
    	    .fail(function () {
    	        alert("요청 처리 실패");
    	    });
    	},
		
        
    	

    	goToPurchasePage(productNoList) {
    		  const self = this;

    		  const startNum = ((self.selectPage - 1) * 2);
    		  const lastNum = 10;

    		  if (this.cartItems.length > 0) {
    		    // 상품 데이터를 필터 합니다: productNoList에 포함된 상품만 포함되도록 합니다.
    		    const filteredItems = this.cartItems.filter(item => productNoList.includes(item.productNo));
    		    sessionStorage.setItem('cartItems', JSON.stringify(filteredItems));

    		    // 여기에서 order.do로 이동하면서 데이터를 넘겨줍니다.
    		    const productData = filteredItems.map(item => ({
    		      productNo: item.productNo,
    		      productName: item.productName,
    		      productPrice: item.productPrice,
    		      optionNo: item.optionNo,
    		      quantity: 1
    		    }));

    		    let queryString = '';
    		    productData.forEach(item => {
    		      queryString += `&productData[]=${JSON.stringify(item)}`;
    		    });

    		    const queryParams = encodeURI(`?startNum=${startNum}&lastNum=${lastNum}${queryString}`);
    		    console.log(productData);
    		    $.pageChange("/order/main.do", { product: productData });

    		  } else {
    		    alert('장바구니에 상품이 없습니다. 상품을 추가한 후 다시 시도해주세요.');
    		  }
    		},

    	    
    	    addToSelectedOptions(item) {
    	    	  if (typeof item.selectedOption !== 'undefined') {
    	    	    const selectedItem = item.options.find(opt => opt.optionNo === item.selectedOption);
    	    	    let existingOption = this.selectedOptions.find(opt => opt.optionNo === selectedItem.optionNo);
    	    	    
    	    	    if (existingOption) {
    	    	      existingOption = selectedItem; // 이미 선택된 옵션을 최신 정보로 업데이트
    	    	    } else {
    	    	      // 옵션을 처음 선택한 경우
    	    	      this.selectedOptions.push({
    	    	        productNo: item.productNo,
    	    	        optionNo: selectedItem.optionNo,
    	    	        optionName: selectedItem.optionName,
    	    	        optionPrice: selectedItem.optionPrice,
    	    	        quantity: 1
    	    	      });
    	    	    }
    	    	  }
    	    	},
    	    	
  	    fnOption: function(productNo, callback) {
  	      var self = this;
  	      var nparmap = { productNo: productNo };
  	      $.ajax({
  	        url: '/optionSearch.dox',
  	        dataType: 'json',
  	        type: 'POST',
  	        data: nparmap,
  	        success: function(data) {
  	          // 옵션들을 콜백 함수로 전달
  	          typeof callback === 'function' && callback(data.option);
  	        },
  	        error: function(err) {
  	          console.error('옵션을 불러오는 데 실패했습니다.', err);
  	        }
  	      });
  	    },
  	  mounted() { // 또는 created()를 사용해도 됩니다.
  	      this.fnGetProduct();
  	    	this.productNoList = JSON.parse(`${map.product}`);
  	    	this.$nextTick(function() {
  	        for(let i in this.cartItems) {
  	          var dropdownElement = this.$refs['optionBox_' + i][0];
  	          if (dropdownElement) {
  	            dropdownElement.click();
  	          }
  	        }
  	      });
  	    },
  
  }
        
        
});
</script>
