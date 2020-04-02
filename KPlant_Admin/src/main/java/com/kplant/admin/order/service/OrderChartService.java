package com.kplant.admin.order.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

public interface OrderChartService {
	// 차트
	public JSONObject getMonthSales();
	public JSONObject getYearSales();
	public JSONObject getYearOrder();
	public JSONObject getChartData(List<Map<String, Integer>> items);
	public JSONObject getComboData(List<Map<String, Integer>> items1, List<Map<String, Integer>> items2);
	public String getAllData();
}
