package com.kplant.admin.order.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChartMapperTests {
	@Setter(onMethod_ = @Autowired)
	private OrderChartDAO ocdao;
	
	@Test
	public void testGetMonthSales() {
		log.info(ocdao.getMonthSales());
	}
	
	@Test
	public void testGetYearSales() {
		log.info(ocdao.getYearSales());
	}
	
	@Test
	public void testGetYearOrder() {
		log.info(ocdao.getYearOrder());
		log.info(ocdao.getYearCancel());
	}
	
	@Test
	public void testAllData() {
		log.info(ocdao.getAllMonthSales());
		log.info(ocdao.getAllYearSales());
		log.info(ocdao.getAllYearOrder());
		log.info(ocdao.getAllYearCancel());
	}
}
