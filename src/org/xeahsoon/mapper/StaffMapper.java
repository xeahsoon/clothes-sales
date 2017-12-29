package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	
	//审核/反审核员工
	@Update("update staff set status = 1-status  where id = #{id}")
	int checkStaff(@Param("id")int id);
	
	//修改员工信息
	@Update("update staff set phone = #{phone}, idcard = #{idcard}, address = #{address} where name = #{name}")
	int editStaff(@Param("phone")String phone, @Param("idcard")String idcard,
			@Param("address")String address, @Param("name")String name);
	
	//添加导购员信息
	@Insert("insert into staff(name, phone, idcard, address) values(#{name}, #{phone}, #{idcard}, #{address})")
	int addStaff(@Param("name")String name, @Param("phone")String phone, @Param("idcard")String idcard, @Param("address")String address);
}
