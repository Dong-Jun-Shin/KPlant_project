package com.kplant.client.join.dao;


import com.kplant.client.join.vo.MemberVO;

public interface MemberDAO {
	
	//회원 등록
	public int memberInsert(MemberVO mvo);
	
	//아이디 중복 체크
	public int memberIdCheck(MemberVO mvo);
	
	//가입완료
	public MemberVO complete(MemberVO mvo);
	
	//기존회원 여부
	public int lookupMember(MemberVO mvo);
	
}
