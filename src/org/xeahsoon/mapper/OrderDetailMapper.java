package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.OrderDetail;

public interface OrderDetailMapper {
	
	@Select("select * from order_detail where order_id = #{order_id}")
	List<OrderDetail> listAllDetailsByID(@Param("order_id")int order_id);

}
