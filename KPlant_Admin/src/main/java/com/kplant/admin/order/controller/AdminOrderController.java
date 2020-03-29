package com.kplant.admin.order.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kplant.admin.common.vo.PageDTO;
import com.kplant.admin.order.service.AdminOrderService;
import com.kplant.admin.order.vo.OrderListVO;

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

		List<Map<String, String>> orderList = adminOrderService.orderList(olvo);
		model.addAttribute("order", orderList);
		
		// 전체 레코드 수 조회
		int total = adminOrderService.orderListCnt(olvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, olvo));
		
		return "order/orderList";
	}
	
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderDetail(@ModelAttribute OrderListVO olvo, Model model) {
		log.info("admin/주문관리 상세정보 호출 성공");

		Map<String, String> detailInfo = adminOrderService.getOrderInfo(olvo);		
		model.addAttribute("detail", detailInfo);
		
		List<Map<String, String>> prdInfo = adminOrderService.getOrderPrdInfo(olvo);		
		model.addAttribute("prdList", prdInfo);
		
		return "order/orderDetail";
	}
}
