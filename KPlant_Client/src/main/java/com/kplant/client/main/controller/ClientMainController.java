package com.kplant.client.main.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;
import lombok.AllArgsConstructor;
import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.product.vo.ProductVO;
import com.kplant.client.event.vo.EventVO;
import com.kplant.client.main.service.MainService;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("*/")
@Log4j
@AllArgsConstructor
public class ClientMainController {
	@Setter(onMethod_ =@Autowired)
	private MainService mainService;
	

	@RequestMapping("/")
	public String client(HttpServletRequest request, Model model, EventVO evo, ProductVO pvo) {
		log.info("client/index 호출 성공");
		
		/* 테스트 데이터 시작 */
		ArrayList<ProductVO> arr = new ArrayList<ProductVO>();
		
		pvo.setPrd_num("prd_num 01");
		pvo.setPrd_name("몽골바위솔 5포트 바위솔 10cm포트묘");
		pvo.setPrd_price(9800);
		pvo.setImg_prd("prd_img 01");
		
		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("air_0003");
		pvo2.setPrd_name("몬스테라 화분");
		pvo2.setPrd_price(18500);
		
		List<ProductImageVO> piList2 = new ArrayList<ProductImageVO>(); 
		ProductImageVO pivo2 = new ProductImageVO();
		pivo2.setI_file("product_abaa565d0ff64e6ab7cc8e678687cc50_air_0003_2.png");
		piList.add(pivo2		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("air_0003");
		pvo2.setPrd_name("몬스테라 화분");
		pvo2.setPrd_price(18500);
		
		List<ProductImageVO> piList2 = new ArrayList<ProductImageVO>(); 
		ProductImageVO pivo2 = new ProductImageVO();
		pivo2.setI_file("product_abaa565d0ff64e6ab7cc8e678687cc50_air_0003_2.png");
		piList.add(pivo2);
		pvo.setPrd_num("prd_num 01");
		pvo.setPrd_name("몽골바위솔 5포트 바위솔 10cm포트묘");
		pvo.setPrd_price(9800);
		pvo.setImg_prd("prd_img 01");
		
		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("prd_num 02");
		pvo2.setPrd_name("몽골바위솔솔 솔나무");
		pvo2.setPrd_price(3600);
		pvo2.setImg_prd("prd_img 02");

		pvo2.setImages(piList2);
		arr.add(pvo2);
		
		List<ProductVO> prdList = arr;

		ArrayList<OrderDetailVO> odArr = new ArrayList<OrderDetailVO>();
		
		List<OrderDetailVO> ordDetailList = odArr;
		
		HttpSession session = request.getSession();
		session.setAttribute("m_num", 62);
		session.setAttribute("prdList", prdList);
		session.setAttribute("ordDetailList", ordDetailList);
		
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		
		List<ProductVO> producList = mainService.productList(pvo);
		
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
