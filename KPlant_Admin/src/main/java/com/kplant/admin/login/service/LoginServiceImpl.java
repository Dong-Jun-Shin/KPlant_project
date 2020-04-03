package com.kplant.admin.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.login.dao.LoginDAO;
import com.kplant.admin.login.vo.AdminVO;

import lombok.Setter;
//import lombok.extern.log4j.Log4j;

//@Log4j
@Service
public class LoginServiceImpl implements LoginService{

	@Setter(onMethod_ =@Autowired)
	private LoginDAO loginDAO;
	
	@Override
	public AdminVO loginCheck(AdminVO avo, HttpSession session) {
		AdminVO vo = loginDAO.loginCheck(avo);
		if (vo!=null) {
			session.setAttribute("a_num", vo.getA_num());
			session.setAttribute("a_id", vo.getA_id());
			session.setAttribute("a_name", vo.getA_name());
			
			/*
			 * log.info((int)session.getAttribute("m_num"));
			 * log.info((String)session.getAttribute("m_id"));
			 */
		}
		
		return vo;
	}
	

	/* 로그아웃*/
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("m_id");
		// 세션 정보를 초기화 시킴
		session.invalidate();

	}

	/* 로그인 정보*/
	@Override
	public AdminVO viewMember(AdminVO avo) {
		return loginDAO.viewMember(avo);
	}

}
