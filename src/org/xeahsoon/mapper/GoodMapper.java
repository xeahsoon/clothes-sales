package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Good;
import org.xeahsoon.pojo.GoodColor;
import org.xeahsoon.pojo.GoodSize;

/**
 * UserMapper接口
 * */
public interface GoodMapper {

	@Select("select * from good_color where good_id = #{id}")
	List<GoodColor> listGoodColor(@Param("id")int id);
	
	@Select("select * from good_size where good_id = #{id}")
	List<GoodSize> listGoodSize(@Param("id")int id);

	/**
	 * @param id 商品编号
	 * @return 商品信息
	 */
	@Select("select * from good where id = #{id}")
	Good findSimpleGoodInfoByID(@Param("id")int id);
	
	/**
	 * @param id 商品ID
	 * @return 指定ID的商品信息，包括所有颜色和尺码
	 */
	@Select("select * from good where id = #{id}")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="type", property="type"),
		@Result(column="fabric", property="fabric"),
		@Result(column="price", property="price"),
		@Result(column="picture", property="picture"),
		@Result(column="id", property="good_color",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodColor")),
		@Result(column="id", property="good_size",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodSize"))
	})
	Good findGoodInfoWithID(@Param("id")int id);

	/**
	 * @return 系统内所有商品信息
	 */
	@Select("select * from good")
	List<Good> listAllGoods();
	
	/**
	 * @return 所有商品信息包括颜色和尺码
	 */
	@Select("select * from good")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="type", property="type"),
		@Result(column="fabric", property="fabric"),
		@Result(column="price", property="price"),
		@Result(column="picture", property="picture"),
		@Result(column="id", property="good_color",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodColor")),
		@Result(column="id", property="good_size",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodSize"))
	})
	List<Good> listAllGoodsIncludeColorSize();
	
	/**
	 * @return 新进商品
	 */
	@Select("select * from good order by id desc LIMIT 1;")
	@Results({
		@Result(id=true, column="id", property="id"),
		@Result(column="type", property="type"),
		@Result(column="fabric", property="fabric"),
		@Result(column="price", property="price"),
		@Result(column="picture", property="picture"),
		@Result(column="id", property="good_color",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodColor")),
		@Result(column="id", property="good_size",
		many=@Many(
			select = "org.xeahsoon.mapper.GoodMapper.listGoodSize"))
	})
	Good findLastGood();
}
