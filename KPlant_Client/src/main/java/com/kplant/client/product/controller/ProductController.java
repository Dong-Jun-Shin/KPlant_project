package com.kplant.client.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/product/*")
@Log4j
@AllArgsConstructor
public class ProductController {
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model, HttpSession session) {
		
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