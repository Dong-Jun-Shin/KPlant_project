package com.kplant.admin.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kplant.admin.common.vo.PageDTO;
import com.kplant.admin.event.service.EventService;
import com.kplant.admin.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/event/*")
@AllArgsConstructor
@Log4j
public class EventController {
	
	@Setter(onMethod_=@Autowired)
	private EventService eventService;
	
	/*파라미터를 바인딩할때 자동으로 호출되는 @InitBinder를 이용해서 변환을 처리할 수 있다.
	 * 사진 파일을 수정할때 새로 값을 넣지 않았을때 처리할 수 있도록 처리할수 있게 해주는 메서드*/
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class, "fileF", new StringTrimmerEditor(true));
		binder.registerCustomEditor(MultipartFile.class, "fileS", new StringTrimmerEditor(true));
		binder.registerCustomEditor(MultipartFile.class, "fileT", new StringTrimmerEditor(true));
	}
	
	/*********************************
	 * 이벤트 목록 구현하기(페이징 처리 목록 조회)
	 */
	@RequestMapping(value = "/eventList", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("Admin eventList 호출 성공");
		
		//전체 레코드 조회
		List<EventVO> eventList = eventService.eventList(evo);
		model.addAttribute("eventList", eventList);
		
		//전체 레코드 수 조회
		int total = eventService.eventListCnt(evo);
		
		// 페이징 처리 (CommonVO 자리에 하위 클래스를 전달)
		model.addAttribute("pageMaker", new PageDTO(total, evo));

		return "event/eventList";
	}
	
	/*********************************
	 * 이벤트 글 상세보기 구현
	 */
	@RequestMapping(value = "/eventDetail", method=RequestMethod.GET)
	public String eventDetail(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("Admin eventDetail 호출 성공");
		log.info("evo = " + evo);
		
		EventVO detail = eventService.eventDetail(evo);
		model.addAttribute("detail", detail);
		
		return "event/eventDetail";
	}
	
	/************************
     * 글쓰기 폼 출력하기
     */
    @RequestMapping(value = "/writeForm")
    public String writeForm(@ModelAttribute("data")EventVO bvo) {
       log.info("Admin event writeForm 호출 성공");
      
       return "event/writeForm";
    }
    
    /************************
     * 이벤트 정보 입력하기 (Insert)
     */
    @PostMapping(value = "/eventInsert", produces = "text/plain; charset=UTF-8")
    public String eventInsert(@ModelAttribute EventVO evo) {
    	log.info("Admin eventInsert 호출 성공");
		log.info(evo);
    	
//		log.info("file name : " + evo.getFileS().getOriginalFilename());
//		log.info("file name : " + evo.getFileT().getOriginalFilename());
		String value = "";
		int result = 0;
		
		log.info("file name : " + evo.getFileF().getOriginalFilename());
		result = eventService.eventInsert(evo);

		
		if (result==1) {
			value = "/event/eventList";
		}else {
			value = "/event/writeForm";
		}
		return "redirect:"+value;
    }
    
    @PostMapping(value = "/eventUpdate")
    public String eventUpdate(@ModelAttribute EventVO evo) {
    	log.info("Admin eventUpdate 호출 성공");
    	log.info("evo" + evo);
    	String value="";
    	int result = 0;
    	
    	result = eventService.eventUpdate(evo);
    	if (result==1) {
			value="/event/eventDetail?evnt_num="+evo.getEvnt_num();
		}else {
			value="/event/updateForm?evnt_num="+evo.getEvnt_num();
		}
    	return "redirect:"+value;
    }
    
   	@RequestMapping(value = "/eventDelete")
    public String eventDelete(@ModelAttribute EventVO evo) {
    	log.info("eventDelete 호출 성공");
		
		int result = 0;
		String value = "";
		result = eventService.eventDelete(evo);
		if (result==1) {
			value="/event/eventList";
		}else {
			value="/event/eventDe tail?evnt_num="+evo.getEvnt_num();
		}
		return "redirect:"+value;
    }
    
    @RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("updateForm 호출성공");
		log.info("evnt_num = " + evo.getEvnt_num());
		
		EventVO updateData = eventService.updateForm(evo);
		model.addAttribute("updateData", updateData);
		
		return "event/updateForm";
	}
}
