package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Storage;

public interface StorageMapper {
	
	//列出所有同款商品的库存
	@Select("select * from storage where good_id = #{good_id}")
	List<Storage> listSameGoods(@Param("good_id")int good_id);
	
	//从库存拿出条形码为ID的商品
	@Select("select * from storage where id = #{id}")
	List<Storage> getStorageWithId(@Param("id")int id);
	
	//列出所有库存
	@Select("select * from storage")
	List<Storage> listAllStorages();
}
