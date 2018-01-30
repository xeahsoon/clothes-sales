package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.Staff;

public interface OrderService {
	
	/**
	 * @param id 订单编号
	 * @return 根据编号返回订单
	 */
	Order findOrderById(int id);
	
	/**
	 * @return 返回所有订单
	 */
	List<Order> listAllOrders();
	
	/**
	 * @param remark 备注信息
	 * @param order_id 订单编号
	 * @return 更新订单备注结果
	 */
	int addOrderRemark(String remark, int order_id);
	
	/**
	 * @param order_id 订单编号
	 * @return 更新订单打印计数
	 */
	int printOrder(int order_id);
}
