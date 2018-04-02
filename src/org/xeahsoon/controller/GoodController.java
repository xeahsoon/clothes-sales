package org.xeahsoon.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Good;
import org.xeahsoon.pojo.Storage;
import org.xeahsoon.pojo.StorageIn;
import org.xeahsoon.pojo.StorageInTemp;
import org.xeahsoon.service.GoodService;
import org.xeahsoon.service.StorageService;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

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
		List<JSONObject> left_storage = storageService.getGoodLeftColorAndSize(good.getId());
		List<Good> good_list = goodService.listAllGoods();
		
		JSONArray storage_array = new JSONArray();
		for(Good g: good_list) {
			Set<String> colors = new HashSet<String>();
			Set<String> sizes = new HashSet<String>();
			int left = 0;
			List<JSONObject> storage = storageService.getGoodLeftColorAndSize(g.getId());
			for(JSONObject j : storage) {
				colors.add(j.getString("color"));
				sizes.add(j.getString("size"));
				left += j.getIntValue("left");
			}
			
			// 去掉任何"[" "," "]"
			String regEx = "[\\[,\\]]";
			
			JSONObject jobj = (JSONObject) JSONObject.toJSON(g);
			jobj.put("color", colors.toString().replaceAll(regEx, ""));
			jobj.put("size", sizes.toString().replaceAll(regEx, ""));
			jobj.put("left", left);
			
			storage_array.add(jobj);
		}
		
		model.addAttribute("good", good);
		model.addAttribute("left_storage", left_storage);
		model.addAttribute("storage_array", storage_array);
		
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
	
	/**
	 * @param good_id
	 * @param model
	 * @return 查询指定商品ID
	 */
	@RequestMapping("/searchGood/{good_id}")
	public String searchGoodInfo(
			@PathVariable(value="good_id")int good_id,
			Model model) {
		
		Good good = goodService.findGoodInfoWithID(good_id);
		List<JSONObject> left_storage = storageService.getGoodLeftColorAndSize(good.getId());
		List<Good> good_list = goodService.listAllGoods();
		
		JSONArray storage_array = new JSONArray();
		for(Good g: good_list) {
			Set<String> colors = new HashSet<String>();
			Set<String> sizes = new HashSet<String>();
			int left = 0;
			List<JSONObject> storage = storageService.getGoodLeftColorAndSize(g.getId());
			for(JSONObject j : storage) {
				colors.add(j.getString("color"));
				sizes.add(j.getString("size"));
				left += j.getIntValue("left");
			}
			
			// 去掉任何"[" "," "]"
			String regEx = "[\\[,\\]]";
			
			JSONObject jobj = (JSONObject) JSONObject.toJSON(g);
			jobj.put("color", colors.toString().replaceAll(regEx, ""));
			jobj.put("size", sizes.toString().replaceAll(regEx, ""));
			jobj.put("left", left);
			
			storage_array.add(jobj);
		}
		
		model.addAttribute("good", good);
		model.addAttribute("left_storage", left_storage);
		model.addAttribute("storage_array", storage_array);
		
		return "searchGood";
	}
	
	/**
	 * @param model
	 * @return 转发库存进货页面
	 */
	@RequestMapping("/storageIn")
	public String storageIn(Model model) {
		
		List<Good> good_list = goodService.listAllGoods();
		List<StorageInTemp> temp_list = storageService.getStorageInTempList();

		model.addAttribute("good_list", good_list);
		model.addAttribute("temp_list", temp_list);
		
		return "storageIn";
	}
	
	/**
	 * @param id 款号
	 * @return 后台检索条形码是否存在
	 */
	@ResponseBody
	@RequestMapping("/checkStorageID")
	public int checkStorageID(int id) {
		Storage storage = storageService.getStorageWithId(id);
		if(storage != null) {
			return 1;
		}
		return 0;
	}
	
	/**
	 * @param params
	 * @return 读取单件商品到StorageInTemp
	 */
	@ResponseBody
	@RequestMapping("/addStorageInTemp")
	public int addStorageInTemp(@RequestParam("params")String params) {
		
		JSONObject data = JSONObject.parseObject(params);
		
		try {
			storageService.addSingleItemToStorageInTemp(
				data.getIntValue("storage_id"),
				data.getIntValue("good_id"), 
				data.getString("type"),
				data.getString("color"),
				data.getString("size"),
				data.getDoubleValue("price"));
		} catch(DuplicateKeyException e) {
			return -1;
		}
		return 1;
	}
	
	/**
	 * @param id
	 * @return 从StorageInTemp删除一条信息
	 */
	@ResponseBody
	@RequestMapping("/deleteStorageInTemp")
	public int deleteStorageInTemp(@RequestParam("id")int id) {
		int result = storageService.deleteOneStorageInTemp(id);
		return result;
	}
	
	/**
	 * @return 清空StorageInTemp并保存至Storage
	 */
	@ResponseBody
	@RequestMapping("/saveTempToStorageIn")
	public int saveTempStorageIn(int user_id) {

		List<StorageInTemp> temp_list = storageService.getStorageInTempList();
		
		int storagein_id = storageService.makeStorageIn(user_id, temp_list.size());
		// 如果插入ID返回0 则入库失败
		if(storagein_id == 0) {
			return -1;
		}

		// 遍历StorageInTemp表所有条目
		for(StorageInTemp temp : temp_list) {
			// 将条目存入storage
			storageService.insertOneStorge(temp.getStorage_id(), temp.getGood_id(), temp.getColor(), temp.getSize());
			// 将storage_id存入入库明细单
			storageService.insertOneStorageInDetail(storagein_id, temp.getStorage_id(), temp.getGood_id(), temp.getType(), temp.getColor(), temp.getSize());
		}
		// 清空storagein_temp表
		storageService.emptyStorageInTemp();
		
		return 1;
	}
	
	/**
	 * @param id
	 * @return 请求商品详细信息
	 */
	@ResponseBody
	@RequestMapping("/getColorAndSize")
	public Good getGoodColorAndSize(@RequestParam("id")int id) {
		
		Good good = goodService.findGoodInfoWithID(id);
		return good;
	}
	
	/**
	 * @param model
	 * @return 转发storageInHistory页面
	 */
	@RequestMapping("/storageInHistory")
	public String storageInHistory(Model model) {
		
		List<StorageIn> storagein_list = storageService.getAllStorageIn();
		model.addAttribute("storagein_list", storagein_list);
		
		return "storageInHistory";
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
	 * @param model
	 * @return 转发商品信息管理页面
	 */
	@RequestMapping("/good")
	public String sendGoodPage(Model model) {
		
		List<Good> good_list = goodService.listAllGoodsIncludeColorSize();
		model.addAttribute("good_list", good_list);
		
		return "good";
	}
	
	/**
	 * @param params
	 * @return 保存商品信息
	 */
	@ResponseBody
	@RequestMapping("/saveGood")
	public int addNewGood(@RequestParam("params")String params) {
		JSONObject data = JSONObject.parseObject(params);
		JSONArray color = data.getJSONArray("color");
		JSONArray size = data.getJSONArray("size");
		int good_id = data.getIntValue("id");
		String opt = data.getString("opt");
		// 基础信息
		if("add".equals(opt)) {
			try {
				goodService.addNewGood(good_id, data.getString("type"), data.getString("fabric"), data.getDoubleValue("price"));
			} catch(DuplicateKeyException e) {
				return -1;
			}
		} else if("modify".equals(opt)) {
			goodService.updateGood(data.getString("type"), data.getString("fabric"), data.getDoubleValue("price"), good_id);
			goodService.emptyGoodColor(good_id);
			goodService.emptyGoodSize(good_id);
		}
		// 添加商品颜色
		for(int i=0; i<color.size(); i++) {
			goodService.addGoodColor(good_id, color.getString(i));
		}
		// 添加商品尺码
		for(int i=0; i<size.size(); i++) {
			goodService.addGoodSize(good_id, size.getString(i));
		}
		// 更新存储图片
		String picture = data.getString("picture");
		if(picture != null) {
			goodService.updateGoodPicture(picture, good_id);
		}
		
		return 1;
	}
	
	/**
	 * 处理testData请求
	 * */
	@ResponseBody
	@RequestMapping(value="/goodSuggest")
	public List<Good> listGoods(){
		
		List<Good> good_list = goodService.listAllGoods();
		
		return good_list;
	}
	
	/**
	 * 处理loading请求
	 * */
	@SuppressWarnings("static-access")
	@ResponseBody
	@RequestMapping(value="/loading")
	public int loading(@RequestParam("delay")int delay){
		
		try {
			Thread.currentThread().sleep(delay*1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
