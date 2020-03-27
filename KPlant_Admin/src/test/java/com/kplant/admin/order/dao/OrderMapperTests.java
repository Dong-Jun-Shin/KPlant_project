package com.kplant.admin.order.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kplant.admin.order.vo.OrderListVO;

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
	
	
	
}
