package com.kplant.admin.event.service;

import java.util.List;

import com.kplant.admin.event.vo.EventVO;


public interface EventService {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);

}
