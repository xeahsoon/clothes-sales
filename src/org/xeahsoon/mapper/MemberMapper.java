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
	
	/**
	 * @param id 会员ID
	 * @return 指定ID的会员信息
	 */
	@Select("select * from member where id=#{id}")
	Member selectMemberById(@Param("id")int id);
	
	/**
	 * @return 返回所有会员信息
	 */
	@Select("select * from member")
	List<Member> showMembers();
	
	/**
	 * @param phone 手机号码
	 * @return 返回手机号所存在个数
	 */
	@Select("select count(*) from member where phone=#{phone}")
	int countPhone(@Param("phone")String phone);
	
	/**
	 * @param phone 手机号码
	 * @param name 姓名
	 * @param birth 生日
	 * @return 添加会员信息，返回结果
	 */
	@Insert("insert into member(phone, name, birthday) values(#{phone}, #{name}, #{birthday})")
	int addMember(@Param("phone")String phone, @Param("name")String name, @Param("birthday")String birth);

	/**
	 * @param id 会员ID
	 * @return 删除会员结果
	 */
	@Delete("delete from member where id=#{id}")
	int deleteMember(@Param("id")int id);
	
	/**
	 * @param name 姓名
	 * @param birth 生日
	 * @param discount 折扣
	 * @param phone 手机号码
	 * @return 返回更新会员信息结果
	 */
	@Update("update member set name=#{name}, birthday=#{birthday}, discount=#{discount}"
			+ "where phone = #{phone}")
	int updataMemberByPhone(@Param("name")String name, @Param("birthday")Date birth,
			@Param("discount")double discount, @Param("phone")String phone);
}
