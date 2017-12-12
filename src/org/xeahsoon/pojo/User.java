package org.xeahsoon.pojo;

import java.io.Serializable;

/**
CREATE TABLE `user` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
 **/
public class User implements Serializable{

	private int id;
	private String loginname;
	private String password;
	private String name;
	private String phone;
	private int status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", loginname=" + loginname + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", status=" + status + "]";
	}
}
