package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.OrderMapper;
import org.xeahsoon.mapper.OrderTempMapper;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.OrderTemp;
import org.xeahsoon.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderTempMapper orderTempMapper;
	
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

	@Override
	public List<OrderTemp> getTempList() {
		return orderTempMapper.getTempList();
	}

	@Override
	public int checkStorageIfExist(int storage_id) {
		return orderTempMapper.checkStorageIfExist(storage_id);
	}

	@Override
	public int addTempItem(int storage_id, int good_id, String color, String size) {
		return orderTempMapper.addItem(storage_id, good_id, color, size);
	}

	@Override
	public int deleteTempItem(int id) {
		return orderTempMapper.deleteItem(id);
	}

	@Override
	public int clearTempTable() {
		return orderTempMapper.clearTempTable();
	}
}
