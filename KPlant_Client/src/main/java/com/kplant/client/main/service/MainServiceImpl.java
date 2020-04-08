package com.kplant.client.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.event.dao.EventDAO;
import com.kplant.client.event.vo.EventVO;
import com.kplant.client.product.dao.ProductDao;
import com.kplant.client.product.vo.ProductVO;

import lombok.Setter;

@Service
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_=@Autowired)
	private EventDAO eventDAO;
	
	@Setter(onMethod_=@Autowired)
	private ProductDao productDAO;
	
	@Override
	public List<EventVO> eventList(EventVO evo) {
		List<EventVO> list = null;
		list = eventDAO.eventList(evo);
		
		return list;
	}

	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDAO.productList(pvo); 
		
		return list;
	}

	@Override
	public List<ProductVO> productList1(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDAO.productList2(pvo);
		return list;
	}

	@Override
	public int eventListCnt(EventVO evo) {
		return eventDAO.eventListCnt(evo);
	}

}
