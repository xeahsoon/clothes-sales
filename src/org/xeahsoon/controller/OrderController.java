package org.xeahsoon.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.OrderStaff;
import org.xeahsoon.pojo.OrderTemp;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.pojo.Storage;
import org.xeahsoon.service.MemberService;
import org.xeahsoon.service.OrderService;
import org.xeahsoon.service.StaffService;
import org.xeahsoon.service.StorageService;

@Controller
public class OrderController {
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;

	@Autowired
	@Qualifier("staffService")
	private StaffService staffService;
	
	@Autowired
	@Qualifier("storageService")
	private StorageService storageService;
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	// 销售打单页面
	@RequestMapping("/makeOrder")
	public String makeOrderPage(Model model) {
		
		List<Staff> verified_staffs = staffService.listVerifiedStaffs();
		List<OrderStaff> recent_staffs = orderService.listAllOrders().get(0).getStaffs();
		List<OrderTemp> temp_list = orderService.getTempList();
		
		//借助staff.status属性，存储是否为最近一笔订单的员工
		int i, j;
		for(i=0; i<verified_staffs.size(); i++) {
			for(j=0; j<recent_staffs.size(); j++) {
				if(verified_staffs.get(i).getId() == recent_staffs.get(j).getStaff().getId()) {
					verified_staffs.get(i).setStatus(1);
					break;
				}
			}
			if(j >= recent_staffs.size()) {
				verified_staffs.get(i).setStatus(0);
			}
		}
		
		model.addAttribute("verified_staffs", verified_staffs);
		model.addAttribute("temp_list", temp_list);
		
		return "makeOrder";
	}
	
	// 读取商品条形码
	@ResponseBody
	@RequestMapping("/getOneStorage")
	public int getOneStorage(int id) {
		Storage item =  storageService.getStorageWithId(id);
		if(item == null) {
			return -1;
		} else {
			if(orderService.checkStorageIfExist(id) >= 1) {
				// 如果order_temp表已经存在该商品
				return 0;
			} else {
				// 添加商品信息到order_temp表
				int result = orderService.addTempItem(item.getId(), item.getGood().getId(), item.getColor(), item.getSize());
				return result;
			}
		}
	}
	
	// 删除条目
	@ResponseBody
	@RequestMapping("/deleteItem")
	public int deleteItem(int id) {
		return orderService.deleteTempItem(id);
	}
	
	// 清空临时订单
	@ResponseBody
	@RequestMapping("/deleteTempTable")
	public int deleteTempTable() {
		return orderService.clearTempTable();
	}
	
	// 支付订单
	@ResponseBody
	@RequestMapping("/payForOrder")
	public int payForOrder(
			@RequestParam(value = "user_id")int user_id,
			@RequestParam(value = "member_phone")String member_phone,
			@RequestParam(value = "pay_money")double pay_money,
			@RequestParam(value = "pay_mode")int pay_mode,
			@RequestParam(value = "remark")String remark,
			@RequestParam(value = "types[]")String[] types,
			@RequestParam(value = "prices[]")double[] prices,
			@RequestParam(value = "discounts[]")double[] discounts,
			@RequestParam(value = "dis_prices[]")double[] dis_prices,
			@RequestParam(value = "staffs[]")int[] staffs) {
		// 通过member_phone获取member_id
		int member_id = 0;
		if(member_phone.length() > 0) {
			member_id = memberService.getMemberIdByPhone(member_phone);
		}
		
		System.err.println(user_id);
		System.err.println(member_phone.length()>0? member_phone: "没有会员信息");
		System.err.println(pay_money);
		System.err.println(pay_mode);
		System.err.println(remark.length()>0? remark: "没有备注信息");
		
		for(int i=0; i<types.length; i++) {
			System.err.println(types[i] + " " + prices[i] + " " + discounts[i] + " " + dis_prices[i]);
		}
		
		
		/* 事务开始 */
		
		// 存入信息到order表
		int order_id = 4;
		//int order_id = orderService.insertOrder(discounts.length, pay_money, pay_mode, remark, user_id, member_id);
		
		// 把staffs存入order_staff表
		for(int i=0; i<staffs.length; i++) {
			orderService.insertStaff(order_id, staffs[i]);
		}
		
		// 把order_temp存入order_detail表，并清空order_temp表
		
		// 删除storage表商品
		
		/* 事务结束 */
		
		return 1;
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
