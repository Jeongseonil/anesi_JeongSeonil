package com.example.anesi.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.example.anesi.model.Cart;
import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.service.ProductService;
import com.example.anesi.service.StoreService;
import com.google.gson.Gson;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;


@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/product/ontop_category.do") 
	public String productMain_ontop(Model model) throws Exception{
		return "/product_store_main_ontop_category";
	}
	
	@RequestMapping("/product/storemain.do") 
	public String productMain(Model model) throws Exception{
		return "/product_store_main";
	}
	//가구페이지로
	@RequestMapping("/product/storemain_byCategory.do") 
	public String storemain_furniture(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/product_store_main_byCategory";
	}


	@RequestMapping(value = "/product/store_main.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = storeService.searchProduct(map);
		resultMap.put("list", list);
		List<Category> list2 = storeService.searchCategoryList();
		resultMap.put("list2", list2);
		return new Gson().toJson(resultMap);
	}
	
	//유저 장바구니에 상품담기
	@RequestMapping(value = "/product/insertCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.addCartUser(map);
		resultMap.put("success", "장바구니등록완료");
		return new Gson().toJson(resultMap);
	}
	//유저 장바구니에 상품수량 올리기
	@RequestMapping(value = "/product/addCartCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCartCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.updateCartCnt(map);
		resultMap.put("success", "장바구니수량증가");
		return new Gson().toJson(resultMap);
	}
	
	//스크랩북에 상품담기
	@RequestMapping(value = "/product/insertScrap.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertScrap(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.addScrapbook(map);
		resultMap.put("success", "스크랩북등록완료");
		return new Gson().toJson(resultMap);
	}
	
	//스크랩북에 상품지우기
	@RequestMapping(value = "/product/deleteScrap.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteScrap(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		storeService.removeScrapbook(map);
		resultMap.put("success", "스크랩북삭제완료");
		return new Gson().toJson(resultMap);
	}
	
	//스크랩북리스트
	@RequestMapping(value = "/product/selectScrapList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectScrapCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Scrapbook> list = storeService.searchScrapbookList(map);
		resultMap.put("success", "스크랩북리스트확인");
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//장바구니 리스트
	@RequestMapping(value = "/product/selectCartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectCartList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Cart> list = storeService.userCartList(map);
		resultMap.put("success", "카트리스트확인");
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}

	
	  // 상품 썸네일 이미지
	  @RequestMapping(value = "/imgThumbnailSearch_1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String storeimage(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> img = productService.searchThumbnailImg(map);

	       resultMap.put("img", img);
	       return new Gson().toJson(resultMap);
	   }
	  
	  
	  private static final Logger logger = LoggerFactory.getLogger(StoreController.class);  
	  
	//장바구니 
//	  @ResponseBody
//	  @RequestMapping(value = {"/cart"}, method = {RequestMethod.POST})
//	  public int cart(HttpSession session, HttpServletRequest request, HttpServletResponse response, Cart cart) throws Exception {
//	    logger.info("itemno=" + cart.getProductNo());
//	    Cookie cookie = WebUtils.getCookie(request, "cartCookie");
//	    
	    //비회원장바구니 첫 클릭시 쿠키생성
//	    if (cookie == null && session.getAttribute("sessionNo") == null) {
//	      String nonuserNo = RandomStringUtils.random(6, true, true);
//	      Cookie cartCookie = new Cookie("cartCookie", nonuserNo);
//	      cartCookie.setPath("/");
//	      cartCookie.setMaxAge(60 * 60 * 24 * 1);
//	      response.addCookie(cartCookie);
//	      cart.setCart_ckid(nonuserNo);
//	      this.storeService.cartInsert();
//	      
//	     //비회원 장바구니 쿠키생성 후 상품추가
//	    } else if (cookie != null && session.getAttribute("member") == null) {
//	    	
//	      String ckValue = cookie.getValue();
//	      cartVO.setCart_ckid(ckValue);
//	      //장바구니 중복제한
//	      if(mainService.cartCheck(cartVO) != 0) {
//	    	  return 2;
//	      }
//	      //쿠키 시간 재설정해주기
//	      cookie.setPath("/");
//	      cookie.setMaxAge(60 * 60 * 24 * 1);
//	      response.addCookie(cookie);
//	      
//	      mainService.cartInsert(cartVO);
//	      
//	     //회원 장바구니 상품추가
//	    } else if(session.getAttribute("member") != null){
//	      MemberVO memberVO = (MemberVO) session.getAttribute("member");
//	      cartVO.setCart_mem_no(memberVO.getMEM_NO());
//	      if(mainService.cartMemCheck(cartVO) != 0) {
//	    	  return 2;
//	      }
//	      mainService.cartInsert(cartVO);
//	    } 
//	    return 1;
//	  }

	
}
