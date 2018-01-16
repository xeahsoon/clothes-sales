package org.xeahsoon.service;

import org.xeahsoon.pojo.Manager;

public interface ManagerService {

	/**
	 * @param loginname 管理员登录名
	 * @param password 管理员密码
	 * @return 根据用户名和管理员查询出的管理员
	 */
	Manager login(String loginname, String password);
}
