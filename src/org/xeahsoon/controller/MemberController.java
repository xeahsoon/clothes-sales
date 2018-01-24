package org.xeahsoon.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Member;
import org.xeahsoon.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/member")
	public String listMembers(Model model) {
		
		List<Member> member_list = memberService.listAllMembers();
		model.addAttribute("member_list", member_list);
		
		return "member";
	}
	
	@ResponseBody
	@RequestMapping(value="/addMember")
	public int addMember(String name, String phone, String birth) {
		int result = memberService.checkPhoneIfExist(phone);
		if(result >= 1) {
			result = 0;
		} else {
			result = memberService.addMember(phone, name, birth);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteMember")
	public int deleteMember(int id) {
		int result = memberService.deleteMember(id);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/editMember")
	public int editMember(String phone, String name, String birth, double discount) {
		System.out.println(phone+" "+name+" "+birth+" "+discount);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		try {
			birthday = sdf.parse(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int result = memberService.updateMemberInfo(name, birthday, discount, phone);
		return result;
	}
	
	/**
	 * 销售打单填写会员账号建议
	 * @return 会员列表
	 */
	@ResponseBody
	@RequestMapping(value="/memberSuggest")
	public List<Member> memberSuggest() {
		
		List<Member> member_list = memberService.listAllMembers();
		
		return member_list;
	}
}
