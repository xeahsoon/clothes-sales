package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.StorageInTemp;

public interface StorageInTempMapper {
	
	/**
	 * @return 所有临时入库明细
	 */
	@Select("select * from storagein_temp")
	List<StorageInTemp> getStorageInTempList();

	/**
	 * @param storage_id
	 * @param good_id
	 * @param type
	 * @param color
	 * @param price
	 * @return 增加一条临时入库信息结果
	 */
	@Insert("insert into storagein_temp(storage_id, good_id, type, color, size, price)"
			+ "values(#{storage_id}, #{good_id}, #{type}, #{color}, '${size}', #{price})")
	int addSingleItemToTemp(
			@Param("storage_id")int storage_id,
			@Param("good_id")int good_id,
			@Param("type")String type,
			@Param("color")String color,
			@Param("size")String size,
			@Param("price")double price);
	
	/**
	 * @param id
	 * @return 删除临时表条目
	 */
	@Delete("delete from storagein_temp where id = #{id}")
	int deleteOneStorageInTemp(@Param("id")int id);
	
	/**
	 * @return 清空临时入库单
	 */
	@Delete("delete from storagein_temp")
	int emptyStorageInTemp();
}
