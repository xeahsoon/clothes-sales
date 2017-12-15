package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.OrderDetail;

public interface OrderDetailMapper {
	
	/*private int id;			//明细编号
	private int order_id;			//销售单编号
	private int storage_id;			//商品编号
	//private int good_id;
	private Good good;
	private String color;
	private String size;
	private double discount;		//折扣
	private double price;			//单价
	private double dis_price;*/
	
	@Select("select * from order_detail where order_id = #{order_id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="order_id", property="order_id"),
		@Result(column="storage_id", property="storage_id"),
		@Result(column="good_id", property="good",
		one=@One(
				select = "org.xeahsoon.mapper.GoodMapper.findGoodInfoWithID")),
		@Result(column="color", property="color"),
		@Result(column="size", property="size"),
		@Result(column="discount", property="discount"),
		@Result(column="price", property="price"),
		@Result(column="dis_price", property="dis_price")
	})
	List<OrderDetail> listAllDetailsByID(@Param("order_id")int order_id);

}
