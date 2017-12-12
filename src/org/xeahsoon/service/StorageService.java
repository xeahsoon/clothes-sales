package org.xeahsoon.service;

import java.util.List;

import org.xeahsoon.pojo.Storage;

public interface StorageService {

	List<Storage> listSameGoods(int code);
	
	List<Storage> listAllGoods();
}
