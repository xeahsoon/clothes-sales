package org.xeahsoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Good;
import org.xeahsoon.service.GoodService;

@Controller
public class GoodController {
	
	/**
	 * 自动注入goodService
	 * */
	@Autowired
	@Qualifier("goodService")
	private GoodService goodService;

	//商品查询主页，默认显示最新插入的商品信息
	@RequestMapping("/searchGood")
	public String searchGoodPage(Model model) {
		
		Good good = goodService.findLastGood();
		List<Good> good_list = goodService.listAllGoods();
		
		model.addAttribute("good", good);
		model.addAttribute("good_list", good_list);
		
		return "searchGood";
	}
	
	//后台检索单号是否存在
	@ResponseBody
	@RequestMapping("/checkGoodID")
	public int checkOrderID(int id) {
		Good good = goodService.findGoodInfoWithID(id);
		if(good != null) {
			return 1;
		}
		return 0;
	}
	
	//查询指定商品ID
	@RequestMapping("/searchGood/{good_id}")
	public String searchGoodInfo(
			@PathVariable(value="good_id")int good_id,
			Model model) {
		
		Good good = goodService.findGoodInfoWithID(good_id);
		List<Good> good_list = goodService.listAllGoods();
		
		model.addAttribute("good", good);
		model.addAttribute("good_list", good_list);
		
		return "searchGood";
	}
	
	/**
	 * 处理/main请求
	 * */
	@RequestMapping(value="/test")
	 public String listGoods(Model model){
		
		List<Good> good_list = goodService.listAllGoods();
		
		model.addAttribute("good_list", good_list);
		// 跳转到main页面
		return "test";
	}
	
}
