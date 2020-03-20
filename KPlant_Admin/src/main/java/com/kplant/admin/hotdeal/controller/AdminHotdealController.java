package com.kplant.admin.hotdeal.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/hotdeal/*")
public class AdminHotdealController {

	@RequestMapping("/hotdealList")
	public String hotdealList(Locale locale, Model model) {
		log.info("admin/hotdealList 호출 성공");
		
		return "hotdeal/hotdealList";
	}
}
