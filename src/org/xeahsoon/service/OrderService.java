package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Order;
import org.xeahsoon.pojo.OrderTemp;

public interface OrderService {
	
	/**
	 * @param nums 订单商品件数
	 * @param sum_money 订单总金额
	 * @param pay_mode 支付方式
	 * @param remark 备注
	 * @param user_id 收银员ID
	 * @param member_id 会员ID
	 * @return [当前插入订单的单号ID]
	 */
	int insertOrder(int nums, double sum_money, int pay_mode, String remark, int user_id, int member_id);
	
	
	/**
	 * @param order_id 订单号
	 * @param staff_id 员工编号
	 * @return 插入order_staff结果
	 */
	int insertStaff(int order_id, int staff_id);
	
	/**
	 * @param order_id 订单编号
	 * @param storage_id 库存ID，即条形码
	 * @param good_id 款号
	 * @param color 颜色
	 * @param size 尺码
	 * @param price 单价
	 * @param discount 折扣
	 * @param dis_price 折后价
	 * @return 插入明细结果
	 */
	int insertDetail(int order_id, int storage_id, int good_id, String color, String size, double price, double discount, double dis_price);
	
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
	
	/**
	 * @return 返回临时订单表所有数据
	 */
	List<OrderTemp> getTempList();
	
	int checkStorageIfExist(int storage_id);
	
	/**
	 * @param storage_id 商品条形码
	 * @param good_id 款号
	 * @param color 颜色
	 * @param size 尺码
	 * @param discount 单间折扣
	 * @return 添加条目返回结果
	 */
	int addTempItem(int storage_id, int good_id, String color, String size);
	
	/**
	 * @param id 临时条目编号
	 * @return 删除条目结果
	 */
	int deleteTempItem(int id);
	
	/**
	 * @return 清空临时订单表结果
	 */
	int clearTempTable();
}
