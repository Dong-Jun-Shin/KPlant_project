package com.kplant.client.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.login.dao.LoginDAO;

import lombok.Setter;


@Service
public class LoginServiceImpl implements LoginService {
	
	@Setter(onMethod_ =@Autowired)
	private LoginDAO loginDAO;
	
	//로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO mvo, HttpSession session) {
		MemberVO vo = loginDAO.loginCheck(mvo);
		if (vo!=null) {
			session.setAttribute("m_id", mvo.getM_id());
			session.setAttribute("m_name", mvo.getM_name());
		}
		return vo;
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("m_id");
		// 세션 정보를 초기화 시킴
		session.invalidate();

	}

	// 로그인 정보
	@Override
	public MemberVO viewMember(MemberVO mvo) {
		return loginDAO.viewMember(mvo);
	}
}
