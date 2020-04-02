package com.kplant.admin.login.dao;

import com.kplant.admin.login.vo.AdminVO;

public interface LoginDAO {

	AdminVO loginCheck(AdminVO avo);

	AdminVO viewMember(AdminVO avo);

}
