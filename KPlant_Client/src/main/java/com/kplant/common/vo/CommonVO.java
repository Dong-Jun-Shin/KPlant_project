package com.kplant.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	//조건검색시 사용할 필드(검색대상, 검색단어)
	private String search="";
	private String keyword="";
	
	//날짜 검색시 사용할 필드(시작일, 종료일)
    private String start_date = "";
    private String end_date = "";
}
