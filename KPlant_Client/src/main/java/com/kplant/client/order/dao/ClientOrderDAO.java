package com.kplant.client.order.dao;

import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.order.vo.OrderListVO;
import com.kplant.client.order.vo.PaymentVO;
import com.kplant.client.order.vo.ShippingVO;

public interface ClientOrderDAO {
	public String getOrderNum();
	public int orderListInsert(OrderListVO ovo);
	public int orderDetailInsert(OrderDetailVO odvo);
	public int shippingInsert(ShippingVO shvo);
	public int paymentInsert(PaymentVO pvo);
}
