package com.kplant.client.product.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.product.dao.ProductDao;
import com.kplant.client.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ =@Autowired )
	private ProductDao productDao;
	

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO data = new ProductVO();
		data = productDao.productDetail(pvo);
		return data;
	}
	
	@Override
	public List<ProductVO> productList(ProductVO pvo, HttpSession session){
		List<ProductVO> list = null;
		list = productDao.productList(pvo);
		log.info(list.size());
		return list;
	}
	
	
}