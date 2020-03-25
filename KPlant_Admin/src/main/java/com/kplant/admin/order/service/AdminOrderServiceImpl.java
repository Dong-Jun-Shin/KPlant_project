package com.kplant.admin.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kplant.admin.order.dao.AdminOrderDAO;
import com.kplant.admin.order.vo.OrderListVO;

import lombok.Setter;

@Service
public class AdminOrderServiceImpl implements AdminOrderService{
	
	@Setter(onMethod_ = @Autowired)
	private AdminOrderDAO odao;
	
	@Override
	public List<OrderListVO> orderList(OrderListVO olvo) {
		List<OrderListVO> orderList = null;
//		orderList = odao.borderList(olvo);
		
		return orderList;
	}

}
