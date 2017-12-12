package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `order_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `staff_id` int(4) unsigned zerofill NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`id`),
  KEY `fk_os_order` (`order_id`),
  KEY `fk_os_staff` (`staff_id`),
  CONSTRAINT `fk_os_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_os_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 */
public class OrderStaff implements Serializable{
	
	private int id;			
	private int order_id;			//订单编号
	private Staff staff;			//导购员编号
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	
	@Override
	public String toString() {
		return "OrderStaff [id=" + id + ", order_id=" + order_id + ", staff=" + staff + "]";
	}
}
