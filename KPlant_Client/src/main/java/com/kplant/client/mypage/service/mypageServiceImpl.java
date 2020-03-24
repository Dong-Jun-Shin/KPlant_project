package com.kplant.client.mypage.service;

import java.awt.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kplant.client.mypage.dao.mypageDAO;

import lombok.Setter;

public class mypageServiceImpl implements mypageService {
	@Setter(onMethod_ = @Autowired)
	private mypageDAO mypageDao;

	// 회원 정보 불러오기
	/*
	 * public MemberVO mypage(MemberVO mvo) { return null; }
	 * 
	 * // 회원 정보 수정 public int updateForm(MemberVO mvo) { return 0; }
	 * 
	 * // 주문/배송내역 public int orderDetails(MemberVO mvo) { return 0; }
	 * 
	 * // 회원정보 수정 public int passwordUpdate(MemberVO mvo) { return 0; }
	 * 
	 * // 찜한제품 public int wishList(MemberVO mvo) { return 0; }
	 * 
	 * // 회원 탈퇴 public int withdrawal(MemberVO mvo) { return 0; }
	 * 
	 * // 취소/환불 내역 public int cancelList(MemberVO mvo) { return 0; }
	 */

}
