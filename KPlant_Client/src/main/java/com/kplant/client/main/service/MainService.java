package com.kplant.client.main.service;

import java.util.List;

import com.kplant.client.event.vo.EventVO;
import com.kplant.client.product.vo.ProductVO;

public interface MainService {

	List<EventVO> eventList(EventVO evo);

	List<ProductVO> productList(ProductVO pvo);

	List<ProductVO> productList1(ProductVO pvo);

	int eventListCnt(EventVO evo);
}
