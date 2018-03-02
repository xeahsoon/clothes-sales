package org.xeahsoon.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	class StaffSales {
		private String name;
		private int good_num;
		private int order_num;
		private double ave_good;
		private double ave_order;
		private double effort;

		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getGood_num() {
			return good_num;
		}
		public void setGood_num(int good_num) {
			this.good_num = good_num;
		}
		public int getOrder_num() {
			return order_num;
		}
		public void setOrder_num(int order_num) {
			this.order_num = order_num;
		}
		public double getAve_good() {
			return ave_good;
		}
		public void setAve_good(double ave_good) {
			this.ave_good = ave_good;
		}
		public double getAve_order() {
			return ave_order;
		}
		public void setAve_order(double ave_order) {
			this.ave_order = ave_order;
		}
		public double getEffort() {
			return effort;
		}
		public void setEffort(double effort) {
			this.effort = effort;
		}
		
		@Override
		public String toString() {
			return "StaffSales [name=" + name + ", good_num=" + good_num + ", order_num=" + order_num + ", ave_good="
					+ ave_good + ", ave_order=" + ave_order + ", effort=" + effort + "]";
		}
	}
	
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
	
	@RequestMapping("/refreshTempOrder")
	public String refreshTempOrder(Model model) {
		
		List<OrderTemp> temp_list = orderService.getTempList();
		model.addAttribute("temp_list", temp_list);
		
		return "tempOrderBody";
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
		
		System.err.println(user_id);
		System.err.println(member_phone.length()>0? member_phone: "没有会员信息");
		System.err.println(pay_money);
		System.err.println(pay_mode);
		System.err.println(remark.length()>0? remark: "没有备注信息");
		
		for(int i=0; i<types.length; i++) {
			System.err.println(types[i] + " " + prices[i] + " " + discounts[i] + " " + dis_prices[i]);
		}
		
		/* 此处应有事务开始 */
		
		int order_id = 0;
		if(member_phone.length() > 0) {
			// 通过member_phone获取member_id
			int member_id = memberService.getMemberIdByPhone(member_phone);
			// 存入信息到order表
			order_id = orderService.insertOrder(discounts.length, pay_money, pay_mode, remark, user_id, member_id);
			// 增加会员积分
			memberService.addMemberScore(pay_money, member_id);
		} else {
			order_id = orderService.insertOrderNoMember(discounts.length, pay_money, pay_mode, remark, user_id);
		}
		
		// 把staffs存入order_staff表
		for(int i=0; i<staffs.length; i++) {
			orderService.insertStaff(order_id, staffs[i]);
		}
		
		// 把order_temp存入order_detail表
		List<OrderTemp> ot = orderService.getTempList();
		for(int i=0; i<types.length; i++) {
			orderService.insertDetail(order_id, ot.get(i).getStorage_id(), ot.get(i).getGood().getId(), ot.get(i).getColor(), 
					ot.get(i).getSize(), prices[i], discounts[i], dis_prices[i]);
			// 删除storage表商品
			orderService.deleteStorage(ot.get(i).getStorage_id());
		}
		
		// 清空order_temp表
		orderService.clearTempTable();
		
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
	
	//销售退货
	@ResponseBody
	@RequestMapping(value="/returnGoods")
	public String returnGoods(
			@RequestParam(value = "order_id")int order_id,
			@RequestParam(value = "goods[]")int[] goods) {

		// 删除detail表 order_id中 goods
		for(int storage_id: goods) {
			orderService.deleteSingleOrderDetail(order_id, storage_id);
		}
		// 更新order数量和金额信息
		orderService.updateOrderNumsAndMoney(order_id);
		
		// 如果order中nums为0，则删除order信息
		int nums = orderService.findOrderById(order_id).getNums();
		if(nums == 0) {
			orderService.deleteOrder(order_id);
		}
		
		return "orderDetail/" + order_id;
	}
	
	//计算导购员业绩
	@RequestMapping(value="/staffsales")
	public String countStaffMoney(Model model) {
		
		// 订单列表
		List<Order> order_list = orderService.listAllOrders();
		// 销售数据列表
		Map<String, StaffSales> staff_sales = new HashMap<String, StaffSales>();
		
		// 遍历每条订单
		for(Order o: order_list) {
			// 单笔订单的导购员列表
			List<OrderStaff> staffs = o.getStaffs();
			double sum = o.getSum_money();
			int ave = (int) (sum / staffs.size());
			// 遍历导购员列表
			for(OrderStaff os: o.getStaffs()) {
				// 获取单个导购员编号
				String staff_name = os.getStaff().getName();
				// 存在则更新，不存在则添加
				StaffSales sale = new StaffSales();
				if(staff_sales.containsKey(staff_name)) {
					sale = staff_sales.get(staff_name);
					sale.setEffort(sale.getEffort() + ave);
				} else {
					sale.setEffort(ave);
				}
				staff_sales.put(staff_name, sale);
			}
			// 把零头存给该笔订单第一个员工
			if(sum > ave * staffs.size()) {
				// ?不知为何sum - ave * staffs.size()会出现很长很长的小数
				double left = sum - ave * staffs.size();
				left = Math.floor(left * 100) / 100;
				System.err.println("Sum: "+sum+"  R: " + ave*staffs.size() + "  Left: " + left);
				
				String first_staff_name = staffs.get(0).getStaff().getName();
				StaffSales sale = new StaffSales();
				sale = staff_sales.get(first_staff_name);
				sale.setEffort(sale.getEffort() + left);
				staff_sales.put(first_staff_name, sale);
			}
		}
		
		List<StaffSales> sales_list = new ArrayList<StaffSales>();
		for(String key : staff_sales.keySet()) {
			StaffSales sale = staff_sales.get(key); 
			sale.setName(key);
			sales_list.add(sale);
		}
		for(StaffSales sale: sales_list) {
			System.err.println(sale);
		}
		
		model.addAttribute("sales_list", sales_list);
		
		return "staffsales";
	}
	/*public String countStaffMoney(Model model) {
		// 订单列表
		List<Order> order_list = orderService.listAllOrders();
		// 存储导购员业绩的map<员工编号，总业绩金额>
		Map<Integer, Double> staff_sales = new HashMap<Integer, Double>();
		
		// 遍历每条订单
		for(Order o: order_list) {
			// 单笔订单的导购员列表
			List<OrderStaff> staffs = o.getStaffs();
			double sum = o.getSum_money();
			int ave = (int) (sum / staffs.size());
			// 遍历导购员列表
			for(OrderStaff os: o.getStaffs()) {
				// 获取单个导购员编号
				int staff_id = os.getStaff().getId();
				// 存在则更新，不存在则添加
				if(staff_sales.containsKey(staff_id)) {
					staff_sales.put(staff_id, staff_sales.get(staff_id) + ave);
				} else {
					staff_sales.put(staff_id, (double) ave);
				}
			}
			// 把零头存给该笔订单第一个员工
			if(sum > ave * staffs.size()) {
				// ?不知为何sum - ave * staffs.size()会出现很长很长的小数
				double left = sum - ave * staffs.size();
				left = Math.floor(left * 100) / 100;
				System.err.println("Sum: "+sum+"  R: " + ave*staffs.size() + "  Left: " + left);
				
				int first_staff_id = staffs.get(0).getStaff().getId();
				staff_sales.put(first_staff_id, staff_sales.get(first_staff_id) + left);
			}
		}
		
		model.addAttribute("staff_sales", staff_sales);
		
		return "staffsales";
	}*/
}
