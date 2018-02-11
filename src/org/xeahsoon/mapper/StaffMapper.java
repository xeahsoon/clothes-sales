package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.Staff;

public interface StaffMapper {

	/**
	 * @param id 员工ID
	 * @return 返回指定ID的员工
	 */
	@Select("select * from staff where id = #{id}")
	Staff getStaffById(@Param("id")int id);
	
	/**
	 * @return 列出所有员工
	 */
	@Select("select * from staff")
	List<Staff> listAllStaffs();
	
	/**
	 * @return 列出所有通过审核的导购员
	 */
	@Select("select * from staff where status = '1'")
	List<Staff> listVerifiedStaffs();
	
	/**
	 * @param id 员工编号
	 * @return 审核/反审核操作结果
	 */
	@Update("update staff set status = 1-status  where id = #{id}")
	int checkStaff(@Param("id")int id);
	
	/**
	 * @param id 员工编号
	 * @return 员工审核状态
	 */
	@Select("select status from staff where id = #{id}")
	int getStaffStatus(@Param("id")int id);

	/**
	 * @param phone 手机号码
	 * @param idcard 身份证号
	 * @param address 联系地址
	 * @param name 姓名
	 * @return 修改员工信息影响条目数
	 */
	@Update("update staff set phone = #{phone}, idcard = #{idcard}, address = #{address} where name = #{name}")
	int editStaff(@Param("phone")String phone, @Param("idcard")String idcard,
			@Param("address")String address, @Param("name")String name);

	/**
	 * @param name 姓名
	 * @param phone 手机号码
	 * @param idcard 身份证号
	 * @param address 联系地址
	 * @return 新增员工信息结果
	 */
	@Insert("insert into staff(name, phone, idcard, address) values(#{name}, #{phone}, #{idcard}, #{address})")
	int addStaff(@Param("name")String name, @Param("phone")String phone, @Param("idcard")String idcard, @Param("address")String address);
}
