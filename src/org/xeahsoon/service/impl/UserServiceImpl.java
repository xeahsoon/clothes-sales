package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.xeahsoon.mapper.UserMapper;
import org.xeahsoon.pojo.User;
import org.xeahsoon.service.UserService;

/**
 * User服务层接口实现类
 * @Service("userService")用于将当前类注释为一个Spring的bean，名为userService
 * */
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("userService")
public class UserServiceImpl implements UserService {
	
	/**
	 * 自动注入UserMapper
	 * */
	@Autowired
	private UserMapper userMapper;

	/**
	 * UserService接口login方法实现
	 * @see { UserService }
	 * */
	@Transactional(readOnly=true)
	@Override
	public User login(String loginname, String password) {
		return userMapper.findWithLoginnameAndPassword(loginname, password);
	}

	@Override
	public int checkLoginNameIfExists(String loginname) {
		User user =  userMapper.selectUserByLoginName(loginname);
		if(user != null) {
			return 1;
		}
		return 0;
	}

	@Override
	public int registerNewUser(String loginname, String password, String name, String phone) {
		return userMapper.registerNewUser(loginname, password, name, phone);
	}

	@Override
	public List<User> getUserList() {
		return userMapper.showUsers();
	}

	@Override
	public int updateUserInfo(String loginname, String name, String phone, String password) {
		return userMapper.updateUserInfo(loginname, name, phone, password);
	}

	@Override
	public int checkUser(String loginname) {
		return userMapper.checkUser(loginname);
	}

	@Override
	public int resetUserPwd(String loginname) {
		return userMapper.resetUserPwd(loginname);
	}
}
