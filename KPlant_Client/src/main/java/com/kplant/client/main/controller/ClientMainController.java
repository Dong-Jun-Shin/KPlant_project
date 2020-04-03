package com.kplant.client.main.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.client.event.vo.EventVO;
import com.kplant.client.main.service.MainService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping("/*")
public class ClientMainController {
	
	@Setter(onMethod_ =@Autowired)
	private MainService mainService;
	
	
	@RequestMapping("")
	public String client(Locale locale, Model model) {
		log.info("client/index 호출 성공");
		
		return "index";
	}
	
	@RequestMapping(value = "/eventList", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("Main eventList 호출 성공");
		
		List<EventVO> eventList = mainService.eventList(evo);
		model.addAttribute("MainEventList", eventList);
		
		return "event/eventList";
	}
	
}
