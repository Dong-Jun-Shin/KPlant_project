package com.kplant.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.product.dao.ProductDao;
import com.kplant.client.product.vo.ProductVO;

import lombok.Setter;
@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_=@Autowired)
	private ProductDao productDao;
	
	
	@Override
	public List<ProductVO> productList(ProductVO pvo){
		List<ProductVO> list = null;
		list = productDao.productList(pvo);
		return list;
	}
	
	
}