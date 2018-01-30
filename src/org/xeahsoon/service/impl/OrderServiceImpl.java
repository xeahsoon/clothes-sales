package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.OrderMapper;
import org.xeahsoon.mapper.StaffMapper;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.Staff;
import org.xeahsoon.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private StaffMapper staffMapper;
	
	@Override
	public Order findOrderById(int id) {
		return orderMapper.findOrderById(id);
	}

	@Override
	public List<Order> listAllOrders() {
		return orderMapper.listAllOrders();
	}

	@Override
	public int addOrderRemark(String remark, int order_id) {
		return orderMapper.addRemark(remark, order_id);
	}

	@Override
	public int printOrder(int order_id) {
		return orderMapper.printOrder(order_id);
	}
}
