package com.kplant.admin.login.service;

import javax.servlet.http.HttpSession;

import com.kplant.admin.login.vo.AdminVO;


public interface LoginService {

	AdminVO loginCheck(AdminVO avo, HttpSession session);

	AdminVO viewMember(AdminVO avo);

	void logout(HttpSession session);

}
