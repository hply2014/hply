package hply.service;

import hply.dao.T3Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class T3Service {
	@Autowired
	private T3Dao t3Dao;

	public boolean hasMatchUser() {
		return t3Dao.getCount() > 1;
	}

}
