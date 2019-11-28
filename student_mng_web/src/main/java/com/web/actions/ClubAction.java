package com.web.actions;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.springframework.beans.factory.annotation.Autowired;

import com.core.bo.Club;
import com.core.bo.Student;
import com.core.services.IClubService;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@ResultPath("/pages/")
public class ClubAction extends ActionSupport{
	
	private Club club;
	private List<Club> clubList;
	private List<Student> stds;
	
	@Autowired
	private IClubService clubService;

	public ClubAction() {
		System.out.println("ClubAction created");
	}
	
	@Action(value = "showAddClubForm", results = { @Result(name = "success", location = "AddClubForm.jsp")  })
	public String showAddClubForm() {

		clubList = clubService.getAllClubs();

		return SUCCESS;
	}
	
	@Action(value = "showClubSearchForm", results = { @Result(name = "success", location = "ClubSearchForm.jsp") })
	public String showClubSearchForm() {

		return SUCCESS;
	}
	
	@Action(value = "addClub", results = { @Result(name = "success", location = "AddClubForm.jsp")  })
	public String addClub() {

			
		clubService.createNewClub(club);
		clubList = clubService.getAllClubs();

			addActionMessage("Club added");

			return SUCCESS;
		 
	}
	
	@Action(value = "listClubs", results = { @Result(name = "success", location = "listClubs.jsp") })
	public String listClubs() {

		clubList = clubService.getAllClubs();

		return SUCCESS;
	}
	
	@Action(value = "searchClub", results = { @Result(name = "success", location = "AddClubForm.jsp") })
	public String searchClub() {

		clubList = clubService.getAllClubs();

		return SUCCESS;
	}
	
	@Action(value = "ClubAll", results = { @Result(name = "success", location = "listStudentsClub.jsp") })
	public String ClubAllStudents() {

		club = clubService.getClubByName(club.getNom()).get(0);
		stds = club.getStudents();
		System.out.println(stds);

		return SUCCESS;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	public List<Club> getClubList() {
		return clubList;
	}

	public void setClubList(List<Club> clubList) {
		this.clubList = clubList;
	}

	public IClubService getClubService() {
		return clubService;
	}
	
	

	public List<Student> getStds() {
		return stds;
	}

	public void setStds(List<Student> stds) {
		this.stds = stds;
	}

	public void setClubService(IClubService clubService) {
		this.clubService = clubService;
	}
	
	
	

}
