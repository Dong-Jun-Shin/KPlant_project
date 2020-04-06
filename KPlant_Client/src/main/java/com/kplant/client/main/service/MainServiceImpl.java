package com.kplant.client.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kplant.client.event.dao.EventDAO;
import com.kplant.client.event.vo.EventVO;

import lombok.Setter;

@Service
public class MainServiceImpl implements MainService {
	
	@Setter(onMethod_=@Autowired)
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> eventList(EventVO evo) {
		List<EventVO> list = null;
		list = eventDAO.eventList(evo);
		return list;
	}

}
