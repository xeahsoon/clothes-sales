package org.xeahsoon.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.xeahsoon.pojo.Good;

/**
 * User服务层接口
 * */
public interface GoodService {
	
	Good findGoodInfoWithID(int id);
	
	List<Good> listAllGoods();
	
	Good findLastGood();

}
