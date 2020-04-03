package com.kplant.admin.faq.vo;

import com.kplant.admin.common.vo.CommonVO;

import lombok.Data;

@Data
public class FaqVO extends CommonVO {
	private int faq_num;
	private String faq_rgstDate;
	private String faq_modifyDate;
	private String faq_content;
	private String faq_title;
}
