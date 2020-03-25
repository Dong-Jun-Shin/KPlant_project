package com.kplant.client.login.dao;

import javax.servlet.http.HttpSession;

import com.kplant.client.join.vo.MemberVO;

public interface LoginDAO {
	//로그인 체크
	public MemberVO loginCheck(MemberVO mvo);

	// 회원 정보
	public MemberVO viewMember(MemberVO mvo);

	// 로그아웃
	public void logout(HttpSession session);
}
