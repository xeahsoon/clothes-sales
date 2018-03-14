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
import org.xeahsoon.pojo.Storage;
import org.xeahsoon.service.GoodService;
import org.xeahsoon.service.StorageService;

@Controller
public class GoodController {
	
	/**
	 * 自动注入goodService
	 * */
	@Autowired
	@Qualifier("goodService")
	private GoodService goodService;
	
	@Autowired
	@Qualifier("storageService")
	private StorageService storageService;

	/**
	 * @param model
	 * @return 商品查询主页，默认显示最新插入的商品信息
	 */
	@RequestMapping("/searchGood")
	public String searchGoodPage(Model model) {
		
		Good good = goodService.findLastGood();
		List<Good> good_list = goodService.listAllGoods();
		
		model.addAttribute("good", good);
		model.addAttribute("good_list", good_list);
		
		return "searchGood";
	}
	
	/**
	 * @param id 款号
	 * @return 后台检索商品款号是否存在
	 */
	@ResponseBody
	@RequestMapping("/checkGoodID")
	public int checkGoodID(int id) {
		Good good = goodService.findSimpleGoodInfoById(id);
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
	
	@RequestMapping("/storageIn")
	public String storageIn(Model model) {
		
		List<Good> good_list = goodService.listAllGoods();
		
		model.addAttribute("good_list", good_list);
		
		return "storageIn";
	}
	
	/**
	 * @param model
	 * @return 转发库存盘点页面
	 */
	@RequestMapping("/checkStorage")
	public String checkStorage(Model model) {
		
		List<Storage> unchecked_list = storageService.listUncheckedStorages();
		List<Storage> checked_list = storageService.listCheckedStorages();
		
		model.addAttribute("unchecked_list", unchecked_list);
		model.addAttribute("checked_list", checked_list);
		
		return "checkStorage";
	}
	
	/**
	 * @param id 商品条形码
	 * @return 盘点单件货品结果
	 */
	@ResponseBody
	@RequestMapping("/checkOneStorage")
	public int checkOneStorage(int id) {
		int flag = storageService.getStorageCheckFlag(id);
		if(flag == 1) {
			return -1;
		}
		return storageService.checkOneStorage(id);
	}
	
	/**
	 * @return 清空所有盘点结果
	 */
	@ResponseBody
	@RequestMapping("/uncheckAllStorages")
	public int uncheckAllStorages() {
		return storageService.uncheckAllStorages();
	}
	
	/**
	 * 处理testData请求
	 * */
	@ResponseBody
	@RequestMapping(value="/goodSuggest")
	public List<Good> listGoods(Model model){
		
		List<Good> good_list = goodService.listAllGoods();
		
		return good_list;
	}
}
