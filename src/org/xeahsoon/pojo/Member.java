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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 */
public class Member implements Serializable{
	
	private int id;
	private String phone;
	private String name;
	private Date birthday;
	
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
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", phone=" + phone + ", name=" + name + ", birthday=" + birthday + "]";
	}
}
