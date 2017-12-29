package org.xeahsoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.service.StaffService;

@Controller
public class StaffController {

	@Autowired
	@Qualifier("staffService")
	private StaffService staffService;
	
	@RequestMapping(value="/staff")
	public String listStaffs(Model model) {
		
		List<Staff> staff_list = staffService.listAllStaffs();
		model.addAttribute("staff_list", staff_list);
		
		return "staff";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkStaff")
	public int checkStaff(int id) {
		int result = staffService.checkStaff(id);
		return result;
	}

	@ResponseBody
	@RequestMapping(value="/editStaff")
	public int editStaff(String name, String phone, String idcard, String address) {
		int result = staffService.editStaff(name, phone, idcard, address);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/addStaff")
	public int addStaff(String name, String phone, String idcard, String address) {
		int result = staffService.addStaff(name, phone, idcard, address);
		return result;
	}
}
