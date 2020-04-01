package com.kplant.admin.login.dao;

import com.kplant.admin.member.vo.MemberVO;

public interface LoginDAO {

	MemberVO loginCheck(MemberVO mvo);

	MemberVO viewMember(MemberVO mvo);

}
