
<%@ page import="org.strotmann.vertragsdienst.Vertragsstand" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vertragsstand.label', default: 'Vertragsstand')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vertragsstand" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vertragsstand" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'vertragsstand.id.label', default: 'VstandId')}" />
						
						<g:sortableColumn property="gueltigAb" title="${message(code: 'vertragsstand.gueltigAb.label', default: 'Gueltig Ab')}" />
					
						<g:sortableColumn property="beitrag" title="${message(code: 'vertragsstand.beitrag.label', default: 'Beitrag')}" />
					
						<g:sortableColumn property="zahlungsweise" title="${message(code: 'vertragsstand.zahlungsweise.label', default: 'Zahlungsweise')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vertragsstandInstanceList}" status="i" var="vertragsstandInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vertragsstandInstance.id}">${fieldValue(bean: vertragsstandInstance, field: "id" )}</g:link></td>
					
						<td><g:formatDate date="${vertragsstandInstance.gueltigAb}" format="dd.MM.yy"/></td>
						
						<td>${fieldValue(bean: vertragsstandInstance, field: "beitrag")}</td>
					
						<td>${fieldValue(bean: vertragsstandInstance, field: "zahlungsweise")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vertragsstandInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
