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
import org.xeahsoon.pojo.OrderStaff;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.service.OrderService;
import org.xeahsoon.service.StaffService;

@Controller
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	@Autowired
	@Qualifier("staffService")
	private StaffService staffService;
	
	
	@RequestMapping("/makeOrder")
	public String makeOrderPage(Model model) {
		
		List<Staff> verified_staff = staffService.listVerifiedStaffs();
		List<OrderStaff> recent_staff = orderService.listAllOrders().get(0).getStaffs();
		
		//借助staff.status属性，存储是否为最近一笔订单的员工
		int i, j;
		for(i=0; i<verified_staff.size(); i++) {
			for(j=0; j<recent_staff.size(); j++) {
				if(verified_staff.get(i).getId() == recent_staff.get(j).getStaff().getId()) {
					verified_staff.get(i).setStatus(1);
					break;
				}
			}
			if(j >= recent_staff.size()) {
				verified_staff.get(i).setStatus(0);
			}
		}
		
		model.addAttribute("verified_staff", verified_staff);
		
		return "makeOrder";
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
	
	//后台检索单号是否存在
	@ResponseBody
	@RequestMapping("/checkOrderID")
	public int checkOrderID(int id) {
		Order order = orderService.findOrderById(id);
		if(order != null) {
			return 1;
		}
		return 0;
	}
	
	//搜索订单返回前台
	@RequestMapping("/searchOrder")
	public String searchOrder(String order_id,
			Model model) {
		
		Order order = orderService.findOrderById(Integer.parseInt(order_id));
		model.addAttribute("order", order);
		
		return "orderDetail";
	}
	
	//打印销售单
	@ResponseBody
	@RequestMapping("/printOrder/{order_id}")
	public int printOrder(
			@PathVariable(value="order_id") int order_id) {
		int result = orderService.printOrder(order_id);
		return result;
	}
	
	//添加订单备注
	@ResponseBody 
	@RequestMapping(value="/addRemark")
	public Order addRemark(int id, String remark) {
		   
		orderService.addOrderRemark(remark, id);
		Order order = orderService.findOrderById(id);
		
		return order;
	}
}
