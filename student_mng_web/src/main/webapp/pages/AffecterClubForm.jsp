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


      <s:a href="showAffecterClubForm?request_locale=en" >English</s:a>
      <s:a href="showAffecterClubForm?request_locale=fr" >Francais</s:a>
	
			<h1><s:property value = "getText('global.titleAffecterClubForm')" /></h1>
			<s:actionerror theme="bootstrap" />
			<s:actionmessage theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
			<s:form action="AffecterClub" method="post" cssClass="form-horizontal"
				theme="bootstrap">
				

				<s:textfield label="id" name="student.id" value="%{student.id}" />
				
				<s:textfield label="%{getText('global.nom')}" name="student.nom"
					tooltip="Entrer votre nom ici" value="%{student.nom}"/>
				

				<s:textfield key="global.prenom" name="student.prenom"
					tooltip="Entrer votre prénom ici" />

				<s:textfield key="global.cne" name="student.cne"
					tooltip="Entrer votre prénom ici"  value="%{student.cne}"  />
				
				<sj:datepicker key="global.dateNaissance" cssClass= "form-control"
					maxDate="-1d" displayFormat="dd/mm/yy" showOn="focus"
					inputAppendIcon="calendar" name="student.dateNaissance"
					tooltip="Entrer votre date de naissance" />

				<s:textfield key="global.email" name="student.email"
					tooltip="Entrer votre email ici" />
				

				<s:textfield key="global.nomClub" name="nomClub"
					tooltip="Entrer le nom du club ici" />
					

				<div class="row">
					<div class="col-sm-offset-3 col-md-9">
						<s:submit cssClass="btn btn-primary" label="%{getText('global.titleClub')}"
							value="%{getText('global.titleClub')}" />
					</div>
				</div>
			</s:form>
		</div>
		<div class="col-md-9">


			<h2><s:property value = "getText('global.clubs')" /></h2>
			<sjdt:datatables datatablesTheme="jqueryui" buttons="true"
				class="table" dom="Blfrtip" lengthMenu="[5,10,15,20]"
				pageLength="15" responsive="true" style="width:100%;">
				<caption class="ui-widget-header">Liste des clubs</caption>
				<thead>
					<tr>
					<th>id</th>
 						<th><s:property value = "getText('global.nomClub')" /></th>
						<th><s:property value = "getText('global.activities')" /></th>
<%-- 						<th>id</th>
						<th><s:property value = "getText('global.nom')" /></th>
						<th><s:property value = "getText('global.prenom')" /></th>
						<th><s:property value = "getText('global.email')" /></th>
						<th><s:property value = "getText('global.dateNaissance')" /></th>
						<th><s:property value = "getText('global.gender')" /></th> --%>

					</tr>
				</thead>
				<tbody>
					<s:iterator value="clubs">
						<tr>
							<td>${idClub}</td>
							<td>${nom}</td>
							<td>${activites}</td>
<%-- 							<td>${email}</td>
							<td>${dateNaissance}</td>
							<td>${gender}</td> --%>


						</tr>
					</s:iterator>
				</tbody>
			</sjdt:datatables>

		</div>

	</div>

</body>
</html>