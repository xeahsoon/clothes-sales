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

}
