package com.core.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.core.bo.Club;
import com.core.dao.IClubDao;
import com.genericdao.impl.HibernateSpringGenericDaoImpl;

@Repository
public class ClubDaoImpl extends HibernateSpringGenericDaoImpl<Club, Long> implements IClubDao{

	public ClubDaoImpl() {
		super(Club.class);
	
	}

	@Override
	public List<Club> getClubByName(String pName) {
		
		List<Club> clubs = getEntityByColValue("Club", "nom", pName);
		return clubs;
	}

}
