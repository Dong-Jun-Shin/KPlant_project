package com.kplant.admin.product.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductImageVO {
	private int i_num = 0;
	private String prd_num = "";
	private List<MultipartFile> files; // 파일 업로드를 위한 필드
	private String i_file   ="";   //실제서버에 저장한 파일명(복수파일)
	private String i_date   ="";
	
	public ProductImageVO() {
		files = new ArrayList<MultipartFile>();
	}
}
