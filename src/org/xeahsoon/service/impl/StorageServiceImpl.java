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
	public List<Storage> listSameGoods(int code) {
		return storageMapper.listSameGoodWithCode(code);
	}

	@Override
	public List<Storage> listAllGoods() {
		return storageMapper.listAllStorages();
	}

}
