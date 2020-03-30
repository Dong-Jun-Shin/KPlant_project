package com.kplant.client.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	 * 아이디 찾기(본인인증)
	 */
	@RequestMapping(value = "/ldentityId")
	public String ldentityId(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentityId 호출 성공");
		return "login/ldentityId";
	}
	
	//@ResponseBody
	@RequestMapping(value = "/lookupId", method =RequestMethod.POST)
	public String lookupId(@ModelAttribute("data") MemberVO mvo, Model model)  throws Exception{
		log.info("lookupId 호출 성공");
		String url ="";
		String result = loginService.lookupId(mvo);
		if(result != null) {
			 model.addAttribute("memberId", result);
			url="login/findId";
		}else {
			url="login/ldentityId";
		}
		
		return url;
	}
	
	
	
	/**
	 * 아이디 찾기 보여주기
	 
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("findId 호출 성공");
		
		log.info("mvo = "+mvo);
	      
	     MemberVO data = loginService.findId(mvo);
	     model.addAttribute("data", data);
		
		return "login/findId";
	}*/
	
	/**
	 * 비밀번호 찾기
	 */
	@RequestMapping(value = "/ldentityPwd")
	public String ldentityPwd(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentityPwd 호출 성공");
		return "login/ldentityPwd";
	}
	@ResponseBody
	@RequestMapping(value = "/lookupPwd", method =RequestMethod.POST)
	public int lookupPwd(MemberVO mvo, Model model)  throws Exception{
		log.info("lookupPwd 호출 성공");
		
		int result = loginService.lookupPwd(mvo);
		return result;
	}
	
	/**
	 * 비밀번호 재설정
	 */
	@RequestMapping(value = "/resetPwd")
	public String resetPwd(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("resetPwd 호출 성공");
		return "login/resetPwd";
	}
	/**
	 * 비밀번호 수정
	 */
	 @RequestMapping(value = "updatePwd", method = RequestMethod.POST)
     public String updatePwd(@ModelAttribute MemberVO mvo) {// , RedirectAttributes ras
        log.info("updatePwd 호출성공");
        log.info("mvo = "+mvo);
        int result = 0;
        String url = "";
        
        result = loginService.updatePwd(mvo);
        // ras.addFlashAttribute("data", bvo);

        if (result == 1) {
           // 아래 url은 수정후 상세 페이지로 이동
           url = "/login/login";        //mvo.getM_num();
        } else {
           url = "/login/resetPwd";  //mvo.getM_num();
        }

        return "redirect:" + url;

     }

	
	
}
