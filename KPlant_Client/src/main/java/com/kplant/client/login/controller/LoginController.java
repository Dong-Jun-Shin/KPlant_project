package com.kplant.client.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.login.service.LoginService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value ="/login/*" )
@Log4j
public class LoginController {
	//로깅을 위한 변수
	//private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Setter(onMethod_ =@Autowired)
	private LoginService loginService;
	
	/**
	 * 로그인
	 */
	@RequestMapping(value = "/login")
	public String login(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("login 호출 성공");
		return "login/login";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute MemberVO mvo, HttpSession session) {
		log.info("loginCheck 호출 성공");
		
		MemberVO vo=loginService.loginCheck(mvo, session);
		ModelAndView mav=new ModelAndView();
		if(vo!=null) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:/login/login");
			
		}
		
		return mav;
	}
	
	/**
	 * 로그아웃 처리
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout( HttpSession session) {
		log.info("logout 호출 성공");
		
		loginService.logout(session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/");
		//mav.addObject("mag","logout");
		
		return mav;
	}
	
	
	/**
	 * 아이디 찾기
	 */
	@RequestMapping(value = "/ldentityId")
	public String ldentityId(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentityId 호출 성공");
		return "login/ldentityId";
	}
	
	/**
	 * 아이디 찾기 보여주기
	 */
	@RequestMapping(value = "/findId")
	public String findId(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("findId 호출 성공");
		return "login/findId";
	}
	
	/**
	 * 비밀번호 찾기
	 */
	@RequestMapping(value = "/ldentityPwd")
	public String ldentityPwd(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentityPwd 호출 성공");
		return "login/ldentityPwd";
	}
	
	/**
	 * 비밀번호 재설정
	 */
	@RequestMapping(value = "/resetPwd")
	public String resetPwd(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("resetPwd 호출 성공");
		return "login/resetPwd";
	}
	
	
}
