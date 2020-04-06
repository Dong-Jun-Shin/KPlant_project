package com.kplant.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.kplant.admin.member.vo.MemberVO;

public interface MemberDAO {
	
	List<MemberVO> memberList(MemberVO mvo);

	int memberListCnt(MemberVO mvo);

	MemberVO memberDetail(MemberVO mvo);

	Map<String, Integer> memberAgeList();

	Map<String, Integer> memberGenderList();
	
	List<Map<String, String>> memberOrderList(MemberVO mvo);


}
