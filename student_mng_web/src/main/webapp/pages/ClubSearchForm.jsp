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


      <s:a href="showSearchForm?request_locale=en" >English</s:a>
      <s:a href="showSearchForm?request_locale=fr" >Francais</s:a>

			<h1><s:property value = "getText('global.searchClubStudentsTitle')" /></h1>
			<s:actionerror theme="bootstrap" />
			<s:actionmessage theme="bootstrap" />
			<s:fielderror theme="bootstrap" />
			<s:form enctype="multipart/form-data" theme="bootstrap"
				cssClass="form-horizontal well" action="ClubAll">
				<div class="row">
				
				<div class="col-md-6">
						<s:textfield label="%{getText('global.nom')}" name="club.nom"
							elementCssClass="col-md-8" labelCssClass="col-md-4"
							tooltip="Entrer le nom du club" />
					</div>
<%-- 					<div class="col-md-6">
						<s:textfield label="%{getText('global.nom')}" name="club.activites"
							elementCssClass="col-md-8" labelCssClass="col-md-4"
							tooltip="Entrer le nom de l'étudiant" />
					</div> --%>

				</div>



				<div class="row">
					<div class="col-sm-offset-3 col-md-9">
						<s:submit cssClass="btn btn-primary" value="%{getText('global.submitSearch')}" />
					</div>
				</div>
			</s:form>


		</div>
	</div>


</body>
</html>