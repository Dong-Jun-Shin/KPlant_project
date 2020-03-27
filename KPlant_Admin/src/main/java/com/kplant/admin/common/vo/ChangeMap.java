package com.kplant.admin.common.vo;

import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;

public class ChangeMap extends ListOrderedMap{
	private static final long serialVersionUID = 59690617583446390L;

	public Object put(Object key, Object value) {
		return super.put(StringUtils.lowerCase((String)key), value);
	}
}
