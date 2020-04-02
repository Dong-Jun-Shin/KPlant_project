package com.spring.client.login.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kplant.client.join.vo.MemberVO;
import com.kplant.client.login.dao.LoginDAO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LoginMapperTests {
	
	//@Setter(onMethod_ = @Autowired)
	private LoginDAO loginDAO;
	
	@Test public void testLoginCheck() {
		MemberVO mvo=new MemberVO();
		
		
	}
}
