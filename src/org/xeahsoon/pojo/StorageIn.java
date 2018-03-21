package org.xeahsoon.pojo;

import java.util.Date;
import java.util.List;

public class StorageIn {

	/**
	 * 入库单号
	 */
	private int id;
	
	/**
	 * 操作用户
	 */
	private User user;
	
	/**
	 * 入库件数
	 */
	private int nums;
	
	/**
	 * 入库日期
	 */
	private Date create_date;
	
	/**
	 * 入库明细
	 */
	private List<StorageInDetail> details;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public List<StorageInDetail> getDetails() {
		return details;
	}
	public void setDetails(List<StorageInDetail> details) {
		this.details = details;
	}
	
	@Override
	public String toString() {
		return "StorageIn [id=" + id + ", user=" + user + ", nums=" + nums + ", create_date=" + create_date
				+ ", details=" + details + "]";
	}
}
