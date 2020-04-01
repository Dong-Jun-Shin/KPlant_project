package com.kplant.admin.product.vo;

import java.util.ArrayList;
import java.util.List;

import com.kplant.admin.common.vo.CommonVO;

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

}
