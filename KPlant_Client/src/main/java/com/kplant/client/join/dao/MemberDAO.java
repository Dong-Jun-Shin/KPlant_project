package com.kplant.client.join.dao;

import com.kplant.client.join.vo.MemberVO;

public interface MemberDAO {

	//아이디 중복 체크
	public MemberVO memberIdCheck(String m_id) throws Exception;
}
