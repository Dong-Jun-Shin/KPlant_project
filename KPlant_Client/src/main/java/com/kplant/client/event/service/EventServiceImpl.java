package com.kplant.client.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.event.dao.EventDAO;
import com.kplant.client.event.vo.EventVO;

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
}
