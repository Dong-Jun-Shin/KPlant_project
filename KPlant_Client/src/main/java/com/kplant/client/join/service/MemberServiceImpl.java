package com.kplant.client.join.service;

import org.springframework.stereotype.Service;

import com.kplant.client.join.dao.MemberDAO;
import com.kplant.client.join.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	MemberDAO dao;
	//아이디 중복 채크
	public MemberVO memberIdCheck(String m_id) throws Exception {
		return dao.memberIdCheck(m_id);
	}
	

	
}
