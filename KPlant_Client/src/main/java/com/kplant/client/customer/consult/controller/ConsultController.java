package com.kplant.client.customer.consult.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.client.customer.consult.vo.ConsultVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/customer/*")
@Log4j
public class ConsultController {
	@RequestMapping(value="/consult/consultMain", method=RequestMethod.GET)
	public String consult(@ModelAttribute("data") ConsultVO cvo, Model model) {
		log.info("customer ConsultMain page이동 호출 성공");
		 
		return "customer/consult/consultMain";
	}
}
