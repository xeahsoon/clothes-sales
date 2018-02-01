package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.OrderTemp;

/**
 * OrderTempMapper接口
 * */
public interface OrderTempMapper {
	
	/**
	 * @return 获取临时订单中所有数据
	 */
	@Select("select * from `order_temp`")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="storage_id", property="storage_id"),
		@Result(column="good_id", property="good", 
		one=@One(
			select = "org.xeahsoon.mapper.GoodMapper.findGoodInfoWithID")),
		@Result(column="color", property="color")
	})
	List<OrderTemp> getTempList();
	
	
	/**
	 * @param storage_id 条形码
	 * @return 查找结果
	 */
	@Select("select count(*) from `order_temp` where storage_id = #{storage_id}")
	int checkStorageIfExist(@Param("storage_id")int storage_id);
	
	/**
	 * @param storage_id 商品条形码
	 * @param good_id 款号
	 * @param color 颜色
	 * @param size 尺码
	 * @param discount 单间折扣
	 * @return 添加条目返回结果
	 */
	@Insert("insert into order_temp(storage_id, good_id, color, size) values(#{storage_id}, #{good_id}, #{color}, '${size}')")  //--DKW? 此处用#{size}会报错
	int addItem(@Param("storage_id")int storage_id, @Param("good_id")int good_id, @Param("color")String color, @Param("size")String size);
	
	/**
	 * @param id 条目编号
	 * @return 删除条目结果
	 */
	@Delete("delete from `order_temp` where id=#{id}")
	int deleteItem(@Param("id") int id);
	
	/**
	 * @return 清空临时订单表（返回值>=1）
	 */
	@Delete("delete from `order_temp`")
	int clearTempTable();
}
