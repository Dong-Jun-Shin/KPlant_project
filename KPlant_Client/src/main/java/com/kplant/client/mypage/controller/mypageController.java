package com.kplant.client.mypage.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.mypage.service.mypageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/mypage/*")
@Log4j
@AllArgsConstructor
public class mypageController {
	
	private mypageService mypageService;
	
	//회원정보 불러오기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	//@GetMapping("/mypage")
	public String memberData(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("memberData 호출 성공");
		log.info("mvo = "+mvo);
		
		MemberVO data = mypageService.memberData(mvo);
		model.addAttribute("data", data);
		return "mypage/mypage";
	}
	
	//회원정보 수정폼
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	//@GetMapping("/updateForm")
	public String updateForm(@ModelAttribute("data") MemberVO mvo, Model model) {
		log.info("updateForm 호출 성공");
		MemberVO updateData = mypageService.updateForm(mvo);
		model.addAttribute("updateData", updateData);
		return "mypage/updateForm";
	}
	
	//회원정보 수정하기
	@RequestMapping(value = "memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO mvo) {// , RedirectAttributes ras
		log.info("memberUpdate 호출성공");

		int result = 0;
		String url = "";

		result = mypageService.memberUpdate(mvo);
		// ras.addFlashAttribute("data", bvo);

		if (result == 1) {
			// 아래 url은 수정후 상세 페이지로 이동
			url = "/mypage/";        //mvo.getM_num();
		} else {
			url = "/mypage/updateForm";  //mvo.getM_num();
		}

		return "redirect:" + url;

	}
	

	//비밀번호 수정 폼
	@GetMapping("/passwordUpdateForm")
	public String passwordUpdateForm(Locale locale, MemberVO mvo, Model model) {
		log.info("passwordUpdateForm 호출 성공");
		MemberVO updateData = mypageService.updateForm(mvo);
		model.addAttribute("updateData", updateData);
		return "mypage/passwordUpdateForm";
	}
	
	//비밀번호 수정하기
		@RequestMapping(value = "passwordUpdate", method = RequestMethod.POST)
		public String passwordUpdate(@ModelAttribute MemberVO mvo) {// , RedirectAttributes ras
			log.info("passwordUpdate 호출성공");
			//log.info("mvo = "+mvo);
			int result = 0;
			String url = "";
			

			result = mypageService.passwordUpdate(mvo);
			// ras.addFlashAttribute("data", bvo);

			if (result == 1) {
				// 아래 url은 수정후 상세 페이지로 이동
				url = "/mypage/";        //mvo.getM_num();
			} else {
				url = "/mypage/passwordUpdateForm";  //mvo.getM_num();
			}

			return "redirect:" + url;

		}
	
	@GetMapping("/orderDetails")
	public String orderDetails(Locale locale, Model model) {
		log.info("orderDetails 호출 성공");
		
		return "mypage/orderDetails";
	}
	
	//비밀번호 확인페이지
	@RequestMapping(value = "/passwordConfirm", method = RequestMethod.POST)
	public String passwordConfirm(Locale locale, Model model, MemberVO mvo) {
		log.info("passwordConfirm 호출 성공");
		MemberVO updateData = mypageService.updateForm(mvo);
		model.addAttribute("updateData", updateData);
		return "mypage/passwordConfirm";
	}
	
	//비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "/confirm", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String confirm(MemberVO mvo) {
		log.info("confirm 호출 성공");
		String value = "";

		// 아래변수에는 입력 성공레 대한 상태값 저장(1 or 0)
		int result = mypageService.confirm(mvo);
		if (result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		log.info("result= " + result);

		return value;
	}
	
	
	
	
	@GetMapping("/wishList")
	public String wishList(Locale locale, Model model) {
		log.info("wishList 호출 성공");
		
		return "mypage/wishList";
	}
	
	//회원 탈퇴화면
	@GetMapping("/withdrawal")
	public String withdrawal(Locale locale, Model model, MemberVO mvo) {
		log.info("withdrawal 호출 성공");
		MemberVO updateData = mypageService.updateForm(mvo);
		model.addAttribute("updateData", updateData);
		return "mypage/withdrawal";
	}
	
	//회원 탈퇴기능
	@RequestMapping(value = "/memberWithdrawal", method = RequestMethod.POST)
	public String memberWithdrawal(@ModelAttribute MemberVO mvo) {// , RedirectAttributes ras
		log.info("memberWithdrawal 호출성공");
		//log.info("mvo = "+mvo);
		int result = 0;
		String url = "";
		

		result = mypageService.memberWithdrawal(mvo.getM_num());
		if (result == 1) {
			// 아래 url은 수정후 상세 페이지로 이동
			url = "/";        //mvo.getM_num();
		} else {
			url = "/mypage/withdrawal";  //mvo.getM_num();
		}

		return "redirect:" + url;

	}
	
	
	@GetMapping("/cancel")
	public String cancelList(Locale locale, Model model) {
		
		return "mypage/cancel";
	}

}
