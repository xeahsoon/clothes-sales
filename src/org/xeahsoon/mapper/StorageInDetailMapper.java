package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.StorageInDetail;

public interface StorageInDetailMapper {
	
	/**
	 * @param id
	 * @return 指定入库单的所有明细
	 */
	@Select("select * from storagein_detail where storagein_id = #{id}")
	List<StorageInDetail> getStorageInDetailsById(@Param("id")int id);
	
	/**
	 * @param storagein_id
	 * @param storage_id
	 * @param good_id
	 * @param type
	 * @param color
	 * @param size
	 * @return 插入一条入库单明细
	 */
	@Insert("insert into storagein_detail(storagein_id, storage_id, good_id, type, color, size) "
			+ "values(#{storagein_id}, #{storage_id}, #{good_id}, #{type}, #{color}, '${size}')")
	int intsertOneStorageInDetail(
			@Param("storagein_id")int storagein_id,
			@Param("storage_id")int storage_id,
			@Param("good_id")int good_id,
			@Param("type")String type,
			@Param("color")String color,
			@Param("size")String size);
}
