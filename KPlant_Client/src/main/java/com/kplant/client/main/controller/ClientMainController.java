package com.kplant.client.main.controller;

import java.util.List;
//import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kplant.client.event.vo.EventVO;
import com.kplant.client.main.service.MainService;

import lombok.Setter;
import com.kplant.client.product.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping("/*")
public class ClientMainController {
	
	@Setter(onMethod_ =@Autowired)
	private MainService mainService;
	

	@RequestMapping("/")
	public String client(HttpServletRequest request, Model model, EventVO evo, ProductVO pvo) {
		log.info("client/index 호출 성공");
		
		/* 테스트 데이터 시작 */
		/*ArrayList<ProductVO> arr = new ArrayList<ProductVO>();
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
		
		/*이벤트 페이지*/
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		log.info("Main eventList호출 성공");
		
		/*상품 페이지 1*/
		List<ProductVO> productList = mainService.productList(pvo);
		model.addAttribute("MainProductList", productList);
		log.info("Main productList호출 성공");
		
		/*상품 페이지2*/
		List<ProductVO> productList1 = mainService.productList1(pvo);
		model.addAttribute("productList1", productList1);
		log.info("productList1 호출 성공"); 
		
		
		return "index";
		
	}
	
	/*@RequestMapping(value = "/eventList", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("Main eventList 호출 성공");
		
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		
		return "event/eventList";
	}*/
	
}
