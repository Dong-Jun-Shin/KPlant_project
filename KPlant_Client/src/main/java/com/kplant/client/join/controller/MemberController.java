package com.kplant.client.join.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kplant.client.join.service.MemberService;
import com.kplant.client.join.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value ="/join/*" )
@Log4j
@AllArgsConstructor
public class MemberController {
	
	
	private MemberService memberService;
	
	/**
	 * 회원 약관 동의
	 */
	@RequestMapping(value = "/memberAgree")
	public String memberAgree(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("memberAgree 호출 성공");
		return "join/memberAgree";
	}
	
	/**
	 * 본인 인증
	 */
	@RequestMapping(value = "/ldentity")
	public String ldentity(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentity 호출 성공");
		return "join/ldentity";
	}
	
	/**
	 * 기존 회원 여부
	 */
	@RequestMapping(value = "/existingMember")
	public String existingMember(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("existingMember 호출 성공");
		return "join/existingMember";
	}
	
	/**
	 * 회원 정보 입력
	 */
	@RequestMapping(value = "/memberInsert")
	public String memberInsert(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("memberInsert 호출 성공");
		return "join/memberInsert";
	}
	
	/**
	 * 회원 아이디 중복 체크
	 */
	@RequestMapping(value = "/memberIdCheck", method =RequestMethod.POST)
	@ResponseBody
	public int memberIdCheck(HttpServletRequest req) throws Exception{
		log.info("memberIdCheck 호출 성공");
		
		String m_id = req.getParameter("m_id");
		MemberVO memberIdCheck=MemberService.memberIdCheck(m_id);
		
		int result=0;
		
		if(m_id !=null) {
			result=1;
		}
		return result;
	}
	
	/**
	 * 가입 완료
	 */
	@RequestMapping(value = "/complete")
	public String complete(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("complete 호출 성공");
		return "join/complete";
	}
}
