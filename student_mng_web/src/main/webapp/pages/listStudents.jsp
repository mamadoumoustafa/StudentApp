<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<%@ taglib prefix="sjdt" uri="/struts-jquery-datatables-tags"%>

<jsp:include page="header.jsp" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management App</title>
<sj:head jquerytheme="redmond" />
<sb:head />

</head>
<body>
	<div class="container">
		<div class="col-md-9">

				<h1>
					<s:property value = "getText('global.locale')" />
				</h1>


      <s:a href="listStudents?request_locale=en" >English</s:a>
      <s:a href="listStudents?request_locale=fr" >Francais</s:a>


			<h2><s:property value = "getText('global.students')" /></h2>
			<sjdt:datatables datatablesTheme="jqueryui" buttons="true"
				class="table" dom="Blfrtip" lengthMenu="[5,10,15,20]"
				pageLength="15" responsive="true" style="width:100%;">
				<caption class="ui-widget-header">Liste des étudiants</caption>
				<thead>
					<tr>
						<th><s:property value = "getText('global.nom')" /></th>
						<th><s:property value = "getText('global.prenom')" /></th>
						<th><s:property value = "getText('global.dateNaissance')" /></th>
						<th><s:property value = "getText('global.email')" /></th>
						<th><s:property value = "getText('global.gender')" /></th>
						<th>Action</th>
						

					</tr>
				</thead>
				<tbody>
					<s:iterator value="studentList">
						<tr>
							<td>${nom}</td>
							<td>${prenom}</td>
							<td>${dateNaissance}</td>
							<td>${email}</td>
							<td>${gender}</td>
							
							
							<s:url  action="showAffecterClubForm" var="Modifier">
								<s:param name="cne">${cne}</s:param>
							</s:url>

							

							<td><a href='<s:property value = "#Modifier"/>'>AffecterClub</a></td>

						</tr>
					</s:iterator>
				</tbody>
			</sjdt:datatables>
		</div>
	</div>
</body>
</html>