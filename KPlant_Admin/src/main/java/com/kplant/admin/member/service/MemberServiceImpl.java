package com.kplant.admin.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.member.dao.MemberDAO;
import com.kplant.admin.member.vo.MemberVO;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO>memberList=null;
		memberList = memberDAO.memberList(mvo);
		
		return memberList;
	}

	@Override
	public int memberListCnt(MemberVO mvo) {
		int countNum=0;
		countNum=memberDAO.memberListCnt(mvo);
		return countNum;
	}

	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		MemberVO detail=null;
		detail=memberDAO.memberDetail(mvo);
		if(detail!=null) {
			detail.setM_id(detail.getM_id().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
	

	@Override
	public Map<String, Integer> memberAgeList() {
		Map<String, Integer> ageList = null;
		ageList = memberDAO.memberAgeList();
		return ageList;
	}

	@Override
	public Map<String, Integer> memberGenderList() {
		Map<String, Integer> genderList = null;
		genderList = memberDAO.memberGenderList();
		return genderList;
	}

	@Override
	public List<Map<String, String>> memberOrderList(MemberVO mvo) {
		List<Map<String, String>> memberOrderList = null;
		memberOrderList = memberDAO.memberOrderList(mvo);
		return memberOrderList;
	}



}
