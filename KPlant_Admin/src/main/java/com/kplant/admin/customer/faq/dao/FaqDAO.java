package com.kplant.admin.customer.faq.dao;

import java.util.List;
import com.kplant.admin.customer.faq.vo.FaqVO;

public interface FaqDAO {

	public List<FaqVO> faqList(FaqVO fvo);
	
}
