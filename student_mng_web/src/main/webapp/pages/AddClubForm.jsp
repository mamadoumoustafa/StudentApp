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


      <s:a href="showAddClubForm?request_locale=en" >English</s:a>
      <s:a href="showAddClubForm?request_locale=fr" >Francais</s:a>
	
			<h1><s:property value = "getText('global.title')" /></h1>
			<s:actionerror theme="bootstrap" />
			<s:actionmessage theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
			<s:form action="addClub" method="post" cssClass="form-horizontal"
				theme="bootstrap">
				

				<s:textfield label="%{getText('global.nom')}" name="club.nom"
					tooltip="Entrer votre nom ici" />
				

				<s:textfield key="global.activities" name="club.activites"
					tooltip="Entrer votre prénom ici" />



				<div class="row">
					<div class="col-sm-offset-3 col-md-9">
						<s:submit cssClass="btn btn-primary" label="%{getText('global.submit')}"
							value="%{getText('global.submit')}" />
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
						<th><s:property value = "getText('global.nom')" /></th>
						<th><s:property value = "getText('global.activities')" /></th>
						<th><s:property value = "getText('global.clubAction')" /></th>


					</tr>
				</thead>
				<tbody>
					<s:iterator value="clubList">
						<tr>
							<td>${nom}</td>
							<td>${activites}</td>
							<td><a href="#">Actiontodo</a></td>


						</tr>
					</s:iterator>
				</tbody>
			</sjdt:datatables>

		</div>

	</div>

</body>
</html>