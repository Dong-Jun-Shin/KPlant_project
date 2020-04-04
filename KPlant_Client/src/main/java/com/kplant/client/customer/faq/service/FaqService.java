package com.kplant.client.customer.faq.service;

import java.util.List;

import com.kplant.client.customer.faq.vo.FaqVO;

public interface FaqService {

	List<FaqVO> faqList(FaqVO fvo);

	FaqVO faqGet(FaqVO fvo);

	int faqListCnt(FaqVO fvo);
	
}
