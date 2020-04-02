package com.kplant.admin.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kplant.admin.login.service.LoginService;
import com.kplant.admin.login.vo.AdminVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login/*")
public class LoginController {
	
	@Setter(onMethod_ =@Autowired)
	private LoginService loginService;
	
	/**
	 * 로그인
	 */
	@RequestMapping(value = "/login")
	public String login(@ModelAttribute("data")AdminVO avo, Model model) {
		log.info("login 호출 성공");
		return "login/login";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute AdminVO avo, HttpSession session) {
		log.info("loginCheck 호출 성공");
		
		AdminVO vo=loginService.loginCheck(avo, session);
		ModelAndView mav=new ModelAndView();
		log.info("avo="+ avo);
		if(vo!=null) {
			mav.setViewName("redirect:/member/memberList");
		}else {
			mav.setViewName("redirect:/*");
			
		}
		
		return mav;
	}
	
	/**
	 * 로그아웃 처리
	 * */
	 
	@RequestMapping(value = "/logout")
	public ModelAndView logout( HttpSession session) {
		log.info("logout 호출 성공");
		
		loginService.logout(session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/");
		//mav.addObject("mag","logout");
		
		return mav;
	}

}
