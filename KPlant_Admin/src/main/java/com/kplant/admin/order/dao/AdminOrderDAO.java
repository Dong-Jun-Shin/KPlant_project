package com.kplant.admin.order.dao;

import java.util.List;
import java.util.Map;

import com.kplant.admin.order.vo.OrderCancelVO;
import com.kplant.admin.order.vo.OrderListVO;
import com.kplant.admin.order.vo.PaymentVO;

public interface AdminOrderDAO {
	public List<Map<String, String>> orderList(OrderListVO olvo);
	public List<Map<String, String>> orderExcelList();
	public Map<String, String> getOrderInfo(OrderListVO olvo);
	public List<Map<String, String>> getOrderPrdInfo(OrderListVO olvo);
	public int orderListCnt(OrderListVO olvo);
	public int orderUpdate(OrderListVO olvo);
	public String getPayNum(OrderListVO olvo);
	public int paymentUpdate(PaymentVO pvo);
	public int cancelInsert(OrderCancelVO ocvo);
}
