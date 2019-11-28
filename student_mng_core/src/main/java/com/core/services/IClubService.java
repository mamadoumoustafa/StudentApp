package com.core.services;

import java.util.List;

import com.core.bo.Club;

public interface IClubService {

	public void createNewClub(Club pClub);
	public void updateClub(Club pClub);
	public void deleteClub(Long pId);
	public List<Club> getAllClubs();
	public List<Club> getClubByName(String pName);
	public Club getClubById(Long pId);
	
}
