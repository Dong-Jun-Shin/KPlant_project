package com.kplant.client.product.vo;

import java.util.ArrayList;
import java.util.List;

import com.kplant.client.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductVO extends CommonVO {

	private String prd_num = ""; // 상품번호
	private String prd_name = ""; // 상품명
	private int prd_price = 0; // 상품단가
	private String prd_type = ""; // 상품종류
	private int prd_qty = 0; // 재고수량
	private String prd_date = ""; // 등록날짜

	/*
	 * private ImageVO image;
	 * 
	 * public MultipleBoardVO() { image = new ImageVO(); }
	 */

	private List<ProductImageVO> images;

	public ProductVO() {
		images = new ArrayList<ProductImageVO>();
	}

    
    
    // 이미지 번호 
    private String img_num;

    // 상품 이미지 
    private String img_prd;
    
    // 상품 상세 이미지 
    private String img_prd2;

    // 상세 이미지 
    private String img_spec;
}
