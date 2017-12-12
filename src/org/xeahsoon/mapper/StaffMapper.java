package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Staff;

public interface StaffMapper {

	@Select("select * from staff")
	List<Staff> listAllStaffs();
	
	@Select("select * from staff where id = #{id}")
	Staff getStaffById(@Param("id")int id);
}
