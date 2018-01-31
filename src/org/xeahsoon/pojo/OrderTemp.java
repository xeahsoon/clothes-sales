package org.xeahsoon.pojo;

import java.io.Serializable;

/**
CREATE TABLE `order_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '尺码',
  `discount` double(4,2) NOT NULL COMMENT '折扣',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ot_storage_id` (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 *
 * @author xeahsoon 2018/1/31
 */
public class OrderTemp implements Serializable{
	
	private static final long serialVersionUID = -1344800927604071967L;
	
	private int id;
	private int storage_id;
	private Good good;
	private String color;
	private String size;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStorage_id() {
		return storage_id;
	}
	public void setStorage_id(int storage_id) {
		this.storage_id = storage_id;
	}
	public Good getGood() {
		return good;
	}
	public void setGood(Good good) {
		this.good = good;
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
	
	@Override
	public String toString() {
		return "OrderTemp [id=" + id + ", storage_id=" + storage_id + ", good=" + good + ", color=" + color + ", size="
				+ size + "]";
	}
}
