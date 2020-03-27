package com.kplant.client.order.service;

import com.kplant.client.order.vo.OrderVO;

public interface ClientOrderService {
	public String getOrderNum();
	public int orderInsert(OrderVO ovo);
}
