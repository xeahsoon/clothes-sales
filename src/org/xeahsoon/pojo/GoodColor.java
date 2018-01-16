package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `good_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_color` varchar(8) NOT NULL COMMENT '商品颜色',
  PRIMARY KEY (`id`),
  KEY `fk_gc_good` (`good_id`),
  CONSTRAINT `fk_gc_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
 *
 */
public class GoodColor implements Serializable{

	private static final long serialVersionUID = 7162174953339647524L;
	
	private int id;
	private int good_id;
	private String good_color;
	
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
	public String getGood_color() {
		return good_color;
	}
	public void setGood_color(String good_color) {
		this.good_color = good_color;
	}
	
	@Override
	public String toString() {
		return "GoodColor [id=" + id + ", good_id=" + good_id + ", good_color=" + good_color + "]";
	}
}
