package org.xeahsoon.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author Administrator
CREATE TABLE `order` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '订单主键',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `print_count` int(11) NOT NULL DEFAULT '0' COMMENT '打印统计',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '订单总件数',
  `sum_money` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `pay_mode` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式（1/银行卡 2/支付宝 3/微信 4/现金）',
  `remark` text COMMENT '订单备注',
  `user_id` int(4) unsigned zerofill NOT NULL COMMENT '收银员',
  `member_id` int(11) unsigned DEFAULT NULL COMMENT '会员卡号',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  KEY `fk_order_member` (`member_id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
 */
public class Order implements Serializable{
	
	private static final long serialVersionUID = 7088146011091960082L;
	
	private int id;
	private Date create_date;
	private int print_count;
	private int nums;
	private double sum_money;
	private int pay_mode;
	private String remark;
	private User user;
	private Member member;
	
	private List<OrderStaff> staffs;
	private List<OrderDetail> details;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getPrint_count() {
		return print_count;
	}
	public void setPrint_count(int print_count) {
		this.print_count = print_count;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public double getSum_money() {
		return sum_money;
	}
	public void setSum_money(double sum_money) {
		this.sum_money = sum_money;
	}
	public int getPay_mode() {
		return pay_mode;
	}
	public void setPay_mode(int pay_mode) {
		this.pay_mode = pay_mode;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OrderStaff> getStaffs() {
		return staffs;
	}
	public void setStaffs(List<OrderStaff> staffs) {
		this.staffs = staffs;
	}
	public List<OrderDetail> getDetails() {
		return details;
	}
	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	@Override
	public String toString() {
		return "Order [id=" + id + ", create_date=" + create_date + ", print_count=" + print_count + ", nums=" + nums
				+ ", sum_money=" + sum_money + ", pay_mode=" + pay_mode + ", remark=" + remark + ", user=" + user
				+ ", member=" + member + ", staffs=" + staffs + ", details=" + details + "]";
	}
}
