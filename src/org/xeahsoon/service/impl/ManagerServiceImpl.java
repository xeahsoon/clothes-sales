package org.xeahsoon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.ManagerMapper;
import org.xeahsoon.pojo.Manager;
import org.xeahsoon.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public Manager login(String loginname, String password) {
		return managerMapper.findManager(loginname, password);
	}

}
