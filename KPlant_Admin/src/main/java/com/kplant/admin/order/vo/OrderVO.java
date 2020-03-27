package com.kplant.admin.order.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderVO {
	private OrderListVO olvo;
	private List<OrderDetailVO> odvo;
	private ShippingVO shvo;
	private PaymentVO pvo;
}
