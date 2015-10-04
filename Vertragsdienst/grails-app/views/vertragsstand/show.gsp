
<%@ page import="org.strotmann.vertragsdienst.Vertragsstand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vertragsstand.label', default: 'Vertragsstand')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vertragsstand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vertragsstand" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vertragsstand">
			
				<g:if test="${vertragsstandInstance?.gueltigAb}">
				<li class="fieldcontain">
					<span id="gueltigAb-label" class="property-label"><g:message code="vertragsstand.gueltigAb.label" default="Gueltig Ab" /></span>
					
						<span class="property-value" aria-labelledby="gueltigAb-label"><g:formatDate date="${vertragsstandInstance?.gueltigAb}" format="dd.MM.yy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vertragsstandInstance?.beitrag}">
				<li class="fieldcontain">
					<span id="beitrag-label" class="property-label"><g:message code="vertragsstand.beitrag.label" default="Beitrag" /></span>
					
						<span class="property-value" aria-labelledby="beitrag-label"><g:fieldValue bean="${vertragsstandInstance}" field="beitrag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vertragsstandInstance?.zahlungsweise}">
				<li class="fieldcontain">
					<span id="zahlungsweise-label" class="property-label"><g:message code="vertragsstand.zahlungsweise.label" default="Zahlungsweise" /></span>
					
						<span class="property-value" aria-labelledby="zahlungsweise-label"><g:fieldValue bean="${vertragsstandInstance}" field="zahlungsweise"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${vertragsstandInstance?.versicherungsvertrag}">
				<li class="fieldcontain">
					<span id="versicherungsvertrag-label" class="property-label"><g:message code="vertragsstand.versicherungsvertrag.label" default="Versicherungsvertrag" /></span>
					
						<span class="property-value" aria-labelledby="versicherungsvertrag-label">
						<g:link controller="versicherungsvertrag" action="show" id="${vertragsstandInstance?.versicherungsvertrag?.id}">${vertragsstandInstance?.versicherungsvertrag?.versicherungsnehmerName.encodeAsHTML()}:${vertragsstandInstance?.versicherungsvertrag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vertragsstandInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vertragsstandInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
