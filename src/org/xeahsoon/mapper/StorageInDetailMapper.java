package org.xeahsoon.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.StorageInDetail;

public interface StorageInDetailMapper {
	
	@Select("select * from storagein_detail from storagein where storagein_id = #{id}")
	StorageInDetail getStorageInDetailById(@Param("id")int id);
	
	@Insert("insert into storagein_detail(storagein_id, storage_id) values(#{storagein_id}, #{storage_id})")
	int intsertOneStorageInDetail(@Param("storagein_id")int storagein_id, @Param("storage_id")int storage_id);
}
