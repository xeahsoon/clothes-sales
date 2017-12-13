package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Member;

/**
 * MemberMapper接口
 * */
public interface MemberMapper {
	
	@Select("select * from member where id=#{id}")
	Member selectMemberById(@Param("id")int id);
	
	@Select("select * from member")
	List<Member> showMembers();
	
}
