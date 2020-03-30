package com.kplant.admin.faq.dao;

import java.util.List;

import com.kplant.admin.faq.vo.FaqVO;

public interface FaqDAO {

	public List<FaqVO> faqList(FaqVO fvo);
	
}
