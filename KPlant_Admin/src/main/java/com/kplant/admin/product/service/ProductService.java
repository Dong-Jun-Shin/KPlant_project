package com.kplant.admin.product.service;

import java.util.List;

import com.kplant.admin.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pbo);
	public int productListCnt(ProductVO pvo);
	public int productInsert(ProductVO pvo) throws Exception;
	public ProductVO productDetail(ProductVO pvo);
	public ProductVO updateForm(ProductVO pvo);
	public int productUpdate(ProductVO pvo) throws Exception;
	public int productDelete(String prd_num) throws Exception;
}
