package org.xeahsoon.controller;

import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author xeahsoon
 * 动态页面转发控制器
 */
@Controller
public class FormController{
	
	/**
	 * Echarts配置data类
	 */
	class EChartsData {
		
		// 用ordinal指定字段的顺序，如不指定，则会按照字段名排序
		@JSONField(ordinal = 1)
		private double value;

		@JSONField(ordinal = 2)
		private String name;
		
		public double getValue() {
			return value;
		}
		public void setValue(double value) {
			this.value = value;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}

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
	public List<EChartsData> sendDiagramData(@PathVariable int diaNumber) {
		
		String[] diaName = {"商品金额","商品数量","员工业绩","商品库存"};
		
		List<EChartsData> statics = new ArrayList<EChartsData>();
		
		for(int i=0; i<Math.floor(Math.random()*3)+5; i++) {
			EChartsData data = new EChartsData();
			data.setValue(Math.floor(Math.random()*100));
			data.setName("" + diaName[diaNumber] + (i+1));
			statics.add(data);
		}

		return statics;
	}
}

