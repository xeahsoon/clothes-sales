package org.xeahsoon.pojo;

import java.io.Serializable;

/**
 * @author Administrator
CREATE TABLE `manager` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
 */
public class Manager implements Serializable{
	
	private int id;
	private String loginname;
	private String password;
	private String name;
	
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
	
	@Override
	public String toString() {
		return "Manager [id=" + id + ", loginname=" + loginname + ", password=" + password + ", name=" + name + "]";
	}
}
