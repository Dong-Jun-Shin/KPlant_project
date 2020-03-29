package com.kplant.client.order.vo;

import lombok.Data;

@Data
public class PaymentVO {
	// 결제고유ID 
    private String pay_num;

    // 결제수단 
    private String pay_method;

    // 결제금액 
    private int pay_price;

    // 결제일자 
    private String pay_date;

    // 결제상태 
    private String pay_status;

    // 주문번호 
    private String ord_num;

}
