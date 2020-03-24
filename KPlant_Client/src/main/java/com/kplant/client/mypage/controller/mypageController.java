package com.kplant.client.mypage.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/mypage/*")
@Log4j
@AllArgsConstructor
public class mypageController {
	@GetMapping("/mypage")
	public String mypage(Locale locale, Model model) {
		log.info("mypage 호출 성공");
		
		return "mypage/mypage";
	}
	
	@GetMapping("/updateForm")
	public String updateForm(Locale locale, Model model) {
		log.info("updateForm 호출 성공");
		
		return "mypage/updateForm";
	}
	
	@GetMapping("/orderDetails")
	public String orderDetails(Locale locale, Model model) {
		log.info("orderDetails 호출 성공");
		
		return "mypage/orderDetails";
	}
	
	@GetMapping("/passwordConfirm")
	public String passwordConfirm(Locale locale, Model model) {
		log.info("passwordConfirm 호출 성공");
		
		return "mypage/passwordConfirm";
	}
	
	@GetMapping("/passwordUpdate")
	public String passwordUpdate(Locale locale, Model model) {
		log.info("passwordUpdate 호출 성공");
		
		return "mypage/passwordUpdate";
	}
	
	@GetMapping("/wishList")
	public String wishList(Locale locale, Model model) {
		log.info("wishList 호출 성공");
		
		return "mypage/wishList";
	}
	
	@GetMapping("/withdrawal")
	public String withdrawal(Locale locale, Model model) {
		log.info("withdrawal 호출 성공");
		
		return "mypage/withdrawal";
	}
<<<<<<< Updated upstream
=======
	@GetMapping("/cancel")
	public String cancelList(Locale locale, Model model) {
		log.info("cancel 호출 성공");
		
		return "mypage/cancel";
	}
>>>>>>> Stashed changes
	
}
