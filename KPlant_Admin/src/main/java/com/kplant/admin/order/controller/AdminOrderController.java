package com.kplant.admin.order.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/*")
public class AdminOrderController {
	
	@RequestMapping("/orderList")
	public String orderList(Locale locale, Model model) {
		log.info("admin/orderList 호출 성공");
		
		return "order/orderList";
	}
}
