package com.kplant.client.product.vo;

import lombok.Data;

@Data
public class ProductVO {
	// 상품번호 
    private String prd_num;

    // 상품명 
    private String prd_name;

    // 상품단가 
    private int prd_price;

    // 상품종류 
    private String prd_type;

    // 재고수량 
    private int prd_qty;

    // 등록날짜 
    private String prd_date;
    
    // 이미지 번호 
    private String img_num;

    // 상품 이미지 
    private String img_prd;

    // 상세 이미지 
    private String img_spec;
}
