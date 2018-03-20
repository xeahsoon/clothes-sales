package org.xeahsoon.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	
	/**
	 * @return 增加新商品结果
	 */
	@Insert("insert into good(id, type, fabric, price) values(#{id}, #{type}, #{fabric}, #{price})")
	int addNewGood(@Param("id")int id, @Param("type")String type, @Param("fabric")String fabric, @Param("price")double price);
	
	/**
	 * @param id
	 * @param color
	 * @return 增加单个商品颜色
	 */
	@Insert("insert into good_color(good_id, good_color) values(#{id}, #{color})")
	int addGoodColor(@Param("id")int id, @Param("color")String color);
	
	/**
	 * @param id
	 * @param size
	 * @return 增加单个商品尺码
	 */
	@Insert("insert into good_size(good_id, good_size) values(#{id}, '${size}')")
	int addGoodSize(@Param("id")int id, @Param("size")String size);
	
	/**
	 * @param id
	 * @return 清空商品颜色
	 */
	@Delete("delete from good_color where good_id=#{good_id}")
	int emptyGoodColor(@Param("good_id")int id);
	
	/**
	 * @param id
	 * @return 清空商品尺码
	 */
	@Delete("delete from good_size where good_id=#{good_id}")
	int emptyGoodSize(@Param("good_id")int id);
	
	/**
	 * @param type
	 * @param fabric
	 * @param price
	 * @param id
	 * @return 更新商品信息结果
	 */
	@Update("update good set type=#{type}, fabric=#{fabric}, price=#{price} where id=#{id}")
	int updateGood(@Param("type")String type, @Param("fabric")String fabric, @Param("price")double price, @Param("id")int id);

	/**
	 * @param picture
	 * @param id
	 * @return 更新商品图片
	 */
	@Update("update good set picture=#{picture} where id=#{id}")
	int updateGoodPicture(@Param("picture")String picture, @Param("id")int id);
}
