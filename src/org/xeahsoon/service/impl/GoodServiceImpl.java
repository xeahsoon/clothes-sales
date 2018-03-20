package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.xeahsoon.mapper.GoodMapper;
import org.xeahsoon.pojo.Good;
import org.xeahsoon.service.GoodService;

/**
 * Good服务层接口实现类
 * @Service("goodService")用于将当前类注释为一个Spring的bean，名为goodService
 * */
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("goodService")
public class GoodServiceImpl implements GoodService {
	
	/**
	 * 自动注入GoodMapper
	 * */
	@Autowired
	private GoodMapper goodMapper;

	@Override
	public Good findSimpleGoodInfoById(int id) {
		return goodMapper.findSimpleGoodInfoByID(id);
	}
	
	@Override
	public Good findGoodInfoWithID(int id) {
		return goodMapper.findGoodInfoWithID(id);
	}
	
	@Override
	public List<Good> listAllGoods() {
		return goodMapper.listAllGoods();
	}

	@Override
	public List<Good> listAllGoodsIncludeColorSize() {
		return goodMapper.listAllGoodsIncludeColorSize();
	}
	
	@Override
	public Good findLastGood() {
		return goodMapper.findLastGood();
	}

}
