package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `code` int(13) unsigned zerofill NOT NULL COMMENT '条形码',
  `color` varchar(8) DEFAULT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣',
  `price` double(6,2) NOT NULL COMMENT '单价',
  `dis_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  PRIMARY KEY (`id`),
  KEY `fk_od_order` (`order_id`),
  KEY `uq_code` (`code`) USING BTREE,
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
 */
public class OrderDetail implements Serializable{
	
	private int id;			//明细编号
	private int order_id;			//销售单编号
	private int code;			//商品编号
	private String color;
	private String size;
	private double discount;		//折扣
	private double price;			//单价
	private double dis_price;
	
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
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDis_price() {
		return dis_price;
	}
	public void setDis_price(double dis_price) {
		this.dis_price = dis_price;
	}
	
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", order_id=" + order_id + ", code=" + code + ", color=" + color + ", size="
				+ size + ", discount=" + discount + ", price=" + price + ", dis_price=" + dis_price + "]";
	}
}
