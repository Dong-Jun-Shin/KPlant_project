package com.kplant.admin.order.dao;

import java.util.List;
import java.util.Map;

public interface OrderChartDAO {
	public List<Map<String, Integer>> getMonthSales();
	public List<Map<String, Integer>> getYearSales();
	public List<Map<String, Integer>> getYearOrder();
	public List<Map<String, Integer>> getYearCancel();
	public int getAllMonthSales();
	public int getAllYearSales();
	public int getAllYearOrder();
	public int getAllYearCancel();
}
