package com.kplant.admin.order.dao;

import java.util.List;

import com.kplant.admin.order.vo.OrderListVO;

public interface AdminOrderDAO {
	public List<OrderListVO> orderList(OrderListVO olvo);
}
