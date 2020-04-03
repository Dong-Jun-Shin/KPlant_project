package com.kplant.client.product.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kplant.client.product.vo.ProductVO;

public interface ProductService {

	public ProductVO productDetail(ProductVO pvo);

	List<ProductVO> productList(ProductVO pvo, HttpSession session);
}
