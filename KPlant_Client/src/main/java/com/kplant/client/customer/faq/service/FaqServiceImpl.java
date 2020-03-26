package com.kplant.client.customer.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.customer.faq.dao.FaqDAO;
import com.kplant.client.customer.faq.vo.FaqVO;

import lombok.Setter;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Setter(onMethod_=@Autowired)
	private FaqDAO faqDAO;
	
	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		List<FaqVO> clist = null;
		clist = faqDAO.faqList(fvo);
		return clist;
	}

	@Override
	public FaqVO faqGet(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDAO.faqGet(fvo);
		return detail;
	}

}
