package com.kplant.admin.member.service;

import java.util.List;

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

}
