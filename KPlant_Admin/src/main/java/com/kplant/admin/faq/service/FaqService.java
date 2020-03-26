package com.kplant.admin.faq.service;

import java.util.List;

import com.kplant.admin.faq.vo.FaqVO;


public interface FaqService {

	List<FaqVO> faqList(FaqVO fvo);
	
}
