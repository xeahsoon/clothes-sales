package org.xeahsoon.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * @author user
CREATE TABLE `member` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(13) NOT NULL COMMENT '会员卡号',
  `name` varchar(20) NOT NULL COMMENT '会员姓名',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会员生日',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '会员折扣',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 */
public class Member implements Serializable{
	
	private int id;
	private String phone;
	private String name;
	private Date birthday;
	private double discount;
	private int score;
	private Date intime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public Date getIntime() {
		return intime;
	}
	public void setIntime(Date intime) {
		this.intime = intime;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", phone=" + phone + ", name=" + name + ", birthday=" + birthday + ", discount="
				+ discount + ", score=" + score + ", intime=" + intime + "]";
	}
}
