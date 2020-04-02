package com.kplant.admin.member.vo;

import com.kplant.admin.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MemberVO extends CommonVO{
	private int m_num; //회원 번호
	private String m_name;//회원 이름
	private String m_gender;//회원 성별
	private String m_residence;//회원 거주지역 
	private String m_phone;//회원 전화번호
	private String m_eMail;//회원 이메일
	private String m_birth;//회원 생년월일
	private String m_id;//회원 아이디
	private String m_pwd;//회원 비밀번호
	private String m_dormancy;//회원 휴면 계정
	private String m_date;//회원 등록일
	private String m_update;//회원 수정일
	private String ord_num;//주문 번호
}
