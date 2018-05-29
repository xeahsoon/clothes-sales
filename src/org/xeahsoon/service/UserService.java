package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.User;

/**
 * User服务层接口
 * */
public interface UserService {
	
	/**
	 * 判断用户登录
	 * @param String loginname
	 * @param String password
	 * @return 找到返回User对象，没有找到返回null
	 * */
	User login(String loginname,String password);
	
	int checkLoginNameIfExists(String loginname);
	
	int registerNewUser(String loginname, String password, String name, String phone);
	
	List<User> getUserList();
	
	int updateUserInfo(String loginname, String name, String phone, String password);
	
	int checkUser(String loginname);
	
	int resetUserPwd(String loginname);
}
