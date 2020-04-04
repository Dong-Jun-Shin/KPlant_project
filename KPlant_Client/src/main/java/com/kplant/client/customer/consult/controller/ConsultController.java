package com.kplant.client.customer.consult.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.client.customer.consult.service.ConsultService;
import com.kplant.client.customer.consult.vo.ConsultVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/customer/*")
@Log4j
@AllArgsConstructor
public class ConsultController {
	
	private ConsultService consultService;
	
	/**********************
	 * consultmain 창 출력하기
	 * @param cvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/consult/consultMain", method=RequestMethod.GET)
	public String consult(@ModelAttribute("data") ConsultVO cvo, Model model) {
		log.info("customer ConsultMain page이동 호출 성공");
		 
		return "customer/consult/consultMain";
	}
	
	/**************************
	 * 글쓰기 폼 출력하기
	 */
	@RequestMapping(value="/consult/writeForm")
	public String writeFrom(@ModelAttribute("data")ConsultVO cvo) {
		log.info("consult writeForm 호출 성공");
		
		return "customer/consult/writeForm";
	}
	
	/*****************************
	 * 1:1 문의 작성하기
	 */
	@RequestMapping(value = "/consult/consultInsert", method = RequestMethod.POST)
	public String consultInsert(ConsultVO cvo) {
		log.info("consultInsert 호출 성공");
		
		log.info("file name : " + cvo.getFile().getOriginalFilename());
		String value = "";
		int result = 0;
		
		result = consultService.consultInsert(cvo);
		if (result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		return value;
	}
}
