package com.kplant.admin.member.service;

import java.util.List;
import java.util.Map;

import com.kplant.admin.member.vo.MemberVO;

public interface MemberService{

	List<MemberVO> memberList(MemberVO mvo);

	int memberListCnt(MemberVO mvo);

	MemberVO memberDetail(MemberVO mvo);

	Map<String, Integer> memberGenderList();

	Map<String, Integer> memberAgeList();

}
