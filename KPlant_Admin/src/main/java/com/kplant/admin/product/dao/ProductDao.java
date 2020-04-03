package com.kplant.admin.product.dao;

import java.util.List;

import com.kplant.admin.product.vo.ProductVO;

public interface ProductDao {
	public List<ProductVO> productList(ProductVO pvo);
	public int productListCnt(ProductVO pvo);
	public int productNumber();
	public int productInsert(ProductVO pvo);
	public ProductVO productDetail(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public int productDelete(String prd_num);
}
