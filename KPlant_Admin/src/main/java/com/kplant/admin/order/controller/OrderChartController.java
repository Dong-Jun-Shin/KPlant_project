package com.kplant.admin.order.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kplant.admin.order.service.OrderChartService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping(value = "/chart")
public class OrderChartController {
	
	@Setter(onMethod_ = @Autowired) 
	private OrderChartService orderChartService;
	
	/**
	 * 주차별 월 매출액 그래프
	 * 
	 * @return
	 */
	@RequestMapping(value = "/monthSales", method = RequestMethod.GET)
	public JSONObject getMonthSales() {
		log.info("admin/주차별 월 매출액 그래프");
		return orderChartService.getMonthSales();
	}
	
	/**
	 * 월별 연 매출액 그래프
	 * 
	 * @return
	 */
	@RequestMapping(value = "/yearSales", method = RequestMethod.GET)
	public JSONObject getYearSales() {
		log.info("admin/월별 연 매출액 그래프");
		return orderChartService.getYearSales();
	}
	
	/**
	 * 월별 연 주문건, 주문 취소건 그래프
	 * 
	 * @return
	 */
	@RequestMapping(value = "/yearOrder", method = RequestMethod.GET)
	public JSONObject getYearOrder() {
		log.info("admin/월별 연 주문건 그래프");
		return orderChartService.getYearOrder();
	}
	
	/**
	 * 월 총 매출액, 연 총 매출액, 연 총 주문건, 연 총 취소건에 대한 데이터
	 * 
	 * @return String 각 데이터를 ','로 구분해서 반환
	 */
	@RequestMapping(value = "/allData", method = RequestMethod.GET)
	public String getAllData() {
		log.info("admin/총 데이터 호출");
		return orderChartService.getAllData();
	}
}
