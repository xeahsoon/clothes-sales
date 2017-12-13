package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.User;

/**
 * UserMapper接口
 * */
public interface UserMapper {
	
	
	@Select("select * from user where id=#{id}")
	User selectUserById(@Param("id")int id);
	
	@Select("select * from user")
	List<User> showUsers();
	
	/**
	 * 根据登录名和密码查询用户
	 * @param String loginname
	 * @param String password
	 * @return 找到返回User对象，没有找到返回null
	 * */
	@Select("select * from user where loginname = #{loginname} and password = #{password}")
	User findWithLoginnameAndPassword(@Param("loginname")String loginname,
			@Param("password") String password);

}
