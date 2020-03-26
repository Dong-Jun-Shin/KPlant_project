package com.kplant.admin.event.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kplant.admin.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class EventVO extends CommonVO{
	private int evnt_num;
	private String evnt_title;
	private String evnt_content;
	private String evnt_rgstDate;
	private String evnt_endDate;
	private int evnt_views;
	private String evnt_startDate;
	private String evnt_ModifyDate;
	private String evnt_fileF;
	private String evnt_fileS;
	private String evnt_fileT;
	private String evnt_thumb;
	private MultipartFile fileF;
	private MultipartFile fileS;
	private MultipartFile fileT;
}
