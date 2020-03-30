package com.kplant.client.login.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.login.dao.LoginDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class LoginServiceImpl implements LoginService {
	
	@Setter(onMethod_ =@Autowired)
	private LoginDAO loginDAO;
	
	//로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO mvo, HttpSession session) {
		MemberVO vo = loginDAO.loginCheck(mvo);
		if (vo!=null) {
			session.setAttribute("m_num", vo.getM_num());
			session.setAttribute("m_id", vo.getM_id());
			session.setAttribute("m_name", vo.getM_name());
		}
		log.info((int)session.getAttribute("m_num"));
		log.info((String)session.getAttribute("m_id"));
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
	
	//아이디 찾기
	@Override
	public String lookupId(MemberVO mvo) {
		String result =loginDAO.lookupId(mvo);
		return result;
	}
	
	//아이디 보여주기
	/*
	 * @Override public MemberVO findId(MemberVO mvo) { MemberVO data = new
	 * MemberVO(); data = loginDAO.findId(mvo); return data; }
	 */
	
	//비밀번호 찾기(본인인증)
	@Override
	public int lookupPwd(MemberVO mvo) {
		int result =loginDAO.lookupPwd(mvo);
		return result;
	}
	
	//비번수정
	@Override
	public int updatePwd(MemberVO mvo) {
		 int result = 0;
	     result = loginDAO.updatePwd(mvo);
	     return result;

	}
}
