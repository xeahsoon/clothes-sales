package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Storage;
import org.xeahsoon.pojo.StorageIn;
import org.xeahsoon.pojo.StorageInTemp;

import com.alibaba.fastjson.JSONObject;

public interface StorageService {

	List<Storage> listSameGoods(int code);
	
	List<Storage> listAllGoods();
	
	List<Storage> listUncheckedStorages();
	
	List<Storage> listCheckedStorages();
	
	int getStorageCheckFlag(int id);
	
	int checkOneStorage(int id);
	
	int uncheckAllStorages();
	
	int insertOneStorge(int id, int good_id, String color, String size);
	
	Storage getStorageWithId(int id);
	
	List<JSONObject> getGoodLeftColorAndSize(int good_id);
	
	/**
	 * 分界线..
	 */
	
	List<StorageIn> getAllStorageIn();
	
	List<StorageInTemp> getStorageInTempList();
	
	int addSingleItemToStorageInTemp(int storage_id, int good_id, String type, String color, String size, double price);
	
	int deleteOneStorageInTemp(int id);
	
	int emptyStorageInTemp();
	
	int makeStorageIn(int user_id, int nums);
	
	int insertOneStorageInDetail(int storagein_id, int storage_id);
}
