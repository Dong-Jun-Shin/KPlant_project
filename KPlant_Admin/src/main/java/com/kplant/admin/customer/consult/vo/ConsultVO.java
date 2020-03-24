package com.kplant.admin.customer.consult.vo;

import lombok.Data;

@Data
public class ConsultVO {
	private int cns_num;
	private String cns_title;
	private String cns_content;
	private String cns_category;
	private String cns_reply;
	private String cns_progress;
	private String cns_regstDate;
	private String cns_file;
	private int m_num;
}
