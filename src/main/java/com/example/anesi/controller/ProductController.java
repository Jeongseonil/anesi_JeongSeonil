package com.example.anesi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.model.Category;
import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.service.ProductService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	@RequestMapping("/searchProduct.do") 
	public String searchProduct(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/searchProduct";
		
	}
	@RequestMapping("/product/cart.do") 
	public String cart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/cart";
		
	}
	//상품 상세 페이지
	@RequestMapping("/product/view.do") 
	public String view(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/product_view";
		
	}
	
	@RequestMapping(value = "/product/category.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/category2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String category2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList2(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	  @RequestMapping(value = "/product/cartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String cartList(Model model) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> list = ProductService.selectCartProductList();
	       resultMap.put("list", list);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 상세 정보
	  @RequestMapping(value = "/productSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String product(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       Product product = productService.searchProductList(map);

	       resultMap.put("product", product);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 별점 검색
	  @RequestMapping(value = "/csatSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String avg(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       Product csat = productService.searchCsatAvg(map);

	       resultMap.put("csat", csat);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 옵션 검색
	  @RequestMapping(value = "/optionSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String option(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> option = productService.searchOption(map);

	       resultMap.put("option", option);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 썸네일 이미지
	  @RequestMapping(value = "/imgThumbnailSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String img1(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> img = productService.searchThumbnailImg(map);

	       resultMap.put("img", img);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 콘텐츠 이미지
	  @RequestMapping(value = "/imgSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String img(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> imgList = productService.searchProductImg(map);

	       resultMap.put("imgList", imgList);
	       return new Gson().toJson(resultMap);
	   }
	  //상품 검색창 검색
	  @RequestMapping(value = "/searchBarProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String searchBar(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> list = productService.searchProduct(map);
	       resultMap.put("list", list);
	       return new Gson().toJson(resultMap);
	   }
	// 상품 콘텐츠 이미지
		  @RequestMapping(value = "/imgSearch2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String img2(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Scrapbook> imgList2 = productService.searchcontentImg2(map);

		       resultMap.put("imgList2", imgList2);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String review(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		       int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		       map.put("startNum", startNum);
		       map.put("lastNum", lastNum);
		       resultMap=productService.searchReview(map);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewCntSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewCnt(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       resultMap = productService.searchReviewCnt(map);
		       return new Gson().toJson(resultMap);
		   }
		// 상품 구매 확인(리뷰)
		  @RequestMapping(value = "/reviewUserSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewUser(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Order> user = productService.searchReviewUser(map);
		       resultMap.put("user", user);			   
		       return new Gson().toJson(resultMap);
		   }
		  
		  @RequestMapping(value = "/product/viewCartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String userCartList(Model model, @RequestParam("userNo") int userNo) throws Exception {
			    HashMap<String, Object> map = new HashMap<String, Object>();
			    HashMap<String, Object> resultMap = new HashMap<String, Object>();
			    
			    map.put("userNo", userNo); // userNo를 int 형으로 받아서 HashMap에 담아 전달합니다.
			    List<Product> list = productService.selectCartList(map);

			    resultMap.put("list", list);
			    return new Gson().toJson(resultMap);
		  }
		  
		// 상품등록
		  @RequestMapping(value = "/addProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String addProduct(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       productService.addProduct(map);
		       return new Gson().toJson(resultMap);
		   }
		  
		// 상품 등록후 검색
		  @RequestMapping(value = "/insertSearchProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String insertSearchProduct(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       Product info = productService.insertSearchProduct(map);
		       resultMap.put("info", info);
		       return new Gson().toJson(resultMap);
		   }
		  // 옵션 등록
		  @RequestMapping(value = "/addOption.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String addOption(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       productService.addOption(map);
		       return new Gson().toJson(resultMap);
		   }
	
		  @RequestMapping(value = "/product/deleteCartlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String deleteCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				productService.deleteCartlist(map);
				resultMap.put("success", "삭제완료");
				return new Gson().toJson(resultMap);
			}
		  @RequestMapping(value = "/product/searchProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			public @ResponseBody List<Product> searchProduct(Model model,  @RequestParam HashMap<String, Object> map, HttpSession session) throws Exception {
			    // 요청 매개변수로부터 productName을 가져옵니다.
			    String productName = (String) map.get("productName");

			    // productName 값이 있는 경우 map 및 session에 추가합니다.
			    if (productName != null) {
			        map.put("productName", productName);
			        session.setAttribute("searchKeyword", productName);
			    }

			    // 콘솔에 세션 값 출력
			    

			    // 상품 검색 서비스 호출
			    List<Product> productList = productService.searchProduct(map);
			    return productList;
			}

			@RequestMapping(value = "/product/searchBarProduct.dox", produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String searchProductList(@RequestParam HashMap<String, Object> map, HttpSession session) throws Exception {
			    String productName = (String) map.get("productName");

			    // 세션에 저장된 productName 얻기
			    String sessionProductName = (String) session.getAttribute("productName");

			    // productName이 null이면 세션에서 가져온 값을 사용
			    if (productName == null && sessionProductName != null) {
			        productName = sessionProductName;
			    }

			    HashMap<String, Object> params = new HashMap<>();
			    params.put("productName", productName);

			    List<Product> productList = productService.searchBarProductList(params);

			    HashMap<String, Object> resultMap = new HashMap<>();
			    resultMap.put("products", productList);
			    System.out.println("세션에서 가져온 검색어: " + session.getAttribute("searchKeyword"));
			    return new Gson().toJson(resultMap);
			}


}
