package org.xeahsoon.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * @author Administrator
CREATE TABLE `good` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `fabric` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '价格',
  `picture` varchar(15) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17207004 DEFAULT CHARSET=utf8;
 *
 */
public class Good implements Serializable{
	
	private static final long serialVersionUID = 3688204298438442641L;
	
	private int id;		//款号
	private String type;		//类型
	private String fabric;		//面料
	private double price;		//价格
	private String picture;		//图片
	
	private List<GoodColor> good_color;		//预存商品颜色
	private List<GoodSize> good_size;		//预存商品尺寸
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFabric() {
		return fabric;
	}
	public void setFabric(String fabric) {
		this.fabric = fabric;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public List<GoodColor> getGood_color() {
		return good_color;
	}
	public void setGood_color(List<GoodColor> good_color) {
		this.good_color = good_color;
	}
	public List<GoodSize> getGood_size() {
		return good_size;
	}
	public void setGood_size(List<GoodSize> good_size) {
		this.good_size = good_size;
	}
	
	@Override
	public String toString() {
		return "Good [id=" + id + ", type=" + type + ", fabric=" + fabric + ", price=" + price + ", picture=" + picture
				+ ", good_color=" + good_color + ", good_size=" + good_size + "]";
	}
}
