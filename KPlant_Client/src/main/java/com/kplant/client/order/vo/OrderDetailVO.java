package com.kplant.client.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	 // 주문번호 
    private String ord_num;

    // 상품수량 
    private int ord_qty;

    // 상품번호 
    private String prd_num;
}
