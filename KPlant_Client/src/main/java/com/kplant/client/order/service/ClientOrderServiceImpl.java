package com.kplant.client.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.common.util.DataUtil;
import com.kplant.client.order.dao.ClientOrderDAO;
import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.order.vo.OrderListVO;
import com.kplant.client.order.vo.OrderVO;
import com.kplant.client.order.vo.PaymentVO;
import com.kplant.client.order.vo.ShippingVO;

import lombok.Setter;

@Service
public class ClientOrderServiceImpl implements ClientOrderService{

	@Setter(onMethod_ = @Autowired)
	private ClientOrderDAO odao;

	@Override
	public String getOrderNum() {
		return odao.getOrderNum();
	}
	
	@Override
	public int orderInsert(OrderVO ovo) {
		OrderListVO olvo = ovo.getOlvo();
		List<OrderDetailVO> odvo = ovo.getOdvo();
		ShippingVO shvo = ovo.getShvo();
		PaymentVO pvo = ovo.getPvo();
		
		int result = 1;

		//주문번호 부여
		shvo.setOrd_num(olvo.getOrd_num());
		pvo.setOrd_num(olvo.getOrd_num());
		//Unix Timestamp를 날짜 String으로 변환
		pvo.setPay_date(DataUtil.getTimestampToDate(pvo.getPay_date()));
		
		//orderList 레코드 Insert
		result = odao.orderListInsert(olvo); 
		if(result == 0) return result;
		
		//shipping 레코드 Insert
		result = odao.shippingInsert(shvo); 
		if(result == 0) return result;
		
		//payment 레코드 Insert (Unix Timestamp -> date로 변환)
		result = odao.paymentInsert(pvo); 
		if(result == 0) return result;
		
		//orderDetail 레코드 Insert
		for (OrderDetailVO vo : odvo) {
			result = odao.orderDetailInsert(vo); 
			if(result == 0) return result;
		}
		
		return result;
	}
}
