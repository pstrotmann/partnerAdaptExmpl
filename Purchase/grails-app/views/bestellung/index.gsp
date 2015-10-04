
<%@ page import="org.strotmann.purchase.Bestellung" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bestellung.label', default: 'Bestellung')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bestellung" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bestellung" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						
						<g:sortableColumn property="partnerId" title="${message(code: 'bestellung.partnerId.label', default: 'Partner')}" />
					
						<g:sortableColumn property="wert" title="${message(code: 'bestellung.wert.label', default: 'Wert')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'bestellung.date.label', default: 'Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bestellungInstanceList}" status="i" var="bestellungInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bestellungInstance.id}">${fieldValue(bean: bestellungInstance, field: "supplierName")}</g:link></td>
					
						<td><g:link action="show" id="${bestellungInstance.id}">${fieldValue(bean: bestellungInstance, field: "wert")}</g:link></td>
					
						<td><g:formatDate date="${bestellungInstance.date}" format="dd.MM.yyyy"/></td>
						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bestellungInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
