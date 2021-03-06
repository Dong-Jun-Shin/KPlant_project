package com.kplant.admin.main.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping("/*")
public class AdminMainController {

	@RequestMapping("")
	public String client(Locale locale, Model model) {
		log.info("admin/member 호출 성공");
		
		return "index";
	}
	
}
