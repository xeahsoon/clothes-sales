package org.xeahsoon.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.Member;

/**
 * MemberMapper接口
 * */
public interface MemberMapper {
	
	@Select("select * from member where phone=#{id}")
	Member selectMemberById(@Param("id")int id);
	
	@Select("select * from member")
	List<Member> showMembers();
	
	@Select("select count(*) from member where phone=#{phone}")
	int countPhone(@Param("phone")String phone);
	
	@Insert("insert into member(phone, name, birthday) values(#{phone}, #{name}, #{birthday})")
	int addMember(@Param("phone")String phone, @Param("name")String name, @Param("birthday")String birth);

	@Delete("delete from member where id=#{id}")
	int deleteMember(@Param("id")int id);
	
	@Update("update member set name=#{name}, birthday=#{birthday}, discount=#{discount}"
			+ "where phone = #{phone}")
	int updataMemberByPhone(@Param("name")String name, @Param("birthday")Date birth,
			@Param("discount")double discount, @Param("phone")String phone);
}
