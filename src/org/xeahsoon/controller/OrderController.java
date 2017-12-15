package org.xeahsoon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.OrderDetail;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	//销售单列表
	@RequestMapping("/main")
	public String listOrders(Model model) {
		
		List<Order> order_list = orderService.listAllOrders();
		model.addAttribute("order_list", order_list);
		return "main";
	}
	
	//明细主页，默认显示最近一笔订单
	@RequestMapping("/orderDetail")
	public String orderDetailPage(Model model) {

		List<Order> order_list = orderService.listAllOrders();
		model.addAttribute("order", order_list.get(0));
		
		return "orderDetail";
	}
	
	//销售单明细
	@RequestMapping("/orderDetail/{order_id}")
	public String listOrderDetails(
			@PathVariable(value="order_id") int order_id,
			Model model) {
		
		Order order = orderService.findOrderById(order_id);
		model.addAttribute("order", order);
		
		return "orderDetail";
	}
	
	@RequestMapping("/searchOrder")
	public String searchOrder(String order_id,
			Model model) {
		
		Order order = orderService.findOrderById(Integer.parseInt(order_id));
		model.addAttribute("order", order);
		
		return "orderDetail";
	}
	
	//打印销售单
	@RequestMapping("/printOrder/{order_id}")
	public String printOrder(
			@PathVariable(value="order_id") int order_id,
			Model model) {
		
		Order order = orderService.findOrderById(order_id);
		System.out.println(order.getUser());
		
		model.addAttribute("order", order);
		
		return "printOrder";
	}
	
	//添加订单备注
	@RequestMapping("/addRemark")
	public String addRemark(int order_id, String remark) {
		System.out.println("I am here to add remark!!!!!!!: " + remark);
		   
		orderService.addOrderRemark(remark, order_id);
		
		return "main";
	}
}
