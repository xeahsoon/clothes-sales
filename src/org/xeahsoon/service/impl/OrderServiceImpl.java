package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.OrderDetailMapper;
import org.xeahsoon.mapper.OrderMapper;
import org.xeahsoon.mapper.OrderStaffMapper;
import org.xeahsoon.mapper.OrderTempMapper;
import org.xeahsoon.mapper.StorageMapper;
import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.OrderTemp;
import org.xeahsoon.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderStaffMapper orderStaffMapper;
	
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Autowired
	private OrderTempMapper orderTempMapper;
	
	@Autowired
	private StorageMapper storageMapper;

	@Override
	public int insertOrder(int nums, double sum_money, int pay_mode, String remark, int user_id, int member_id) {
		int insertResult = orderMapper.insertOrder(nums, sum_money, pay_mode, remark, user_id, member_id);
		if(insertResult != 1) {
			return 0;
		} else {
			return orderMapper.getLastId();
		}
	}

	@Override
	public int insertOrderNoMember(int nums, double sum_money, int pay_mode, String remark, int user_id) {
		int insertResult = orderMapper.insertOrderNoMember(nums, sum_money, pay_mode, remark, user_id);
		if(insertResult != 1) {
			return 0;
		} else {
			return orderMapper.getLastId();
		}
	}

	@Override
	public int insertStaff(int order_id, int staff_id) {
		return orderStaffMapper.insertOrderStaff(order_id, staff_id);
	}

	@Override
	public int insertDetail(int order_id, int storage_id, int good_id, String color, String size, double price,
			double discount, double dis_price) {
		return orderDetailMapper.insertDetail(order_id, storage_id, good_id, color, size, price, discount, dis_price);
	}
	
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

	@Override
	public int deleteStorage(int storage_id) {
		return storageMapper.deleteOneStorage(storage_id);
	}

	@Override
	public int returnToStorage(int id, int good_id, String color, String size) {
		return storageMapper.returnToStorage(id, good_id, color, size);
	}

	@Override
	public int updateDetailFlag(int order_id, int storage_id) {
		return orderDetailMapper.updateDetailFlag(order_id, storage_id);
	}

	@Override
	public int updateOrderFlag(int order_id) {
		return orderMapper.updateOrderReturnFlag(order_id);
	}
	
	@Override
	public int updateOrderNumsAndMoney(int order_id) {
		return orderMapper.updateOrderNumAndeMoney(order_id);
	}
}
