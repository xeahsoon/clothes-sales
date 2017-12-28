package org.xeahsoon.service;

import java.util.Date;
import java.util.List;

import org.xeahsoon.pojo.Member;

public interface MemberService {
	
	List<Member> listAllMembers();
	
	int checkPhoneIfExist(String phone);
	
	int addMember(String phone, String name, String birth);
	
	int deleteMember(int id);
	
	int updateMemberInfo(String name, Date birth, Double discount, String phone);
}
