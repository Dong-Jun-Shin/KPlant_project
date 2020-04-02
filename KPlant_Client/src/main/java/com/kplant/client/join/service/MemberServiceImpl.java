package com.kplant.client.join.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kplant.client.join.dao.MemberDAO;
import com.kplant.client.join.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	MemberDAO memberDAO;
	
	//회원 등록
	@Override
	public int memberInsert(MemberVO mvo) {
		int result=0;
		result=memberDAO.memberInsert(mvo);
		return result;
	}
	
	//아이디 중복 체크
	@Override
	public int memberIdCheck(MemberVO mvo) {
		int result =memberDAO.memberIdCheck(mvo);
		return result;
	}
	
	//가입완료
	@Override
	public MemberVO complete(MemberVO mvo) {
		MemberVO data = new MemberVO();
	    data = memberDAO.complete(mvo);
	    return data;
	}
	
	//기존회원
	@Override
	public int lookupMember(MemberVO mvo) {
		int result =memberDAO.lookupMember(mvo);
		return result;
	}
	
}
