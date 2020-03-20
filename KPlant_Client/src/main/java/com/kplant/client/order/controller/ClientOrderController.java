package com.kplant.client.order.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/*")
public class ClientOrderController {
	
	@RequestMapping("/cart")
	public String cart(Locale locale, Model model) {
		log.info("client/장바구니 호출 성공");
		
		return "order/cart";
	}

	@RequestMapping("/orderSheet")
	public String orderSheet(Locale locale, Model model) {
		log.info("client/주문결제 호출 성공");
		
		return "order/orderSheet";
	}
	
	@RequestMapping("/complete")
	public String complete(Locale locale, Model model) {
		log.info("client/주문완료 호출 성공");
		
		return "order/complete";
	}
}