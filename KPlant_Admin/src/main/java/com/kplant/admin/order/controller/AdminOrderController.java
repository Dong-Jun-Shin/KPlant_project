package com.kplant.admin.order.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.admin.order.service.AdminOrderService;
import com.kplant.admin.order.vo.OrderListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
public class AdminOrderController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminOrderService adminOrderService;
	
	@RequestMapping("/orderList")
	public String orderList(@ModelAttribute("data")OrderListVO olvo, Model model) {
		log.info("admin/orderList 호출 성공");

		List<OrderListVO> orderList = adminOrderService.orderList(olvo);
		model.addAttribute("orderList", orderList);
		
		return "order/orderList";
	}
	
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderDetail(Locale locale, Model model) {
		log.info("admin/orderDetail 호출 성공");

		return "order/orderDetail";
	}
}
