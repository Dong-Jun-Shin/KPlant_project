package com.kplant.admin.order.vo;

import com.kplant.admin.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class OrderListVO extends CommonVO{
	 // 주문번호 
    private String ord_num;

    // 주문날짜 
    private String ord_date;

    // 주문자명 
    private String ord_name;

    // 주문자 전화번호 
    private String ord_phone;

    // 주문자 이메일 
    private String ord_email;

    // 주문상태 
    private String ord_status;

    // 운송장번호 
    private String ord_trn;

    // 회원번호 
    private int m_num;
}
