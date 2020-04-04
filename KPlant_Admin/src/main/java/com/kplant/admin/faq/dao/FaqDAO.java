package com.kplant.admin.faq.dao;

import java.util.List;

import com.kplant.admin.faq.vo.FaqVO;

public interface FaqDAO {

	public List<FaqVO> faqList(FaqVO fvo);
	public int faqInsert(FaqVO fvo);
	public int faqDelete(int faq_num);
	public int faqUpdate(FaqVO fvo);
	public FaqVO faqDetail(FaqVO fvo);
	public int faqListCnt(FaqVO fvo);
	
}
