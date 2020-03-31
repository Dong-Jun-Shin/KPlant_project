package com.kplant.admin.order.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kplant.admin.order.vo.OrderCancelVO;
import com.kplant.admin.order.vo.OrderListVO;
import com.kplant.admin.order.vo.PaymentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	@Setter(onMethod_ = @Autowired)
	private AdminOrderDAO odao;
	
	@Test
	public void testOrderList() {
		OrderListVO olvo = new OrderListVO();
		log.info(odao.orderList(olvo));
	}
	
	@Test
	public void testOrderExcelList() {
		log.info(odao.orderExcelList());
	}
	
	@Test
	public void testGetOrderInfo() {
		OrderListVO olvo = new OrderListVO();
		olvo.setOrd_num("OR2003270002");
		log.info(odao.getOrderInfo(olvo));
	}
	
	@Test
	public void testGetOrderPrdInfo() {
		OrderListVO olvo = new OrderListVO();
		olvo.setOrd_num("OR2003270002");
		log.info(odao.getOrderPrdInfo(olvo));
	}
	
	@Test
	public void testOrderListCnt() {
		OrderListVO olvo = new OrderListVO();
		log.info(odao.orderListCnt(olvo));
	}
	
	@Test
	public void testOrderUpdate() {
		OrderListVO olvo = new OrderListVO();
		olvo.setOrd_num("OR2003270002");
		olvo.setOrd_status("배송준비중");
		olvo.setOrd_trn("629538399290");
		
		log.info(odao.orderUpdate(olvo));
	}
	
	@Test
	public void testGetPayNum() {
		OrderListVO olvo = new OrderListVO();
		olvo.setOrd_num("OR2003290002");
		
		log.info(odao.getPayNum(olvo));
	}
	
	@Test
	public void testPaymentUpdate() {
		PaymentVO pvo = new PaymentVO();
		pvo.setPay_num("imp_326276410049");
		pvo.setPay_date("20/03/28");
		pvo.setPay_status("결제취소");
		
		log.info(odao.paymentUpdate(pvo));
	}

	@Test
	public void testCancelInsert() {
		OrderCancelVO ocvo = new OrderCancelVO();
		ocvo.setOrd_num("OR1912310002");
		ocvo.setOdc_cause("업체 사정으로 인한 취소");

		log.info(odao.cancelInsert(ocvo));
	}
}
