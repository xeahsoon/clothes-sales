package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Storage;

public interface StorageService {

	List<Storage> listSameGoods(int code);
	
	List<Storage> listAllGoods();
	
	List<Storage> listUncheckedStorages();
	
	List<Storage> listCheckedStorages();
	
	int getStorageCheckFlag(int id);
	
	int checkOneStorage(int id);
	
	int uncheckAllStorages();
	
	Storage getStorageWithId(int id);
}
