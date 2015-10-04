
<%@ page import="org.strotmann.purchase.Bestellung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bestellung.label', default: 'Bestellung')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bestellung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bestellung" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bestellung">
			
				<g:if test="${bestellungInstance?.wert}">
				<li class="fieldcontain">
					<span id="wert-label" class="property-label"><g:message code="bestellung.wert.label" default="Wert" /></span>
					
						<span class="property-value" aria-labelledby="wert-label"><g:fieldValue bean="${bestellungInstance}" field="wert"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bestellungInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="bestellung.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${bestellungInstance?.date}" format="dd.MM.yyyy"/></span>
					
				</li>
				</g:if>
				
				<li class="fieldcontain">
					<span id="supplierName-label" class="property-label"><g:message code="bestellung.supplierName.label" default="Supplier" /></span>
					
						<span class="property-value" aria-labelledby="supplierName-label"><g:link action="toPartner" resource="${bestellungInstance}" >${fieldValue(bean: bestellungInstance, field: "supplierName")}</g:link></span>
				</li>
			
			</ol>
			<g:form url="[resource:bestellungInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bestellungInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
