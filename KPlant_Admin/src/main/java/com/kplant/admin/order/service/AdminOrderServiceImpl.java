package com.kplant.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.order.dao.AdminOrderDAO;
import com.kplant.admin.order.vo.OrderListVO;

import lombok.Setter;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{
	@Setter(onMethod_ = @Autowired)
	private AdminOrderDAO odao;
	
	@Override
	public List<Map<String, String>> orderList(OrderListVO olvo) {
		
		return odao.orderList(olvo);
	}

	@Override
	public Map<String, String> getOrderInfo(OrderListVO olvo) {
		return odao.getOrderInfo(olvo);
	}

	@Override
	public List<Map<String, String>> getOrderPrdInfo(OrderListVO olvo) {
		return odao.getOrderPrdInfo(olvo);
	}
	
	@Override
	public int orderListCnt(OrderListVO olvo) {
		return odao.orderListCnt(olvo);
	}
}
