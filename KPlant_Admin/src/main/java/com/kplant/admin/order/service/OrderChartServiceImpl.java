package com.kplant.admin.order.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.order.dao.OrderChartDAO;

import lombok.Setter;

@Service
public class OrderChartServiceImpl implements OrderChartService{
	
	@Setter(onMethod_ = @Autowired)
	private OrderChartDAO ocdao;

	@Override
	public JSONObject getMonthSales() {
		return getChartData(ocdao.getMonthSales());
	}

	@Override
	public JSONObject getYearSales() {
		return getChartData(ocdao.getYearSales());
	}

	@Override
	public JSONObject getYearOrder() {
		return getComboData(ocdao.getYearOrder(), ocdao.getYearCancel());
	}

	@Override
	public String getAllData() {
		int mSales = ocdao.getAllMonthSales();
		int ySales = ocdao.getAllYearSales();
		int yOrder = ocdao.getAllYearOrder();
		int yCancel = ocdao.getAllYearCancel();
		
		String data = mSales + "," + ySales + "," + yOrder + "," + yCancel;
		return data;
	}
	
	/**
	 * DB에서 리스트 받아오고, 받아온걸로 json형식으로 만들어서 리턴
	 * 
	 * @param items	가공할 리스트
	 * @return 리스트를 가공해서 JSONObject를 반환
	 */
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getChartData(List<Map<String, Integer>> items) {
        //리턴할 json 객체
        JSONObject json = new JSONObject(); //{}
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
        //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        //col1에 저장 ("필드이름","자료형")
        JSONArray title = new JSONArray();
        col1.put("label","날짜 단위"); 
        col1.put("type", "string");
        col2.put("label", "데이터");
        col2.put("type", "number");
        
        //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
        
        //json 객체에 타이틀행 추가
        //data에 저장
        //{"cols" : [{"label" : "상품명","type":"string"}
        //			, {"label" : "금액", "type" : "number"}]}
        json.put("cols", title);
        
        //json 배열을 사용하기 위해 객체를 생성
        JSONArray body = new JSONArray();
        for (Map<String, Integer> dto : items) {
            JSONObject date = new JSONObject();
            date.put("v", dto.get("chartDate"));
            
            JSONObject data = new JSONObject();
            data.put("v", dto.get("data")); 
            
            //row에 셀 단위 저장
            JSONArray cell = new JSONArray();
            cell.add(date);
            cell.add(data);
            
            //레코드 1개 추가 (cell 2개를 합쳐서 "c"라는 이름으로 행 추가)
            JSONObject row = new JSONObject(); 
            row.put("c", cell);
            body.add(row);
        }
        // data에 자료행 추가 (body라는 이름으로 행의 묶음(자료)를 추가)
        json.put("rows", body); 
        
        return json;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getComboData(List<Map<String, Integer>> items1, List<Map<String, Integer>> items2) {
		//리턴할 json 객체
		JSONObject json = new JSONObject();
		
		//json의 칼럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		
		//json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
		//col1에 저장 ("필드이름","자료형")
		JSONArray title = new JSONArray();
		col1.put("label","날짜 단위"); 
		col1.put("type", "string");
		col2.put("label", "데이터1");
		col2.put("type", "number");
		col3.put("label", "데이터2");
		col3.put("type", "number");
		
		//테이블행에 컬럼 추가
		title.add(col1);
		title.add(col2);
		title.add(col3);
		
		//json 객체에 타이틀행 추가
		//data에 저장
		//{"cols" : [{"label" : "상품명","type":"string"}
		//			, {"label" : "금액", "type" : "number"}]}
		json.put("cols", title);
		
		//json 배열을 사용하기 위해 객체를 생성
		JSONArray body = new JSONArray();

		for (int i = 0; i < items1.size(); i++) {
			JSONObject date = new JSONObject();
			date.put("v", items1.get(i).get("chartDate"));
			
			JSONObject data1 = new JSONObject();
			data1.put("v", items1.get(i).get("data")); 
			
			//row에 셀 단위 저장
			JSONArray cell = new JSONArray();
			cell.add(date);
			cell.add(data1);
			
			for (Map<String, Integer> dto : items2) {
				String date1 = String.valueOf(items1.get(i).get("chartDate"));
				String date2 = String.valueOf(dto.get("chartDate"));

				if(date1.equals(date2)) {
					JSONObject data2 = new JSONObject();
					data2.put("v", dto.get("data")); 
					
					cell.add(data2);
				}
			}
			
			//레코드 1개 추가 (cell 2개를 합쳐서 "c"라는 이름으로 행 추가)
			JSONObject row = new JSONObject(); 
			row.put("c", cell);
			body.add(row);
		}
		
		// data에 자료행 추가 (body라는 이름으로 행의 묶음(자료)를 추가)
		json.put("rows", body); 
		
		return json;
	}
}
