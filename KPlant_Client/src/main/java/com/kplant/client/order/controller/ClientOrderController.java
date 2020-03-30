package com.kplant.client.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kplant.client.join.vo.MemberVO;
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
	public String cart(HttpServletRequest request, Model model) {
		log.info("client/장바구니 호출 성공");
		
		return "order/cart";
	}

	@RequestMapping("/orderSheet")
	public String orderSheet(HttpServletRequest request, Model model) {
		log.info("client/주문결제 호출 성공");

		/* 테스트 데이터 시작 */
		ArrayList<ProductVO> arr = new ArrayList<ProductVO>();
		ProductVO pvo = new ProductVO();
		pvo.setPrd_num("prd_num 01");
		pvo.setPrd_name("몽골바위솔 5포트 바위솔 10cm포트묘");
		pvo.setPrd_price(9800);
		pvo.setImg_prd("prd_img 01");
		
		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("prd_num 02");
		pvo2.setPrd_name("몽골바위솔솔 솔나무");
		pvo2.setPrd_price(3600);
		pvo2.setImg_prd("prd_img 02");
		
		arr.add(pvo);
		arr.add(pvo2);
		List<ProductVO> prdList = arr;

		ArrayList<OrderDetailVO> odArr = new ArrayList<OrderDetailVO>();
		OrderDetailVO odvo = new OrderDetailVO();
		odvo.setPrd_num(pvo.getPrd_num());
		odvo.setOrd_qty(2);

		OrderDetailVO odvo2 = new OrderDetailVO();
		odvo2.setPrd_num(pvo2.getPrd_num());
		odvo2.setOrd_qty(3);
		
		odArr.add(odvo);
		odArr.add(odvo2);
		List<OrderDetailVO> ordDetailList = odArr;
		
		MemberVO mvo = new MemberVO();
		mvo.setM_num(62);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", mvo);
		session.setAttribute("prdList", prdList);
		session.setAttribute("ordDetailList", ordDetailList);
		/* 테스트 데이터 끝*/
		
		return "order/orderSheet";
	}
	
	@RequestMapping("/complete")
	public String complete(Locale locale, Model model) {
		log.info("client/주문완료 호출 성공");
		
		// TODO 이메일 발송
		
		// TODO 장바구니의 세션 삭제
		
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
}
