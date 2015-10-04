
<%@ page import="org.strotmann.vertragsdienst.Versicherungsvertrag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'versicherungsvertrag.label', default: 'Versicherungsvertrag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-versicherungsvertrag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-versicherungsvertrag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list versicherungsvertrag">
			
				<li class="fieldcontain">
					<span id="sparte-label" class="property-label"><g:message code="versicherungsvertrag.vnr.label" default="VersNr" /></span>
					
						<span class="property-value" aria-labelledby="vnr-label"><g:fieldValue bean="${versicherungsvertragInstance}" field="id"/></span>
					
				</li>
			
				<g:if test="${versicherungsvertragInstance?.sparte}">
				<li class="fieldcontain">
					<span id="sparte-label" class="property-label"><g:message code="versicherungsvertrag.sparte.label" default="Sparte" /></span>
					
						<span class="property-value" aria-labelledby="sparte-label"><g:fieldValue bean="${versicherungsvertragInstance}" field="sparte"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versicherungsvertragInstance?.zahlungsart}">
				<li class="fieldcontain">
					<span id="zahlungsart-label" class="property-label"><g:message code="versicherungsvertrag.zahlungsart.label" default="Zahlungsart" /></span>
					
						<span class="property-value" aria-labelledby="zahlungsart-label"><g:fieldValue bean="${versicherungsvertragInstance}" field="zahlungsart"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versicherungsvertragInstance?.beginn}">
				<li class="fieldcontain">
					<span id="beginn-label" class="property-label"><g:message code="versicherungsvertrag.beginn.label" default="Beginn" /></span>
					
						<span class="property-value" aria-labelledby="beginn-label"><g:formatDate date="${versicherungsvertragInstance?.beginn}" format="dd.MM.yy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versicherungsvertragInstance?.ablauf}">
				<li class="fieldcontain">
					<span id="ablauf-label" class="property-label"><g:message code="versicherungsvertrag.ablauf.label" default="Ablauf" /></span>
					
						<span class="property-value" aria-labelledby="ablauf-label"><g:formatDate date="${versicherungsvertragInstance?.ablauf}" format="dd.MM.yy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${versicherungsvertragInstance?.vertragsstaende}">
				<li class="fieldcontain">
					<span id="vertragsstaende-label" class="property-label"><g:message code="versicherungsvertrag.vertragsstaende.label" default="Vertragsstaende" /></span>
					
						<g:each in="${versicherungsvertragInstance.vertragsstaende}" var="v">
						<span class="property-value" aria-labelledby="vertragsstaende-label"><g:link controller="vertragsstand" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="versicherungsnehmerName-label" class="property-label"><g:message code="versicherungsvertrag.versicherungsnehmerName.label" default="Versicherungsnehmer" /></span>
					
						<span class="property-value" aria-labelledby="versicherungsnehmerName-label"><g:link action="toPartner" resource="${versicherungsvertragInstance}" >${fieldValue(bean: versicherungsvertragInstance, field: "versicherungsnehmerName")}</g:link></span>
				</li>
			
			</ol>
			<g:form url="[resource:versicherungsvertragInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${versicherungsvertragInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
