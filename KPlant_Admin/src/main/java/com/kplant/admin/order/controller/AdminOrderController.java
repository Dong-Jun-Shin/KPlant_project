package com.kplant.admin.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kplant.admin.common.excel.ListExcelView;
import com.kplant.admin.common.vo.PageDTO;
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
	
	/**
	 * 주문관리 목록 조회
	 * 
	 * @param olvo
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderList")
	public String orderList(@ModelAttribute("data")OrderListVO olvo, Model model) {
		log.info("admin/주문관리 목록 호출 성공");

		// 목록 조회
		List<Map<String, String>> orderList = adminOrderService.orderList(olvo);
		model.addAttribute("order", orderList);
		
		// 전체 레코드 수 조회
		int total = adminOrderService.orderListCnt(olvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, olvo));
		
		return "order/orderList";
	}

	/**
	 * 주문관리 주문상태 변경 (취소, 운송장 등록, 배송준비 등)
	 * 
	 * @param ord_num
	 * @param ord_trn
	 * @param ord_status
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/orderUpdate", method = RequestMethod.POST)
	public String orderUpdate(@RequestParam(required = false) String[] ord_num 
			, @RequestParam(required = false) String[] ord_trn, String ord_status) {
		log.info("admin/주문상태 수정 호출 성공");
		
		// 전달받은 param을 OrderListVO로 가공
		List<OrderListVO> list = new ArrayList<OrderListVO>();
		for (int i = 0; i < ord_num.length; i++) {
			OrderListVO olvo = new OrderListVO();
			if(ord_trn != null) {
				olvo.setOrd_trn(ord_trn[i]);
			}
			olvo.setOrd_num(ord_num[i]);
			olvo.setOrd_status(ord_status);
			
			list.add(olvo);
		}
		
		String result = adminOrderService.orderUpdate(list);
		
		return result;
	}
	
	/**
	 * 주문관리 상세정보 조회
	 * 
	 * @param olvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderDetail(@ModelAttribute OrderListVO olvo, Model model) {
		log.info("admin/주문관리 상세정보 호출 성공");

		// 주문의 상세정보
		Map<String, String> detailInfo = adminOrderService.getOrderInfo(olvo);
		switch (detailInfo.get("pay_method")) {
		case "card":
			detailInfo.put("pay_method", "신용카드");
			break;
		case "trans":
			detailInfo.put("pay_method", "실시간 계좌이체");
			break;
		case "samsung":
			detailInfo.put("pay_method", "삼성페이");
			break;
		}
		
		model.addAttribute("detail", detailInfo);
		
		// 주문의 상품리스트 정보
		List<Map<String, String>> prdInfo = adminOrderService.getOrderPrdInfo(olvo);		
		model.addAttribute("prdList", prdInfo);
		
		return "order/orderDetail";
	}
	
	/**
	 * 주문번호에 따른 결제번호 조회
	 * 
	 * @param olvo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getPayNum", method = RequestMethod.GET)
	public String getPayNum(OrderListVO olvo) {
		log.info("admin/결제번호 조회 호출 성공");
		String paynum = adminOrderService.getPayNum(olvo); 
		
		return paynum;
	}

	/**
	 * 전체 주문목록을 엑셀로 다운로드
	 * 
	 * @param olvo
	 * @return
	 */
	@RequestMapping(value="/orderExcel", method=RequestMethod.GET)
	public ModelAndView orderExcel(@ModelAttribute OrderListVO olvo) {
		log.info("orderExcel 호출 성공");
		
		List<Map<String, String>> orderList = adminOrderService.orderExcelList();
		
		//excel을 가진 view를 생성, List를 활용해서 template으로 전달
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", orderList);
		mv.addObject("template", "orderTemplate.xlsx");
		mv.addObject("file_name", "order");
		
		//View를 반환
		return mv;
	}
}
