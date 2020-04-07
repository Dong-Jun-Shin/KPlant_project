package com.kplant.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.AllArgsConstructor;
import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.product.vo.ProductImageVO;
import com.kplant.client.product.vo.ProductVO;
import com.kplant.client.event.vo.EventVO;
import com.kplant.client.main.service.MainService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class ClientMainController {
	@Setter(onMethod_ =@Autowired)
	private MainService mainService;
	
	@RequestMapping("/")
	public String client(HttpServletRequest request, Model model, EventVO evo, ProductVO pvo) {
		log.info("client/index 호출 성공");
		
		/* 테스트 데이터 시작 */
		//상품 샘플 리스트
		ArrayList<ProductVO> arr1 = new ArrayList<ProductVO>();
		
		//첫번째 상품 샘플
		ProductVO pvo1 = new ProductVO();
		pvo1.setPrd_num("air_0001");
		pvo1.setPrd_name("고무나무");
		pvo1.setPrd_price(15000);
		
		List<ProductImageVO> piList1 = new ArrayList<ProductImageVO>();
		ProductImageVO pivo1 = new ProductImageVO();
		pivo1.setI_file("product_b0667d6ad2b04900b33a0aa71ca62063_air_0001_2.png");
		piList1.add(pivo1);
		
		pvo1.setImages(piList1);
		arr1.add(pvo1);
		
		//두번째 상품 샘플
		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("air_0003");
		pvo2.setPrd_name("몬스테라 화분");
		pvo2.setPrd_price(18500);
		
		List<ProductImageVO> piList2 = new ArrayList<ProductImageVO>(); 
		ProductImageVO pivo2 = new ProductImageVO();
		pivo2.setI_file("product_abaa565d0ff64e6ab7cc8e678687cc50_air_0003_2.png");
		piList1.add(pivo2);
		
		pvo2.setImages(piList2);
		arr1.add(pvo2);
		
		List<ProductVO> prdList = arr1;

		
		//상품 수량 샘플리스트
		ArrayList<OrderDetailVO> odArr = new ArrayList<OrderDetailVO>();
		OrderDetailVO odvo = new OrderDetailVO();
		odvo.setPrd_num(pvo1.getPrd_num());
		odvo.setOrd_qty(1);

		OrderDetailVO odvo2 = new OrderDetailVO();
		odvo2.setPrd_num(pvo2.getPrd_num());
		odvo2.setOrd_qty(3);
		
		odArr.add(odvo);
		odArr.add(odvo2);
		List<OrderDetailVO> ordDetailList = odArr;
		
		
		HttpSession session = request.getSession();
//		session.setAttribute("m_num", 62);
		session.setAttribute("prdList", prdList);
		session.setAttribute("ordDetailList", ordDetailList);
		
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		
//		List<ProductVO> producList = mainService.productList(pvo1);
		
		return "index";
	}
	
	
	/*@RequestMapping(value = "/eventList", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("Main eventList 호출 성공");
		
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		
		return "home/home";
	}*/
	
	
	
}
