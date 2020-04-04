package com.kplant.admin.order.service;

import java.util.List;
import java.util.Map;

import com.kplant.admin.order.vo.OrderListVO;
import com.kplant.admin.order.vo.PaymentVO;

public interface AdminOrderService {
	// 주문
	public List<Map<String, String>> orderList(OrderListVO olvo);
	public List<Map<String, String>> orderExcelList();
	public Map<String, String> getOrderInfo(OrderListVO olvo);
	public List<Map<String, String>> getOrderPrdInfo(OrderListVO olvo);
	public int orderListCnt(OrderListVO olvo);
	public String orderUpdate(List<OrderListVO> list);
	
	// 결제
	public String getPayNum(OrderListVO olvo);
	public int paymentUpdate(PaymentVO pvo);
}