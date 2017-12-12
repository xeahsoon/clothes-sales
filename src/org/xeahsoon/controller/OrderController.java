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
		
		for(Order o : order_list) {
			System.out.println(o.getId());
		}
		
		return "main";
	}
	
	//销售单明细
	@RequestMapping("/orderDetail/{order_id}")
	public String listOrderDetails(
			@PathVariable(value="order_id") int order_id,
			Model model) {
		
		List<OrderDetail> detail_list = orderService.listOrderDetails(order_id);
		model.addAttribute("detail_list", detail_list);
		
		return "orderDetail";
	}
	
	//打印销售单
	@RequestMapping("/printOrder/{order_id}")
	public String printOrder(
			@PathVariable(value="order_id") int order_id,
			Model model) {
		
		Order order = orderService.findOrderById(order_id);
		System.out.println(order.getUser());
		
		List<OrderDetail> detail_list = orderService.listOrderDetails(order_id);
		List<Staff> staff_list = orderService.listOrderStaffs(order_id);
		
		model.addAttribute("order", order);
		model.addAttribute("detail_list", detail_list);
		model.addAttribute("staff_list", staff_list);
		
		return "printOrder";
	}
	
	//添加订单备注
	@RequestMapping("/addOrderRemark/{order_id}")
	public String addOrderRemark(@PathVariable("order_id")int order_id,
			Model model) {
		
		Order order = orderService.findOrderById(order_id);
		model.addAttribute("order", order);
		
		return "addOrderRemark";
	}
	
	@RequestMapping("/addRemark")
	public String addRemark(int order_id, String remark) {
		System.out.println("I am here to add remark!!!!!!!");
		
		orderService.addOrderRemark(remark, order_id);
		
		return "orderDetail/{order_id}";
	}
}
