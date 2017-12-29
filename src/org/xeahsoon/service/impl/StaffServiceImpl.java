package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.StaffMapper;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.service.StaffService;

@Service("staffService")
public class StaffServiceImpl implements StaffService {

	@Autowired
	private StaffMapper staffMapper;
	
	@Override
	public List<Staff> listAllStaffs() {
		return staffMapper.listAllStaffs();
	}

	@Override
	public List<Staff> listVerifiedStaffs() {
		return staffMapper.listVerifiedStaffs();
	}

	@Override
	public int checkStaff(int id) {
		return staffMapper.checkStaff(id);
	}

	@Override
	public int editStaff(String name, String phone, String idcard, String address) {
		return staffMapper.editStaff(phone, idcard, address, name);
	}

	@Override
	public int addStaff(String name, String phone, String idcard, String address) {
		return staffMapper.addStaff(name, phone, idcard, address);
	}

}
