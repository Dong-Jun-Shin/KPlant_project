package com.kplant.client.join.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	 
	@RequestMapping(value = "/ldentity")
	public String ldentity(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("ldentity 호출 성공");
		return "join/ldentity";
	}*/
	
	
	@RequestMapping(value = "/existingMember")
	public String existingMember() {
		log.info("existingMember 호출 성공");
		return "join/existingMember";
	}
	/**
	 * 기존 회원 여부
	 */
	@ResponseBody
	@RequestMapping(value = "/lookupMember", method =RequestMethod.POST)
	public int lookupMember(@ModelAttribute("data")MemberVO mvo, Model model)  throws Exception{
		log.info("lookupMember 호출 성공");
		
		int result = memberService.lookupMember(mvo);
		return result;
	}
	
	
	
	@GetMapping(value = "/memberJoin")
	public String memberJoin() {
		log.info("memberJoin 호출 성공");
		return "join/memberJoin";
	}
	/**
	 * 회원 정보 입력
	 */
	@RequestMapping(value = "/memberInsert", method =  RequestMethod.POST)
	public String postMemberInsert(MemberVO mvo, Model model) {
		log.info("postMemberInsert 호출 성공");
		
		int result=0;
		String url="";
		
		result=memberService.memberInsert(mvo);
		if(result==1) {
			url="join/complete";
		}
		
		return url;
	}
	
	/**
	 * 회원 아이디 중복 체크
	 */
	@RequestMapping(value = "/memberIdCheck", method =RequestMethod.POST)
	@ResponseBody
	public int memberIdCheck(MemberVO mvo) throws Exception{
		log.info("memberIdCheck 호출 성공");
		
		int result = memberService.memberIdCheck(mvo);
		return result;
	}
	
	/**
	 * 가입 완료
	 */
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String complete(@ModelAttribute("data")MemberVO mvo, Model model) {
		log.info("complete 호출 성공");
		
		log.info("mvo = "+mvo);
	      
	     MemberVO data = memberService.complete(mvo);
	     model.addAttribute("data", data);
		
		return "join/complete";
	}
}
