package com.kplant.client.mypage.dao;

import com.kplant.client.join.vo.MemberVO;

public interface MypageDAO {

	// 회원정보 불러오기
	public MemberVO memberData(MemberVO mvo);

	// 회원정보 수정폼
	public int memberUpdate(MemberVO mvo);

	// 회원정보 수정
	public int boardUpdate(MemberVO mvo);

	// 비밀번호 수정
	public int passwordUpdate(MemberVO mvo);

	// 회원 탈퇴
	public int memberWithdrawal(int m_num);
	
	// 비밀번호 인증
	public int confirm(MemberVO mvo);

}
