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
	
	/**
	 * 상품 리스트
	 */
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
		
		log.info("productList 호출 성공"); 
		List<ProductVO> productList = productService.productList(pvo, session);
		model.addAttribute("productList", productList);
		log.info(productList.size());
		return "product/productList";
	}
	
	/**
	 * 상품 상세페이지
	 */
	@RequestMapping(value = "/productDetail")
	public String productDetail(@ModelAttribute("data")ProductVO pvo, Model model, HttpSession session) {
		log.info("productDetail 호출 성공");
		log.info("pvo.getPrd_num() = "+pvo.getPrd_num());
		
		pvo.setPrd_num((String) session.getAttribute("prd_num"));
		
		ProductVO detail=productService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
	}
	
	
}
