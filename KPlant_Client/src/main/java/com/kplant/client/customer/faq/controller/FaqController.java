package com.kplant.client.customer.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kplant.client.customer.faq.service.FaqService;
import com.kplant.client.customer.faq.vo.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/customer/faq")
@Log4j
public class FaqController {
	
	@Setter(onMethod_=@Autowired)
	private FaqService faqService;
	
	/****************************************
	 * faqList 출력 
	 * @param fvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("customer FAQList 호출 성공");
		
		List<FaqVO> faqList=faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "customer/faq/faqList";
	}
	
	@ResponseBody
	@RequestMapping(value="/getFaq", method=RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public FaqVO getFaq(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("customer FAQList 호출 성공");
	
//		List<FaqVO> faqList=faqList.get(0);
		FaqVO faqvo = faqService.faqGet(fvo);
		
		return faqvo;
	}
}
