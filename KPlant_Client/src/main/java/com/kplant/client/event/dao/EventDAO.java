package com.kplant.client.event.dao;

import java.util.List;

import com.kplant.client.event.vo.EventVO;

public interface EventDAO {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);
}
