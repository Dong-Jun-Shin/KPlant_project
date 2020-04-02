package com.kplant.admin.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.faq.dao.FaqDAO;
import com.kplant.admin.faq.vo.FaqVO;

import lombok.Setter;

@Service
public class FaqServiceImpl implements FaqService {

	@Setter(onMethod_=@Autowired)
	private FaqDAO faqDAO;
	
	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		List<FaqVO> list = null;
		list = faqDAO.faqList(fvo);
		return list;
	}

	@Override
	public int faqInsert(FaqVO fvo) {
		int result = 0;
		result = faqDAO.faqInsert(fvo);
		return result;
	}

	@Override
	public int faqDelete(int faq_num) {
		int result = 0;
		result = faqDAO.faqDelete(faq_num);
		return result;
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		int result = 0;
		result = faqDAO.faqUpdate(fvo);
		return result;
	}

	@Override
	public FaqVO updateForm(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDAO.faqDetail(fvo);
		return detail;
	}

	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		FaqVO detail = null;
		detail = faqDAO.faqDetail(fvo);
		if (detail!=null) {
			detail.setFaq_content(
					detail.getFaq_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int faqListCnt(FaqVO fvo) {
		return faqDAO.faqListCnt(fvo);
	}

}
