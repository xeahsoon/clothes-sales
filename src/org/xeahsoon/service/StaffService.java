package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Staff;

public interface StaffService {
	
	/**
	 * @return 返回所有员工
	 */
	List<Staff> listAllStaffs();
	
	/**
	 * @return 返回通过审核的员工
	 */
	List<Staff> listVerifiedStaffs();
	
	/**
	 * @param id 员工编号
	 * @return 返回审核、反审核结果
	 */
	int checkStaff(int id);
	
	/**
	 * @param id 员工编号
	 * @return 审核状态
	 */
	int getStaffStatus(int id);
	
	/**
	 * @param name 姓名
	 * @param phone 电话
	 * @param idcard 身份证
	 * @param address 住址
	 * @return 更新员工信息结果
	 */
	int editStaff(String name, String phone, String idcard, String address);
	
	/**
	 * @param name 姓名
	 * @param phone 电话
	 * @param idcard 身份证
	 * @param address 住址
	 * @return 添加员工信息结果
	 */
	int addStaff(String name, String phone, String idcard, String address);
}
