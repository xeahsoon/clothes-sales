package org.xeahsoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.service.OrderService;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @author xeahsoon
 * 动态页面转发控制器
 */
@Controller
public class FormController{
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;

	/**
	 * @param formName 请求url
	 * @return 动态跳转页面
	 */
	@RequestMapping(value="/{formName}")
	 public String loginForm(@PathVariable String formName){
		return formName;
	}
	
	/**
	 * @param model
	 * @return 主页面控制器
	 */
	@RequestMapping("/main")
	public String sendMainPage(Model model) {
		
		List<Order> order_list = orderService.listAllOrders();

		model.addAttribute("order_list", order_list);
		
		return "main";
	}

	/**
	 * @return 比例图数据
	 */
	@ResponseBody
	@RequestMapping(value="/getDiagram/{diaNumber}")
	public JSONArray sendDiagramData(@PathVariable int diaNumber) {
		
		String[] diaName = {"商品金额","商品数量","员工业绩","商品库存"};
		JSONArray statics = new JSONArray();
		
		for(int i=0; i<Math.floor(Math.random()*3)+5; i++) {
			JSONObject obj = new JSONObject();
			obj.put("value", Math.floor(Math.random()*100));
			obj.put("name", "" + diaName[diaNumber] + (i+1));
			statics.add(obj);
		}
		return statics;
	}
}

