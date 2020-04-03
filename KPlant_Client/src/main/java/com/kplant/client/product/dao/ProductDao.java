package com.kplant.client.product.dao;


import java.util.List;

import com.kplant.client.product.vo.ProductVO;

public interface ProductDao {
	public List<ProductVO> productList(ProductVO pvo);
}
