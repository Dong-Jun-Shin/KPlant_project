package com.kplant.client.product;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/product/*")
@Log4j
@AllArgsConstructor
public class ProductController {
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(Locale locale, Model model) {
		log.info("productList 호출성공");
		
		return "product/productList";
	}

}
