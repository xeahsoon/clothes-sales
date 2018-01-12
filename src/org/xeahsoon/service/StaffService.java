package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Staff;

public interface StaffService {
	
	List<Staff> listAllStaffs();
	
	List<Staff> listVerifiedStaffs();
	
	int checkStaff(int id);
	
	int editStaff(String name, String phone, String idcard, String address);
	
	int addStaff(String name, String phone, String idcard, String address);
}
