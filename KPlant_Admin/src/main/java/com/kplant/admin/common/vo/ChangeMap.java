package com.kplant.admin.common.vo;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;

public class ChangeMap extends ListOrderedMap{
	private static final long serialVersionUID = 59690617583446390L;
	
	// mybatis의 결과 컬럼에 대해 모두 소문자로 변환해서 Map을 생성
	public Object put(Object key, Object value) {
		return super.put(StringUtils.lowerCase((String)key), value);
	}
}
