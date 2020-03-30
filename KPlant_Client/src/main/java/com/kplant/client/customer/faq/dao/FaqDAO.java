package com.kplant.client.customer.faq.dao;

import java.util.List;

import com.kplant.client.customer.faq.vo.FaqVO;

public interface FaqDAO {

	public List<FaqVO> faqList(FaqVO fvo);

	public FaqVO faqGet(FaqVO fvo);
	
}
