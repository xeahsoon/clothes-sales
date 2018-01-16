package org.xeahsoon.service;

import java.util.Date;
import java.util.List;

import org.xeahsoon.pojo.Member;

public interface MemberService {
	
	/**
	 * @return 返回所有会员信息
	 */
	List<Member> listAllMembers();
	
	/**
	 * @param phone 手机号码
	 * @return 手机号码重复检验
	 */
	int checkPhoneIfExist(String phone);
	
	/**
	 * @param phone 手机号码
	 * @param name 姓名
	 * @param birth 生日
	 * @return 返回添加会员信息结果
	 */
	int addMember(String phone, String name, String birth);
	
	/**
	 * @param id 会员ID
	 * @return 删除会员信息结果
	 */
	int deleteMember(int id);
	
	/**
	 * @param name 姓名
	 * @param birth 生日
	 * @param discount 折扣
	 * @param phone 手机号码
	 * @return 更新会员信息影响条目数
	 */
	int updateMemberInfo(String name, Date birth, Double discount, String phone);
}
