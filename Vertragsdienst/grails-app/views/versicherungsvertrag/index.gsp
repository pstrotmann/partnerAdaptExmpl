
<%@ page import="org.strotmann.vertragsdienst.Versicherungsvertrag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'versicherungsvertrag.label', default: 'Versicherungsvertrag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-versicherungsvertrag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-versicherungsvertrag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'versicherungsvertrag.sparte.label', default: 'VersNr')}" />
					
						<g:sortableColumn property="sparte" title="${message(code: 'versicherungsvertrag.sparte.label', default: 'Sparte')}" />
						
						<g:sortableColumn property="versicherungsnehmerName" title="${message(code: 'versicherungsvertrag.versicherungsnehmerName.label', default: 'VN')}" />
					
						<g:sortableColumn property="zahlungsart" title="${message(code: 'versicherungsvertrag.zahlungsart.label', default: 'Zahlungsart')}" />
					
						<g:sortableColumn property="beginn" title="${message(code: 'versicherungsvertrag.beginn.label', default: 'Beginn')}" />
					
						<g:sortableColumn property="ablauf" title="${message(code: 'versicherungsvertrag.ablauf.label', default: 'Ablauf')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${versicherungsvertragInstanceList}" status="i" var="versicherungsvertragInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${versicherungsvertragInstance.id}">${fieldValue(bean: versicherungsvertragInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: versicherungsvertragInstance, field: "versicherungsnehmerName")}</td>
						
						<td>${fieldValue(bean: versicherungsvertragInstance, field: "sparte")}</td>
						
						<td>${fieldValue(bean: versicherungsvertragInstance, field: "zahlungsart")}</td>
					
						<td><g:formatDate date="${versicherungsvertragInstance.beginn}" format="dd.MM.yy"/></td>
					
						<td><g:formatDate date="${versicherungsvertragInstance.ablauf}" format="dd.MM.yy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${versicherungsvertragInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
