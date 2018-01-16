package org.xeahsoon.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Manager;

public interface ManagerMapper {

	/**
	 * @param loginname 登录名
	 * @param password 密码
	 * @return 返回根据登录名和密码查找到的管理员用户
	 */
	@Select("select * from manager where loginname=#{loginname} and password=#{password}")
	Manager findManager(@Param("loginname")String loginname, @Param("password")String password);
}
