package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Good;

/**
 * User服务层接口
 * */
public interface GoodService {
	
	/**
	 * @param id 商品编号
	 * @return 商品信息
	 */
	Good findSimpleGoodInfoById(int id);
	
	/**
	 * @param id 商品ID
	 * @return 指定ID的商品信息，包括所有颜色和尺码
	 */
	Good findGoodInfoWithID(int id);
	
	/**
	 * @return 所有商品
	 */
	List<Good> listAllGoods();
	
	/**
	 * @return 所有商品信息包括颜色和尺码
	 */
	List<Good> listAllGoodsIncludeColorSize();
	
	/**
	 * @return 新进商品
	 */
	Good findLastGood();
	
	int addNewGood(int id, String type, String fabric, double price);
	
	int addGoodColor(int id, String color);
	
	int addGoodSize(int id, String size);
	
	int emptyGoodColor(int id);
	
	int emptyGoodSize(int id);
	
	int updateGood(String type, String fabric, double price, int id);
	
	int updateGoodPicture(String picture, int id);

}
