package com.kplant.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kplant.admin.common.vo.PageDTO;
import com.kplant.admin.member.service.MemberService;
import com.kplant.admin.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	/**
	 * 글목록 구현하기(페이징 처리 목록 조회)
	 */
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String memberAdminList(MemberVO mvo, Model model) {
	      log.info("memberAdminList 호출 성공");
	      
		// 전체 레코드 조회 
	      List<MemberVO> memberList =memberService.memberList(mvo);
		  model.addAttribute("memberList", memberList);
		 
		// 전체 레코드수 구현
		int total = memberService.memberListCnt(mvo);
		model.addAttribute("pageMaker", new PageDTO(total, mvo));
		
	     return "member/memberList";
	}
	
	/**
	 * 글 상세 보기 구현
	 */
	@RequestMapping(value = "/memberDetail",method = RequestMethod.GET)
	//@GetMapping("/memberDetail")
	public String memberDetail(@ModelAttribute("data") MemberVO mvo,Model model) {
		log.info("memberDetail 호출 성공");
		log.info("mvo = "+mvo);
		
		MemberVO detail=memberService.memberDetail(mvo);
		model.addAttribute("detail",detail);
		
		return "member/memberDetail";
	}
	
}
