package com.kplant.admin.order.service;

import java.util.List;

import com.kplant.admin.order.vo.OrderListVO;

public interface AdminOrderService {
	public List<OrderListVO> orderList(OrderListVO olvo);
}
