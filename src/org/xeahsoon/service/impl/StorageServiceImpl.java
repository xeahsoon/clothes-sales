package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.StorageInDetailMapper;
import org.xeahsoon.mapper.StorageInMapper;
import org.xeahsoon.mapper.StorageInTempMapper;
import org.xeahsoon.mapper.StorageMapper;
import org.xeahsoon.pojo.Storage;
import org.xeahsoon.pojo.StorageIn;
import org.xeahsoon.pojo.StorageInTemp;
import org.xeahsoon.service.StorageService;


@Service("storageService")
public class StorageServiceImpl implements StorageService {

	@Autowired
	private StorageMapper storageMapper;
	
	@Autowired
	private StorageInMapper storageInMapper;
	
	@Autowired
	private StorageInDetailMapper storageInDetailMapper;
	
	@Autowired
	private StorageInTempMapper storageInTempMapper;
	
	@Override
	public List<Storage> listSameGoods(int good_id) {
		return storageMapper.listSameGoods(good_id);
	}

	@Override
	public List<Storage> listAllGoods() {
		return storageMapper.listAllStorages();
	}
	
	@Override
	public List<Storage> listUncheckedStorages() {
		return storageMapper.listUncheckedStorages();
	}

	@Override
	public List<Storage> listCheckedStorages() {
		return storageMapper.listCheckedStorages();
	}

	@Override
	public int getStorageCheckFlag(int id) {
		return storageMapper.getStorageCheckFlag(id);
	}

	@Override
	public int checkOneStorage(int id) {
		return storageMapper.checkOneStorage(id);
	}

	@Override
	public int uncheckAllStorages() {
		return storageMapper.uncheckAllStorages();
	}

	@Override
	public int insertOneStorge(int id, int good_id, String color, String size) {
		return storageMapper.insertOneStorage(id, good_id, color, size);
	}

	@Override
	public Storage getStorageWithId(int id) {
		return storageMapper.getStorageWithId(id);
	}
	
	/**
	 * 分界线..
	 */
	
	@Override
	public List<StorageIn> getAllStorageIn() {
		return storageInMapper.getAllStorageIn();
	}

	@Override
	public List<StorageInTemp> getStorageInTempList() {
		return storageInTempMapper.getStorageInTempList();
	}

	@Override
	public int addSingleItemToStorageInTemp(int storage_id, int good_id, String type, String color, String size,
			double price) {
		return storageInTempMapper.addSingleItemToTemp(storage_id, good_id, type, color, size, price);
	}

	@Override
	public int deleteOneStorageInTemp(int id) {
		return storageInTempMapper.deleteOneStorageInTemp(id);
	}

	@Override
	public int emptyStorageInTemp() {
		return storageInTempMapper.emptyStorageInTemp();
	}

	@Override
	public int makeStorageIn(int user_id, int nums) {
		int result =  storageInMapper.makeStorageIn(user_id, nums);
		if(result == 1) {
			return storageInMapper.getLastId();
		} else {
			return 0;
		}
	}

	@Override
	public int insertOneStorageInDetail(int storagein_id, int storage_id) {
		return storageInDetailMapper.intsertOneStorageInDetail(storagein_id, storage_id);
	}
}
