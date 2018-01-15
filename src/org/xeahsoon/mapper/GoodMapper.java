package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Good;

/**
 * UserMapper接口
 * */
public interface GoodMapper {
	
	//根据商品编号查看商品信息
	@Select("select * from good where id = #{id}")
	Good findGoodInfoWithID(@Param("id")int id);
	
	//查看所有商品信息
	@Select("select * from good")
	List<Good> listAllGoods();
	
	@Select("select * from good order by id desc LIMIT 1;")
	Good findLastGood();

}
