package com.kplant.admin.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kplant.admin.faq.service.FaqService;
import com.kplant.admin.faq.vo.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/faq/*")
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
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("Admin FAQList 호출 성공");
		
		List<FaqVO> faqList=faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "faq/faqList";
	}
	
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String faqInsert(FaqVO fvo) {
		log.info("faqInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqInsert(fvo);
		if (result == 1) {
			url = "/faq/faqInsert";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(@ModelAttribute FaqVO fvo, RedirectAttributes ras) {
		log.info("faqDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqDelete(fvo.getFaq_num());
		
		if (result == 1) {
			url = "/faq/faqList";
		}else {
			url = "redirect:"+url;
		}
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo) {
		log.info("faqUpdate 호출 성공");
		int result = 0;
		String url = "";
		
		result = faqService.faqUpdate(fvo);
		
		if (result == 1) {
			url="/admin/faq/faqDetail?faq_num="+fvo.getFaq_num();
		}else {
			url="/admin/faq/updateForm?faq_num="+fvo.getFaq_num();
		}
		
		return "redirect"+url;
	}
	
	@RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("updateForm 호출성공");
		log.info("faq_num = " + fvo.getFaq_num());
		
		FaqVO updateData = faqService.updateForm(fvo);
		model.addAttribute("updataData", updateData);
		
		return "faq/updateForm";
	}
	
	@RequestMapping(value = "/faqDetail", method = RequestMethod.GET)
	public String faqDetail(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faqDetail 호출 성공");
		log.info("fvo = " + fvo);
		
		FaqVO detail = faqService.faqDetail(fvo);
		model.addAttribute("detail", detail);
		
		return "faq/faqDetail";
	}
	
	@RequestMapping(value = "/writeForm")
	public String writeForm(@ModelAttribute("data") FaqVO fvo, Model model) {
		log.info("faq WriteForm 호출 성공");
		
		return "faq/writeForm";
	}
}
