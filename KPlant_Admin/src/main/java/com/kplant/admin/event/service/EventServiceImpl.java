package com.kplant.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.admin.common.file.FileUploadUtil;
import com.kplant.admin.event.dao.EventDAO;
import com.kplant.admin.event.vo.EventVO;
  
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
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
		if(detail.getEvnt_content()!=null) {
	    	detail.setEvnt_content(detail.getEvnt_content().replaceAll("\n", "<br />"));
	    }
		return detail;
	}
	
	/*이벤트 입력*/
	@Override
	public int eventInsert(EventVO evo) {
		int result = 0;
		
		try {
			if (evo.getFileF()!=null) {
				String fileName_fileF = FileUploadUtil.fileUpload(evo.getFileF(), "event");
				evo.setEvnt_fileF(fileName_fileF);
				
				String thumbName = FileUploadUtil.makeThumbnail(fileName_fileF);
				evo.setEvnt_thumb(thumbName);
				
				if(evo.getFileS().getOriginalFilename() != null && (!evo.getFileS().getOriginalFilename().equals(""))) {
					String fileName_fileS = FileUploadUtil.fileUpload(evo.getFileS(), "event");
					evo.setEvnt_fileS(fileName_fileS);
				}
				
				if(evo.getFileT().getOriginalFilename() != null && (!evo.getFileT().getOriginalFilename().equals(""))) {
					String fileName_fileT = FileUploadUtil.fileUpload(evo.getFileT(), "event");
					evo.setEvnt_fileT(fileName_fileT);
				}
			}
			System.out.println(evo);
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
		int result = 0;
		try {
			
			/*첫번째 파일 및 썸네일*/
			if (evo.getFileF().getSize()>0) {
				if (!evo.getEvnt_fileF().isEmpty()) {
					FileUploadUtil.fileDelete(evo.getEvnt_fileF());
					FileUploadUtil.fileDelete(evo.getEvnt_thumb());
				}
				String fileName = FileUploadUtil.fileUpload(evo.getFileF(), "event");
				evo.setEvnt_fileF(fileName);

				String thumName = FileUploadUtil.makeThumbnail(fileName);
				evo.setEvnt_thumb(thumName);
				
			}else {
				evo.setEvnt_fileF("");
				evo.setEvnt_thumb("");
			}
			
			/*두번째 파일*/
			if (evo.getFileS().getSize()>0) {
				if (!evo.getEvnt_fileS().isEmpty()) {
					FileUploadUtil.fileDelete(evo.getEvnt_fileS());
				}
				String fileNameS = FileUploadUtil.fileUpload(evo.getFileS(), "event");
				evo.setEvnt_fileS(fileNameS);
			}else {
				evo.setEvnt_fileS("");
			}
			
			/*세번째 파일*/
			if (evo.getFileT().getSize()>0) {
				if (!evo.getEvnt_fileT().isEmpty()) {
					FileUploadUtil.fileDelete(evo.getEvnt_fileT());
				}
				String fileNameT = FileUploadUtil.fileUpload(evo.getFileT(), "event");
				evo.setEvnt_fileT(fileNameT);
			}else {
				evo.setEvnt_fileT("");
			}
			log.info(evo);
			result = eventDAO.eventUpdate(evo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	/*이벤트 삭제*/
	@Override
	public int eventDelete(EventVO evo) {
		int result = 0;
		try {
			if (evo.getEvnt_fileF()!="") {
				FileUploadUtil.fileDelete(evo.getEvnt_fileF());
				FileUploadUtil.fileDelete(evo.getEvnt_thumb());
			}
			if (evo.getEvnt_fileS()!="") {
				FileUploadUtil.fileDelete(evo.getEvnt_fileS());
			}
			if (evo.getEvnt_fileT()!="") {
				FileUploadUtil.fileDelete(evo.getEvnt_fileT());
			}
			result = eventDAO.eventDelete(evo.getEvnt_num());
			
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	@Override
	public int eventListCnt(EventVO evo) {
		return eventDAO.eventListCnt(evo);
	}
	@Override
	public EventVO updateForm(EventVO evo) {
		EventVO detail = null;
		detail = eventDAO.eventDetail(evo);
		return detail;
	}
}
