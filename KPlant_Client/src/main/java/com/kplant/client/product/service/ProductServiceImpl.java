package com.kplant.client.product.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.product.dao.ProductDao;
import com.kplant.client.product.vo.ProductVO;

import lombok.Setter;
@Service
public class ProductServiceImpl implements ProductService {
	
		private ProductDao productDao;
	
		@Override
		public List<ProductVO> productList(ProductVO pvo, HttpSession session){
		   List<ProductVO> list = null;
		   list = productDao.productList(pvo);
		   session.setAttribute("prd_num", pvo.getPrd_num());
		   return list;
		}


	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO data = new ProductVO();
		data = productDao.productDetail(pvo);
		return data;
	}
	
	
}