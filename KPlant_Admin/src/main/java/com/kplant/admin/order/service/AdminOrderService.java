package com.kplant.admin.order.service;

import java.util.List;
import java.util.Map;

import com.kplant.admin.order.vo.OrderListVO;

public interface AdminOrderService {
	public List<Map<String, String>> orderList(OrderListVO olvo);
	public Map<String, String> getOrderInfo(OrderListVO olvo);
	public List<Map<String, String>> getOrderPrdInfo(OrderListVO olvo);
	public int orderListCnt(OrderListVO olvo);
}
