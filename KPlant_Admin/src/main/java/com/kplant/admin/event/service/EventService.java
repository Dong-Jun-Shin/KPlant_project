package com.kplant.admin.event.service;

import java.util.List;

import com.kplant.admin.event.vo.EventVO;


public interface EventService {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);
	public int eventInsert(EventVO evo);
	public int eventUpdate(EventVO evo);
	public int eventDelete(EventVO evo);
	public int eventListCnt(EventVO evo);
	public EventVO updateForm(EventVO evo);

}
