package com.kplant.client.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.mypage.dao.mypageDAO;

import lombok.Setter;

@Service
public class mypageServiceImpl implements mypageService {

	@Setter(onMethod_ = @Autowired)
	private mypageDAO mypageDao;

	// 회원정보 불러오기
	public MemberVO memberData(MemberVO mvo) {
		MemberVO data = new MemberVO();
		data = mypageDao.memberData(mvo);
		return data;
	}

	// 회원정보 수정폼
	@Override
	public MemberVO updateForm(MemberVO mvo) {
		MemberVO data = new MemberVO();
		data = mypageDao.memberData(mvo);
		return data;
	}

	// 회원정보 수정
	public int memberUpdate(MemberVO mvo) {
		int result = 0;
		result = mypageDao.memberUpdate(mvo);
		return result;
	}

	// 비밀번호 수정
	public int passwordUpdate(MemberVO mvo) {
		int result = 0;
		result = mypageDao.passwordUpdate(mvo);
		return result;
	}
	
	//회원탈퇴
	public int memberWithdrawal(int m_num) {
		int result = 0;
		result = mypageDao.memberWithdrawal(m_num);
		return result;
	}
	
	//비밀번호 확인
	public int confirm(MemberVO mvo) {
		int result = 0;
		result = mypageDao.confirm(mvo);
		return result;
	}

}
