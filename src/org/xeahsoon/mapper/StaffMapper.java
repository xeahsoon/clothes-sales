package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Staff;

public interface StaffMapper {

	//用编号查询导购员
	@Select("select * from staff where id = #{id}")
	Staff getStaffById(@Param("id")int id);
	
	//列出所有导购员
	@Select("select * from staff")
	List<Staff> listAllStaffs();
	
	//列出所有通过审核的导购员
	@Select("select * from staff where status = '1'")
	List<Staff> listVerifiedStaffs();
}
