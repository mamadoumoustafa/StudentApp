package com.core.bo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;


@Entity
public class Club {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idClub;
	private String nom;
	private String activites;
	
	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "clubs")
	private List<Student> students = new ArrayList<Student>();
	
	public void addStudent(Student pStudent) {
		
		students.add(pStudent);
		pStudent.getClubs().add(this);
	}
	
	public Club() {
		super();
	}
	
	public Club(String nom, String activites) {
		super();
		this.nom = nom;
		this.activites = activites;
	}





	public Long getId() {
		return idClub;
	}


	public void setId(Long id) {
		this.idClub = id;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getActivites() {
		return activites;
	}


	public void setActivites(String activites) {
		this.activites = activites;
	}


	@Override
	public String toString() {
		return "Club [idClub=" + idClub + ", nom=" + nom + ", activites=" + activites + ", students=" + students + "]";
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
	
	
	
	
	
	

}
