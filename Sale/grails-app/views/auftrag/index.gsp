
<%@ page import="org.strotmann.sale.Auftrag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'auftrag.label', default: 'SalesOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-auftrag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-auftrag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="partnerId" title="${message(code: 'auftrag.partnerId.label', default: 'Partner')}" />
					
						<g:sortableColumn property="wert" title="${message(code: 'auftrag.wert.label', default: 'Amount')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'auftrag.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${auftragInstanceList}" status="i" var="auftragInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${auftragInstance.id}">${fieldValue(bean: auftragInstance, field: "customerName")}</g:link></td>
					
						<td>${fieldValue(bean: auftragInstance, field: "wert")}</td>
					
						<td><g:formatDate date="${auftragInstance.date}" format="dd.MM.yyyy"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${auftragInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
