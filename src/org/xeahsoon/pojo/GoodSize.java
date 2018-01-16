package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `good_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_size` varchar(4) NOT NULL COMMENT '商品尺码',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `fk_gs_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
 *
 */
public class GoodSize implements Serializable{

	private static final long serialVersionUID = 8248034407961216446L;
	
	private int id;
	private int good_id;
	private String good_size;
	
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
	public String getGood_size() {
		return good_size;
	}
	public void setGood_size(String good_size) {
		this.good_size = good_size;
	}
	
	@Override
	public String toString() {
		return "GoodSize [id=" + id + ", good_id=" + good_id + ", good_size=" + good_size + "]";
	}
}
