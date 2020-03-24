package com.kplant.admin.event.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.admin.event.service.EventService;
import com.kplant.admin.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/event/*")
@AllArgsConstructor
@Log4j
public class EventController {
	
	private EventService eventService;
	
	/*********************************
	 * 이벤트 목록 구현하기(페이징 처리 목록 조회)
	 */
	@RequestMapping(value = "/eventList", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		List<EventVO> eventList = eventService.eventList(evo);
		model.addAttribute("eventList", eventList);
		return "event/eventList";
	}
	
	/*********************************
	 * 이벤트 글 상세보기 구현
	 */
	@RequestMapping(value = "/eventDetail", method=RequestMethod.GET)
	public String eventDetail(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventDetail 호출 성공");
		log.info("evo = " + evo);
		
		EventVO detail = eventService.eventDetail(evo);
		model.addAttribute("detail", detail);
		
		return "event/eventDetail";
	}
}
