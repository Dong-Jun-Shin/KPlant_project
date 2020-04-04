package com.kplant.client.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kplant.client.order.service.ClientOrderService;
import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.order.vo.OrderListVO;
import com.kplant.client.order.vo.OrderVO;
import com.kplant.client.order.vo.PaymentVO;
import com.kplant.client.order.vo.ShippingVO;
import com.kplant.client.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/*")
public class ClientOrderController {
	
	@Setter(onMethod_ = @Autowired)
	private ClientOrderService ordService;
	
	@RequestMapping("/cart")
	public String cart(Model model) {
		log.info("client/장바구니 호출 성공");
		
		return "order/cart";
	}

	@RequestMapping("/orderSheet")
	public String orderSheet(Model model) {
		log.info("client/주문결제 호출 성공");

		return "order/orderSheet";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/complete")
	public String complete(HttpSession session, Model model) {
		log.info("client/주문완료 호출 성공");
		
		// 주문이 완료된 장바구니의 세션 삭제
		List<ProductVO> prdList = (List<ProductVO>)session.getAttribute("prdList");
		List<OrderDetailVO> ordDetailList = (List<OrderDetailVO>)session.getAttribute("ordDetailList");
		int[] selList = (int[])session.getAttribute("selList");

		for (int i : selList) {
			prdList.remove(i);
			ordDetailList.remove(i);
		}

		session.setAttribute("prdList", prdList);
		session.setAttribute("ordDetailList", ordDetailList);
		session.removeAttribute("selList");
		
		return "order/complete";
	}
	
	/**
	 * 부여할 주문 번호 조회
	 * @return String 주문 번호
	 */
	@ResponseBody
	@RequestMapping(value="/getOrderNum", method=RequestMethod.GET)
	public String getOrderNum() {
		log.info("client/주문번호 조회 호출 성공");
		return ordService.getOrderNum();
	}
	
	/**
	 * 주문 정보 등록
	 * @param ovo 주문자 정보
	 * @param shvo 배송지 정보
	 * @param pvo 결제 정보
	 * @param prd_num 주문 상세의 상품번호 리스트
	 * @param ord_qty 주문 상세의 상품갯수 리스트
	 * @return String 결과
	 */
	@ResponseBody
	@RequestMapping(value="/orderInsert", method=RequestMethod.POST)
	public String orderInsert(OrderListVO olvo, ShippingVO shvo, PaymentVO pvo, String[] prd_num, Integer[] ord_qty) {
		log.info("client/주문등록 호출 성공");
		
		//받아온 String[]을 odvo 리스트로 변환
		List<OrderDetailVO> odvo = new ArrayList<OrderDetailVO>();
		for (int i = 0; i < prd_num.length; i++) {
			OrderDetailVO vo = new OrderDetailVO();
			vo.setOrd_num(olvo.getOrd_num());
			vo.setPrd_num(prd_num[i]);
			vo.setOrd_qty(ord_qty[i]);
			
			odvo.add(vo);
		}
		
		// 주문 정보 등록
		OrderVO ovo = new OrderVO(olvo, odvo, shvo, pvo);
		int result = ordService.orderInsert(ovo);
		if(result==1) return "success";
		
		return "false";
	}
	
	@ResponseBody
	@RequestMapping(value="/sessionSet", method = RequestMethod.POST)
	public String sessionSet(HttpSession session, int[] num) {
		log.info("client/세션 변경 호출 성공");
		String result = "";

		try {
			session.setAttribute("selList", num);
			result = "success";
		} catch (NullPointerException e) {
			result = "null";
		} catch (Exception e) {
			result = "false";
			e.printStackTrace();
		}
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/sessionUpdate", method = RequestMethod.POST)
	public String sessionUpdate(HttpSession session, int num, int qty) {
		log.info("client/세션 변경 호출 성공");
		String result = "";

		try {
			List<OrderDetailVO> ordDetailList = (List<OrderDetailVO>)session.getAttribute("ordDetailList");
			OrderDetailVO odvo = ordDetailList.get(num);
			odvo.setOrd_qty(qty);
			ordDetailList.set(num, odvo);

			session.setAttribute("ordDetailList", ordDetailList);
			result = "success";
		} catch (NullPointerException e) {
			result = "null";
		} catch (Exception e) {
			result = "false";
			e.printStackTrace();
		}
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/sessionDelete", method = RequestMethod.POST)
	public String sessionDelete(HttpSession session, int num) {
		log.info("client/세션 삭제 호출 성공");
		String result = "";

		try {
			List<ProductVO> prdList = (List<ProductVO>)session.getAttribute("prdList");
			prdList.remove(num);
			
			List<OrderDetailVO> ordDetailList = (List<OrderDetailVO>)session.getAttribute("ordDetailList");
			ordDetailList.remove(num);

			session.setAttribute("prdList", prdList);
			session.setAttribute("ordDetailList", ordDetailList);
			result = "success";
		} catch (NullPointerException e) {
			result = "null";
		} catch (Exception e) {
			result = "false";
			e.printStackTrace();
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/sessionAllDelete", method = RequestMethod.POST)
	public String sessionAllDelete(HttpSession session) {
		log.info("client/세션 삭제 호출 성공");
		String result = "";
		
		try {
			session.removeAttribute("prdList");
			session.removeAttribute("ordDetailList");
			
			result = "success";
		} catch (NullPointerException e) {
			result = "null";
		} catch (Exception e) {
			result = "false";
			e.printStackTrace();
		}
		
		return result;
	}
}
