package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.StorageIn;

public interface StorageInMapper {
	
	@Select("select * from storagein")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="user_id", property="user",
		one=@One(
			select = "org.xeahsoon.mapper.UserMapper.selectUserById")),
		@Result(column="nums", property="nums"),
		@Result(column="create_date", property="create_date"),
		@Result(column="user_id", property="details",
		many=@Many(
			select = "org.xeahsoon.mapper.StorageInDetailMapper.getStorageInDetailById"))
	})
	List<StorageIn> getAllStorageIn();
	
	@Insert("insert into storagein(user_id, nums) values(#{user_id}, #{nums})")
	int makeStorageIn(@Param("user_id")int user_id, @Param("nums")int nums);
	
	@Select("select max(id) from `storagein`")
	int getLastId();
}
