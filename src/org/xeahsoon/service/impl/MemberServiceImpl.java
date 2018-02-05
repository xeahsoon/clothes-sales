package org.xeahsoon.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.xeahsoon.mapper.MemberMapper;
import org.xeahsoon.pojo.Member;
import org.xeahsoon.service.MemberService;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<Member> listAllMembers() {
		return memberMapper.showMembers();
	}

	@Override
	public int checkPhoneIfExist(String phone) {
		return memberMapper.countPhone(phone);
	}

	@Override
	public int addMember(String phone, String name, String birth) {
		return memberMapper.addMember(phone, name, birth);
	}

	@Override
	public int deleteMember(int id) {
		return memberMapper.deleteMember(id);
	}

	@Override
	public int updateMemberInfo(String name, Date birth, Double discount, String phone) {
		return memberMapper.updataMemberByPhone(name, birth, discount, phone);
	}

	@Override
	public int getMemberIdByPhone(String phone) {
		return memberMapper.getMemberIdByPhone(phone);
	}

}
