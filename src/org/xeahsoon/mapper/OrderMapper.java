package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.xeahsoon.pojo.Order;

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
	
	@Insert("insert into `order`(nums, sum_money, pay_mode, remark, user_id, member_id) "
			+ "values(#{nums}, #{sum_money}, #{pay_mode}, #{remark}, #{user_id}, #{member_id})")
	int insertOrder(
			@Param("nums")int nums,
			@Param("sum_money")double sum_money,
			@Param("pay_mode")int pay_mode,
			@Param("remark")String remark,
			@Param("user_id")int user_id,
			@Param("member_id")int member_id);
	
	@Select("select max(id) from `order`")
	int getLastId();
	
	/**
	 * @param id 订单编号
	 * @return 订单、会员、导购员信息、订单条目
	 */
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
	
	/**
	 * @return 按时间降序得到所有订单
	 */
	@Select("select * from `order` order by create_date desc")
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
	
	/**
	 * @param remark 备注内容
	 * @param order_id 订单编号
	 * @return 	更新订单备注影响条目数
	 */
	@Update("update `order` set remark = #{remark} where id = #{order_id}")
	int addRemark(@Param("remark")String remark, @Param("order_id")int order_id);
	
	/**
	 * @param order_id 订单编号
	 * @return 执行打印统计加1，返回影响条目数
	 */
	@Update("update `order` set print_count = print_count + 1 where id = #{order_id}")
	int printOrder(@Param("order_id")int order_id);
}
