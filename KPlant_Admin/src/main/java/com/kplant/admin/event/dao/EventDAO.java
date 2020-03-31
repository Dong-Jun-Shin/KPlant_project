package com.kplant.admin.event.dao;

import java.util.List;

import com.kplant.admin.event.vo.EventVO;


public interface EventDAO {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);
	public int eventInsert(EventVO evo);
	public int eventDelete(int evnt_num);
	public int eventUpdate(EventVO evo);
}
