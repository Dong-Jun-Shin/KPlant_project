package com.kplant.client.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.client.product.service.ProductService;
import com.kplant.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value ="/product/*" )
@Log4j
@AllArgsConstructor
public class ProductController {
	private ProductService productService;
	
	//제품 출력(관엽/공기정화/분재)
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
		
		log.info("productList 호출 성공"); 
		List<ProductVO> productList = productService.productList(pvo,session);
		model.addAttribute("productList", productList);
		log.info(productList.size());
		return "product/productList";
	}
	
	//제품 출력(다육/선인장)
		@RequestMapping(value = "/productList2", method = RequestMethod.GET)
		public String productList2(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
			
			log.info("productList2 호출 성공"); 
			List<ProductVO> productList = productService.productList2(pvo,session);
			model.addAttribute("productList", productList);
			log.info(productList.size());
			return "product/productList2";
		}
		
		// 제품 출력(동양란/서양랸)
		@RequestMapping(value = "/productList3", method = RequestMethod.GET)
		public String productList3(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
	
			log.info("productList3 호출 성공");
			List<ProductVO> productList = productService.productList3(pvo, session);
			model.addAttribute("productList", productList);
			log.info(productList.size());
			return "product/productList3";
		}
	
		// 제품 출력(꽃바구니/꽃상자)
		@RequestMapping(value = "/productList4", method = RequestMethod.GET)
		public String productList4(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
	
			log.info("productList4 호출 성공");
			List<ProductVO> productList = productService.productList4(pvo, session);
			model.addAttribute("productList", productList);
			log.info(productList.size());
			return "product/productList4";
		}
	
		// 제품 출력(꽃다발)
		@RequestMapping(value = "/productList5", method = RequestMethod.GET)
		public String productList5(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
	
			log.info("productList5 호출 성공");
			List<ProductVO> productList = productService.productList5(pvo, session);
			model.addAttribute("productList", productList);
			log.info(productList.size());
			return "product/productList5";
		}
	
	
	
	
	/**
	 * 상품 상세페이지
	 */
	@RequestMapping(value = "/productDetail")
	public String productDetail(@ModelAttribute("data")ProductVO pvo, Model model, HttpSession session) {
		log.info("productDetail 호출 성공");
		log.info("pvo.getPrd_num() = "+pvo.getPrd_num());
		
		ProductVO detail=productService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
	}
	
	
}
