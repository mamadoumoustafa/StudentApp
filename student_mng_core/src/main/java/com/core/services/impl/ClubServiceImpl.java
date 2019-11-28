package com.core.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.core.bo.Club;
import com.core.dao.IClubDao;
import com.core.services.IClubService;

@Service
@Transactional
public class ClubServiceImpl implements IClubService{
	
	@Autowired
	private IClubDao clubDao;
	
	

	public ClubServiceImpl() {

		System.out.println("clubDao " + clubDao);
	}

	@Override
	public void createNewClub(Club pClub) {
		
		clubDao.create(pClub);
		
	}

	@Override
	public void updateClub(Club pClub) {
		
		clubDao.update(pClub);
		
	}

	@Override
	public void deleteClub(Long pId) {
		
		clubDao.delete(pId);
		
	}

	@Override
	public List<Club> getAllClubs() {
		
		return clubDao.getAll();
	}

	@Override
	public List<Club> getClubByName(String pName) {

		return clubDao.getClubByName(pName);
	}

	@Override
	public Club getClubById(Long pId) {
	
		return clubDao.findById(pId);
	}

}
