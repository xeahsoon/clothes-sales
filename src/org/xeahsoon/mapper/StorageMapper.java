package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Storage;

public interface StorageMapper {
	
	/**
	 * @param good_id 商品ID
	 * @return 返回同款商品的库存信息
	 */
	@Select("select * from storage where good_id = #{good_id}")
	List<Storage> listSameGoods(@Param("good_id")int good_id);
	
	/**
	 * @param id 库存条形码
	 * @return 根据条形码取出商品
	 */
	@Select("select * from storage where id = #{id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="good_id", property="good", 
		one=@One(
			select = "org.xeahsoon.mapper.GoodMapper.findGoodInfoWithID")),
		@Result(column="color", property="color"),
		@Result(column="size", property="size")
	})
	Storage getStorageWithId(@Param("id")int id);

	/**
	 * @return 列出所有库存商品
	 */
	@Select("select * from storage")
	List<Storage> listAllStorages();
}
