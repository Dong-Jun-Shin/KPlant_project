package com.kplant.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.common.file.FileUploadUtil;
import com.kplant.admin.event.dao.EventDAO;
import com.kplant.admin.event.vo.EventVO;

import lombok.Setter;

@Service
public class EventServiceImpl implements EventService {
	
	@Setter(onMethod_=@Autowired)
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> eventList(EventVO evo) {
		List<EventVO> list = null;
		list = eventDAO.eventList(evo);
		return list;
	}
	@Override
	public EventVO eventDetail(EventVO evo) {
		EventVO detail = null;
		detail = eventDAO.eventDetail(evo);
		if (detail!=null) {
			detail.setEvnt_content(
			detail.getEvnt_content().toString().replace("\n", "<br>"));
		}
		return detail;
	}
	
	/*이벤트 입력*/
	@Override
	public int eventInsert(EventVO evo) {
		int result = 0;
		
		try {
			if (evo.getFileF()!=null) {
				String fileName = FileUploadUtil.fileUpload(evo.getFileF(), "gallery");
				evo.setEvnt_fileF(fileName);
				
				String thumbName = FileUploadUtil.makeThumbnail(fileName);
				evo.setEvnt_thumb(thumbName);
			}
			result = eventDAO.eventInsert(evo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	/*이벤트 수정*/
	@Override
	public int eventUpdate(EventVO evo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/*이벤트 삭제*/
	@Override
	public int galleryDelete(EventVO evo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
