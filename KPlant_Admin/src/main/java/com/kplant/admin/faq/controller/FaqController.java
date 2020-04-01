package com.kplant.admin.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.admin.faq.service.FaqService;
import com.kplant.admin.faq.vo.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/*")
@Log4j
public class FaqController {
	
	@Setter(onMethod_=@Autowired)
	private FaqService faqService;
	
	/**********************************
	 * faqList 출력
	 * @param fvo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/faq/faqList", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("customer FAQList 호출 성공");
		
		List<FaqVO> faqList=faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "faq/faqList";
	}
	
}