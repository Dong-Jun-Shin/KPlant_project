package com.kplant.admin.login.service;

import javax.servlet.http.HttpSession;

import com.kplant.admin.member.vo.MemberVO;

public interface LoginService {

	MemberVO loginCheck(MemberVO mvo, HttpSession session);

	MemberVO viewMember(MemberVO mvo);

	void logout(HttpSession session);

}
