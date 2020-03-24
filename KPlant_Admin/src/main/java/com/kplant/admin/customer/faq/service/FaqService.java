package com.kplant.admin.customer.faq.service;

import java.util.List;

import com.kplant.admin.customer.faq.vo.FaqVO;


public interface FaqService {

	List<FaqVO> faqList(FaqVO fvo);
	
}
