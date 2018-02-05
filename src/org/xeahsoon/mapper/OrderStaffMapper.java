package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.OrderStaff;

public interface OrderStaffMapper {
	
	/**
	 * @param order_id 订单号
	 * @param staff_id 员工ID
	 * @return 插入order_staff结果
	 */
	@Insert("insert into order_staff(order_id, staff_id) values(#{order_id}, #{staff_id})")
	int insertOrderStaff(@Param("order_id")int order_id, @Param("staff_id")int staff_id);
	
	/**
	 * @param order_id 订单编号
	 * @return 返回指定订单ID的订单导购员列表
	 */
	@Select("select * from order_staff where order_id = #{order_id}")
	@Results({
		@Result(column="id", property="id"),
		@Result(column="order_id", property="order_id"),
		@Result(column="staff_id", property="staff",
		one=@One(
				select="org.xeahsoon.mapper.StaffMapper.getStaffById"))
		})
	List<OrderStaff> listOrderStaffs(@Param("order_id")int order_id);
}
