package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.User;

/**
 * UserMapper接口
 * */
public interface UserMapper {
	
	
	/**
	 * @param id 用户ID
	 * @return 指定ID的用户
	 */
	@Select("select * from user where id=#{id}")
	User selectUserById(@Param("id")int id);
	
	/**
	 * @return 返回所有用户（店长用户）
	 */
	@Select("select * from user")
	List<User> showUsers();
	
	/**
	 * @param loginname 登录名
	 * @param password 密码
	 * @return 找到返回User对象，没有找到返回null
	 */
	@Select("select * from user where loginname = #{loginname} and password = #{password}")
	User findWithLoginnameAndPassword(@Param("loginname")String loginname,
			@Param("password") String password);

}
