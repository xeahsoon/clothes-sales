package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Storage;

public interface StorageMapper {

	@Select("select * from storage where good_id = #{good_id}")
	List<Storage> listSameGoods(@Param("good_id")int good_id);
	
	@Select("select * from storage where id = #{id}")
	List<Storage> getStorageWithId(@Param("id")int id);
	
	@Select("select * from storage")
	List<Storage> listAllStorages();
}
