package com.kplant.client.main.service;

import java.util.List;

import com.kplant.client.event.vo.EventVO;

public interface MainService {

	List<EventVO> eventList(EventVO evo);

	EventVO eventDetail(EventVO evo);

}
