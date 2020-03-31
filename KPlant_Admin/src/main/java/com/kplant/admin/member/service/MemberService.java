package com.kplant.admin.member.service;

import java.util.List;

import com.kplant.admin.member.vo.MemberVO;

public interface MemberService{

	List<MemberVO> memberList(MemberVO mvo);

	int memberListCnt(MemberVO mvo);

	MemberVO memberDetail(MemberVO mvo);

}
