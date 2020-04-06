package com.kplant.client.product.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.join.vo.MemberVO;
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
	
	@Override
	public List<ProductVO> productList2(ProductVO pvo, HttpSession session){
		List<ProductVO> list = null;
		list = productDao.productList2(pvo);
		session.setAttribute("prd_num", pvo.getPrd_num());
		return list;
	}
	
	@Override
	public List<ProductVO> productList3(ProductVO pvo, HttpSession session){
		List<ProductVO> list = null;
		list = productDao.productList3(pvo);
		session.setAttribute("prd_num", pvo.getPrd_num());
		return list;
	}
	
	@Override
	public List<ProductVO> productList4(ProductVO pvo, HttpSession session){
		List<ProductVO> list = null;
		list = productDao.productList4(pvo);
		session.setAttribute("prd_num", pvo.getPrd_num());
		return list;
	}
	
	@Override
	public List<ProductVO> productList5(ProductVO pvo, HttpSession session){
		List<ProductVO> list = null;
		list = productDao.productList5(pvo);
		session.setAttribute("prd_num", pvo.getPrd_num());
		return list;
	}

	@Override
	public ProductVO cartCheck(ProductVO pvo, HttpSession session) {
		ProductVO vo = productDao.cartCheck(pvo);
		if (vo!=null) {
			session.setAttribute("prd_num", vo.getPrd_num());
			session.setAttribute("prd_price", vo.getPrd_price());
		}
		return vo;
	}
	
	
	
	
}