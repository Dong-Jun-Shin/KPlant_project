package com.kplant.client.login.service;

import javax.servlet.http.HttpSession;

import com.kplant.client.join.vo.MemberVO;

public interface LoginService {
	// 로그인 체크
	public MemberVO loginCheck(MemberVO mvo, HttpSession session);

	// 로그인 정보
	public MemberVO viewMember(MemberVO vo);

	// 로그아웃
	public void logout(HttpSession session);
	
}
