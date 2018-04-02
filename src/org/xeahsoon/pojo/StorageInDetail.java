package org.xeahsoon.pojo;

public class StorageInDetail {
	
	/**
	 * 入库明细主键
	 */
	private int id;
	
	private int storagein_id;
	private int storage_id;
	private int good_id;
	private String type;
	private String color;
	private String size;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStoragein_id() {
		return storagein_id;
	}
	public void setStoragein_id(int storagein_id) {
		this.storagein_id = storagein_id;
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
	
	@Override
	public String toString() {
		return "StorageInDetail [id=" + id + ", storagein_id=" + storagein_id + ", storage_id=" + storage_id
				+ ", good_id=" + good_id + ", type=" + type + ", color=" + color + ", size=" + size + "]";
	}
}
