package com.core.dao;

import java.util.List;

import com.core.bo.Club;
import com.genericdao.api.GenericDao;

public interface IClubDao extends GenericDao<Club, Long>{
	
	public List<Club> getClubByName(String pName);

}
