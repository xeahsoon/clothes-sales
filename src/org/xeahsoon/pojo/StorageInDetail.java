package org.xeahsoon.pojo;

public class StorageInDetail {

	/**
	 * 入库明细主键
	 */
	private int id;
	
	/**
	 * 入库单号
	 */
	private int storagein_id;
	
	/**
	 * 商品编号（条形码）
	 */
	private int storage_id;
	
	/**
	 * 库存信息
	 */
	private Storage storage;
	
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
	public Storage getStorage() {
		return storage;
	}
	public void setStorage(Storage storage) {
		this.storage = storage;
	}
	
	@Override
	public String toString() {
		return "StorageInDetail [id=" + id + ", storagein_id=" + storagein_id + ", storage_id=" + storage_id + "]";
	}
}
