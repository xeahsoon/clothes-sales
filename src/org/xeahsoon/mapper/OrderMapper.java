package org.xeahsoon.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.Member;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.User;

public interface OrderMapper {
/*	private int id;
	private Date create_date;
	private int print_count;
	private int nums;
	private double sum_money;
	private int pay_mode;
	private String remark;
	private User user;
	private Member member;*/
	@Select("select * from `order` where id=#{id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="create_date", property="create_date"),
		@Result(column="print_count", property="print_count"),
		@Result(column="nums", property="nums"),
		@Result(column="sum_money", property="sum_money"),
		@Result(column="pay_mode", property="pay_mode"),
		@Result(column="remark", property="remark"),
		@Result(column="user_id", property="user",
		one=@One(
			select = "org.xeahsoon.mapper.UserMapper.selectUserById")),
		@Result(column="member_id", property="member",
		one=@One(
			select = "org.xeahsoon.mapper.MemberMapper.selectMemberById")),
		@Result(column="id", property="staffs",
		many=@Many(
			select = "org.xeahsoon.mapper.OrderStaffMapper.listOrderStaffs")),
		@Result(column="id", property="details",
		many=@Many(
			select = "org.xeahsoon.mapper.OrderDetailMapper.listAllDetailsByID"))
	})
	Order findOrderById(@Param("id")int id);
	
	@Select("select * from `order` order by create_date")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="create_date", property="create_date"),
		@Result(column="print_count", property="print_count"),
		@Result(column="nums", property="nums"),
		@Result(column="sum_money", property="sum_money"),
		@Result(column="pay_mode", property="pay_mode"),
		@Result(column="remark", property="remark"),
		@Result(column="user_id", property="user",
		one=@One(
			select = "org.xeahsoon.mapper.UserMapper.selectUserById")),
		@Result(column="member_id", property="member",
		one=@One(
			select = "org.xeahsoon.mapper.MemberMapper.selectMemberById")),
		@Result(column="id", property="staffs",
		many=@Many(
			select = "org.xeahsoon.mapper.OrderStaffMapper.listOrderStaffs")),
		@Result(column="id", property="details",
		many=@Many(
			select = "org.xeahsoon.mapper.OrderDetailMapper.listAllDetailsByID"))
	})
	List<Order> listAllOrders();

	@Update("update `order` set remark = #{remark} where id = #{order_id}")
	int addRemark(@Param("remark")String remark, @Param("order_id")int order_id);
}
