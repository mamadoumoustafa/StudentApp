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
import com.core.services.IStudentService;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@ResultPath("/pages/")
public class StudentAction extends ActionSupport {

	private Student student;
	public String nomClub;
	private List<Club> clubs;
	private String cne;

	private List<Student> studentList;

	@Autowired
	private IStudentService studentService;
	
	@Autowired
	private IClubService clubService;

	public StudentAction() {
		System.out.println("StudentAction created...");
	}

	@Action(value = "showAddStudentForm", results = { @Result(name = "success", location = "addStudentForm.jsp")  })
	public String showAddStudentForm() {

		studentList = studentService.getAllStudents();

		return SUCCESS;
	}
	
	@Action(value = "/", results = { @Result(name = "success", location = "addStudentForm.jsp")  })
	public String showHomePage() {

		studentList = studentService.getAllStudents();

		return SUCCESS;
	}
	
	
	@Action(value = "showAffecterClubForm", results = { @Result(name = "success", location = "AffecterClubForm.jsp")  })
	public String showAffecterClubForm() {
		
		student = studentService.getStudentByCne(cne);
		clubs=clubService.getAllClubs();

		return SUCCESS;
	}

	@Action(value = "showSearchForm", results = { @Result(name = "success", location = "searchForm.jsp") })
	public String showSearchForm() {

		
		
		return SUCCESS;
	}

	@Action(value = "searchStudent", results = { @Result(name = "success", location = "listStudents.jsp") })
	public String search() {

		studentList = studentService.multiCriteriaSearch(student);
		return SUCCESS;
	}

	@Action(value = "addStudent", results = { @Result(name = "success", location = "addStudentForm.jsp"),
												@Result(name = "input", location = "addStudentForm.jsp"),
												@Result(name = "error", location = "error.jsp")})
	public String addStudent() {

		if((!isNumeric(student.getNom().trim()) && (student.getNom().length()<100)) && ((!isNumeric(student.getPrenom().trim())) && (student.getPrenom().length()<100)) && (student.getCne().length()<10)) {
			
			studentService.createNewStudent(student);
			studentList = studentService.getAllStudents();

			addActionMessage("Student added");

			return SUCCESS;
		}
		 
		return ERROR;
	}
	
	@Action(value = "AffecterClub", results = { @Result(name = "success", location = "AffecterClubForm.jsp")  })
	public String AffecterClub() {
		
		Club temp=null;
		System.out.println("cne :"+student.getCne());
		student = studentService.getStudentByCne(student.getCne());
		System.out.println("affecter club student:"+student);
		List<Club> liste = clubService.getClubByName(nomClub);
		for(Club it  : liste) {	
			if(it.getNom().equals(nomClub));
				temp = it;
		}
		student.addClub(temp);
		studentService.updateStudent(student);
		clubs=clubService.getAllClubs();
		
		
		addActionMessage("Student added to the club");


		return SUCCESS;
	}

	@Action(value = "listStudents", results = { @Result(name = "success", location = "listStudents.jsp") })
	public String listStudents() {

		studentList = studentService.getAllStudents();

		return SUCCESS;
	}

	
	@Action(value = "showStudentClubsSearchForm", results = { @Result(name = "success", location = "StudentClubsSearchForm.jsp") })
	public String showStudentClubsSearchForm() {

		
		
		return SUCCESS;
	}
	
	@Action(value = "showClubs", results = { @Result(name = "success", location = "listClubsStudent.jsp") })
	public String showClubs() {
		
		clubs = studentService.getStudentByCne(student.getCne()).getClubs();
		cne = student.getCne();
		return SUCCESS;
	}
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public IStudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(IStudentService studentService) {
		this.studentService = studentService;
	}

	public List<Student> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<Student> students) {
		this.studentList = students;
	}
	
	
	
	public String getNomClub() {
		return nomClub;
	}

	public void setNomClub(String nomClub) {
		this.nomClub = nomClub;
	}

	public List<Club> getClubs() {
		return clubs;
	}

	public void setClubs(List<Club> clubs) {
		this.clubs = clubs;
	}

	public String getCne() {
		return cne;
	}

	public void setCne(String cne) {
		this.cne = cne;
	}

	public static boolean isNumeric(String str)
	{
	    return str.matches("[+-]?\\d*(\\.\\d+)?");
	}


	
	

}
