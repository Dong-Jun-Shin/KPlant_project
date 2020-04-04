package com.kplant.admin.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kplant.admin.common.vo.PageDTO;
import com.kplant.admin.faq.service.FaqService;
import com.kplant.admin.faq.vo.FaqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/faq/*")
@Log4j
@AllArgsConstructor
public class FaqController {
	
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
		
		//전체 레코드 조회
		List<FaqVO> faqList=faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		// 전체 레코드 수 조회
	    int total = faqService.faqListCnt(fvo);
	      
		// 페이징 처리 (CommonVO 자리에 하위 클래스를 전달)
	    model.addAttribute("pageMaker", new PageDTO(total, fvo));
	      
		return "faq/faqList";
	}
	
	@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
	public String faqInsert(FaqVO fvo) {
		log.info("faqInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = faqService.faqInsert(fvo);
		
		if (result == 1) {
			url = "/faq/faqList";
		}else {
			url = "/faq/writeForm";
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
			url="/faq/faqDetail?faq_num="+fvo.getFaq_num();
		}else {
			url="/faq/updateForm?faq_num="+fvo.getFaq_num();
		}
		
		return "redirect:"+url;
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
