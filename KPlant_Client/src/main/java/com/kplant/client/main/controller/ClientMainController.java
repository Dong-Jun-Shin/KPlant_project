package com.kplant.client.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.product.vo.ProductImageVO;
import com.kplant.client.product.vo.ProductVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping("/*")
public class ClientMainController {

	@RequestMapping("/")
	public String client(HttpServletRequest request, Model model) {
		log.info("client/index 호출 성공");
		
		/* 테스트 데이터 시작 */
		ArrayList<ProductVO> arr = new ArrayList<ProductVO>();
		
		ProductVO pvo = new ProductVO();
		pvo.setPrd_num("air_0001");
		pvo.setPrd_name("고무나무");
		pvo.setPrd_price(15000);
		
		List<ProductImageVO> piList = new ArrayList<ProductImageVO>();
		ProductImageVO pivo = new ProductImageVO();
		pivo.setI_file("product_b0667d6ad2b04900b33a0aa71ca62063_air_0001_2.png");
		piList.add(pivo);
		
		pvo.setImages(piList);
		arr.add(pvo);
		
		ProductVO pvo2 = new ProductVO();
		pvo2.setPrd_num("air_0003");
		pvo2.setPrd_name("몬스테라 화분");
		pvo2.setPrd_price(18500);
		
		List<ProductImageVO> piList2 = new ArrayList<ProductImageVO>(); 
		ProductImageVO pivo2 = new ProductImageVO();
		pivo2.setI_file("product_abaa565d0ff64e6ab7cc8e678687cc50_air_0003_2.png");
		piList.add(pivo2);
		
		pvo2.setImages(piList2);
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
		
		HttpSession session = request.getSession();
		session.setAttribute("m_num", 62);
		session.setAttribute("prdList", prdList);
		session.setAttribute("ordDetailList", ordDetailList);
		/* 테스트 데이터 끝*/
		
		return "index";
	}
	
}
