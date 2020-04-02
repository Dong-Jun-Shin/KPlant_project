package com.kplant.client.order.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kplant.client.order.vo.OrderDetailVO;
import com.kplant.client.order.vo.OrderListVO;
import com.kplant.client.order.vo.PaymentVO;
import com.kplant.client.order.vo.ShippingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ClientOrderDAO odao;
	
	@Test
	public void testGetOrderNum() {
		log.info(odao.getOrderNum());
	}
	
	@Test
	public void testOrderListInsert() {
		OrderListVO ovo = new OrderListVO();
		ovo.setOrd_num("OR1912310002");
		ovo.setOrd_name("test");
		ovo.setOrd_phone("test");
		ovo.setOrd_email("test");
		ovo.setM_num(1);
		
		log.info(odao.orderListInsert(ovo));
	}
	
	@Test
	public void testOrderDetailInsert() {
		OrderDetailVO odvo = new OrderDetailVO();
		odvo.setOrd_num("OR1912310001");
		odvo.setPrd_num("prd_num 01");
		odvo.setOrd_qty(1000);
		
		log.info(odao.orderDetailInsert(odvo));
	}
	
	@Test
	public void testShippingInsert() {
		ShippingVO shvo = new ShippingVO();
		shvo.setOrd_num("OR1912310001");
		shvo.setSh_name("test");
		shvo.setSh_phone("test");
		shvo.setSh_request("test");
		shvo.setSh_residence("test");
		
		log.info(odao.shippingInsert(shvo));
	}
	
	@Test
	public void testPaymentInsert() {
		PaymentVO pvo = new PaymentVO();
		pvo.setOrd_num("OR1912310001");
		pvo.setPay_date("20/03/25");
		pvo.setPay_method("test");
		pvo.setPay_num("test");
		pvo.setPay_price(1000);
		pvo.setPay_status("test");
		
		log.info(odao.paymentInsert(pvo));
	}
}
