package com.kplant.client.customer.consult.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.common.file.FileUploadUtil;
import com.kplant.client.customer.consult.dao.ConsultDAO;
import com.kplant.client.customer.consult.vo.ConsultVO;

import lombok.Setter;

@Service
public class ConsultServiceImpl implements ConsultService {
	
	@Setter(onMethod_=@Autowired)
	private ConsultDAO consultDAO;
	
	//상담내역 입력
	@Override
	public int consultInsert(ConsultVO cvo) {
		int result=0;
		try {
			if (cvo.getFile()!=null) {
				String fileName = FileUploadUtil.fileUpload(cvo.getFile(), "customer/consult");
				cvo.setCns_file(fileName);
			}
			result = consultDAO.consultInsert(cvo);
		} catch (Exception e) {
			e.printStackTrace();
			result=0;
		}
		return result;
	}

}
