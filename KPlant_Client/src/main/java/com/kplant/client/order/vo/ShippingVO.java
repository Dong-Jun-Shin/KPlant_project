package com.kplant.client.order.vo;

import lombok.Data;

@Data
public class ShippingVO {
	// 주문번호 
    private String ord_num;

    // 배송 요청사항 
    private String sh_request;

    // 수신인 
    private String sh_name;

    // 수신인 거주지역 
    private String sh_residence;

    // 수신인 전화번호 
    private String sh_phone;
}
