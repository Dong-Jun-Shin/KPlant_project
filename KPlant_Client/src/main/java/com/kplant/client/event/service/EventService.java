package com.kplant.client.event.service;

import java.util.List;

import com.kplant.client.event.vo.EventVO;

public interface EventService {
	public List<EventVO> eventList(EventVO evo);
	public EventVO eventDetail(EventVO evo);

}
