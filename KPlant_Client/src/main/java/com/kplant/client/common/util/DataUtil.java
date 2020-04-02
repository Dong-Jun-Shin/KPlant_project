package com.kplant.client.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DataUtil {
	/**
	 * Unix Timestamp를 date로 변환
	 * @param timestampStr  Unix Timestamp
	 * @return formattedDate 날짜문자열
	 */
	public static String getTimestampToDate(String timestampStr){
	    long timestamp = Long.parseLong(timestampStr);
	    Date date = new Date(timestamp*1000L); 
	    
	    SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
	    sdf.setTimeZone(TimeZone.getTimeZone("GMT+9"));
	    
	    String formattedDate = sdf.format(date);
	    
	    return formattedDate;
	}
}
