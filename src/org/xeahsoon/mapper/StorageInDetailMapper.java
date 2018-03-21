package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.StorageInDetail;

public interface StorageInDetailMapper {
	
	@Select("select * from storagein_detail where storagein_id = #{id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="storagein_id", property="storagein_id"),
		@Result(column="storage_id", property="storage",
		one=@One(
			select = "org.xeahsoon.mapper.StorageMapper.getStorageWithId")),
	})
	List<StorageInDetail> getStorageInDetailsById(@Param("id")int id);
	
	@Insert("insert into storagein_detail(storagein_id, storage_id) values(#{storagein_id}, #{storage_id})")
	int intsertOneStorageInDetail(@Param("storagein_id")int storagein_id, @Param("storage_id")int storage_id);
}
