package org.xeahsoon.pojo;

public class StorageInTemp {

	/**
	 * 临时表主键
	 */
	private int id;
	
	/**
	 * 条形码
	 */
	private int storage_id;
	
	/**
	 * 款号
	 */
	private int good_id;
	
	/**
	 * 类型
	 */
	private String type;
	
	/**
	 * 颜色
	 */
	private String color;
	
	/**
	 * 尺码
	 */
	private String size;
	
	/**
	 * 价格
	 */
	private double price;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStorage_id() {
		return storage_id;
	}
	public void setStorage_id(int storage_id) {
		this.storage_id = storage_id;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "StorageInTemp [id=" + id + ", storage_id=" + storage_id + ", good_id=" + good_id + ", type=" + type
				+ ", color=" + color + ", size=" + size + ", price=" + price + "]";
	}
}
