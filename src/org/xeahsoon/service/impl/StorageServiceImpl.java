package org.xeahsoon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xeahsoon.mapper.StorageMapper;
import org.xeahsoon.pojo.Storage;
import org.xeahsoon.service.StorageService;


@Service("storageService")
public class StorageServiceImpl implements StorageService {

	@Autowired
	private StorageMapper storageMapper;
	
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
	public Storage getStorageWithId(int id) {
		return storageMapper.getStorageWithId(id);
	}
}
