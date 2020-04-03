package com.kplant.admin.consult.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kplant.admin.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ConsultVO extends CommonVO{
	private int cns_num;
	private String cns_title;
	private String cns_content;
	private String cns_category;
	private String cns_reply;
	private String cns_progress;
	private String cns_regstDate;
	private String cns_file;
	private MultipartFile file;
	private int m_num;
}
