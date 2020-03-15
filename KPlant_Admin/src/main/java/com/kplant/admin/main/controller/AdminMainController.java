package com.kplant.admin.main.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		log.info("admin/index 호출 성공");
		
		return "index";
	}
	
}
