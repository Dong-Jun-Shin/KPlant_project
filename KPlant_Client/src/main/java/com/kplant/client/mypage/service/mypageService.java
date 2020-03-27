package com.kplant.client.mypage.service;



import com.kplant.client.join.vo.MemberVO;

public interface mypageService {
	
	 // 회원정보 불러오기 
	public MemberVO memberData(MemberVO mvo);
	
	// 회원정보 수정폼
	public MemberVO updateForm(MemberVO mvo);
	
	// 회원정보 수정하기
	public int memberUpdate(MemberVO mvo);
	
	// 비밀번호 수정하기
	public int passwordUpdate(MemberVO mvo);
	
	// 회원탈퇴
	public int memberWithdrawal(int m_num);
	
	//비밀번호 확인
	public int confirm(MemberVO mvo);;
	

	
	 
	

}
