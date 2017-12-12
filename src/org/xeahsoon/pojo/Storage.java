package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `storage` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  PRIMARY KEY (`id`),
  KEY `fk_storage_good` (`good_id`),
  CONSTRAINT `fk_storage_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
 */
public class Storage implements Serializable{
	
	private int id;			//商品条形码
	private int good_id;			//款号、外键
	private String color;			//颜色
	private String size;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
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
		return "Storage [id=" + id + ", good_id=" + good_id + ", color=" + color + ", size=" + size + "]";
	}
}
