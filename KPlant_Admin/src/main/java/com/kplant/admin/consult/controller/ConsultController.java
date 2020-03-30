package com.kplant.admin.consult.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.admin.consult.service.ConsultService;
import com.kplant.admin.consult.vo.ConsultVO;
import com.kplant.admin.faq.service.FaqService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/*")
@Log4j
public class ConsultController {
	
	@Setter(onMethod_=@Autowired)
	private ConsultService consultService;
	
	@RequestMapping(value = "consult/consultList", method=RequestMethod.GET)
	public String consultList(ConsultVO cvo, Model model) {
		log.info("Admin ConsultMain page이동 호출 성공");
		 
		return "consult/consultList";
	}
}
