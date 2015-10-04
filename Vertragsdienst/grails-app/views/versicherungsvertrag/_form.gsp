<%@ page import="org.strotmann.vertragsdienst.Versicherungsvertrag" %>
<%@ page import="org.strotmann.vertragsdienst.Vertragsstand" %>


<div class="fieldcontain ${hasErrors(bean: versicherungsvertragInstance, field: 'sparte', 'error')} required">
	<label for="sparte">
		<g:message code="versicherungsvertrag.sparte.label" default="Sparte" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sparte" from="${versicherungsvertragInstance.constraints.sparte.inList}" required="" value="${versicherungsvertragInstance?.sparte}" valueMessagePrefix="versicherungsvertrag.sparte"/>

</div>

<div class="fieldcontain ${hasErrors(bean: versicherungsvertragInstance, field: 'zahlungsart', 'error')} required">
	<label for="zahlungsart">
		<g:message code="versicherungsvertrag.zahlungsart.label" default="Zahlungsart" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="zahlungsart" from="${versicherungsvertragInstance.constraints.zahlungsart.inList}" required="" value="${versicherungsvertragInstance?.zahlungsart}" valueMessagePrefix="versicherungsvertrag.zahlungsart"/>

</div>

<div class="fieldcontain ${hasErrors(bean: versicherungsvertragInstance, field: 'beginn', 'error')} required">
	<label for="beginn">
		<g:message code="versicherungsvertrag.beginn.label" default="Beginn" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="beginn" precision="day"  value="${versicherungsvertragInstance?.beginn}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: versicherungsvertragInstance, field: 'ablauf', 'error')} ">
	<label for="ablauf">
		<g:message code="versicherungsvertrag.ablauf.label" default="Ablauf" />
		
	</label>
	<g:datePicker name="ablauf" precision="day"  value="${versicherungsvertragInstance?.ablauf}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: versicherungsvertragInstance, field: 'vertragsstand', 'error')} ">
	<label for="vertragsstaende">
		<g:message code="versicherungsvertrag.vertragsstaende.label" default="Vertragsstände"/>
	</label>
	
<ul class="one-to-many">
<g:each in="${versicherungsvertragInstance?.vertragsstaende?}" var="k">
    <li><g:link controller="vertragsstand" action="show" id="${k.id}">${k?.encodeAsHTML()}</g:link></li>
</g:each>

<li class="add">
<g:link controller="vertragsstand" action="create" params="['versicherungsvertrag.id': versicherungsvertragInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vertragsstand.label', default: 'Vertragsstand')])}</g:link>
</li>

</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bestellungInstance, field: 'partner', 'error')}">
	<label for="partner">
		<g:message code="versicherungsvertrag.partner.label" default="Versicherungsnehmer" />
		</label>
	<g:select name="partner.id" from="${org.strotmann.partner.adapter.Partner.partners}" value="${versicherungsvertragInstance.partnerId}" optionKey="id" class="many-to-one" noSelection="['null': '']"/>
</div>


