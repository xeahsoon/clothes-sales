package org.xeahsoon.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Manager;

public interface ManagerMapper {

	@Select("select * from manager where loginname=#{loginname} and password=#{password}")
	Manager findManager(@Param("loginname")String loginname, @Param("password")String password);
}
