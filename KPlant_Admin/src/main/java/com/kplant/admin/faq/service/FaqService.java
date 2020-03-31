package com.kplant.admin.faq.service;

import java.util.List;

import com.kplant.admin.faq.vo.FaqVO;


public interface FaqService {

	List<FaqVO> faqList(FaqVO fvo);
	int faqInsert(FaqVO fvo);
	int faqDelete(int faq_num);
	int faqUpdate(FaqVO fvo);
	FaqVO updateForm(FaqVO fvo);
	FaqVO faqDetail(FaqVO fvo);
	
}
