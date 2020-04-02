package com.kplant.client.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kplant.client.product.service.ProductService;
import com.kplant.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value ="/product/*" )
@Log4j
@AllArgsConstructor
public class ProductController {
	
	
	/**
	 * 상품 리스트
	 */
	@RequestMapping(value = "/productList")
	public String productList(@ModelAttribute("data")ProductVO mvo, Model model) {
		log.info("productList 호출 성공");
		return "product/productList";
	}
	
	/**
	 * 상품 상세페이지
	 */
	@RequestMapping(value = "/productDetail")
	public String productDetail(@ModelAttribute("data")ProductVO mvo, Model model) {
		log.info("productDetail 호출 성공");
		return "product/productDetail";
	}
	
	
}
