package com.kplant.client.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kplant.client.join.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value ="/login/*" )
@Log4j
@AllArgsConstructor
public class LoginController {
	
	/**
	 * 로그인
	 */
	@RequestMapping(value = "/login")
	public String login(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("login 호출 성공");
		return "login/login";
	}
	
}
