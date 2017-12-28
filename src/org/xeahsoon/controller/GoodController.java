package org.xeahsoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
