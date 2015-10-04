<%@ page import="org.strotmann.purchase.Bestellung" %>


<div class="fieldcontain ${hasErrors(bean: bestellungInstance, field: 'wert', 'error')} required">
	<label for="wert">
		<g:message code="bestellung.wert.label" default="Wert" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wert" value="${fieldValue(bean: bestellungInstance, field: 'wert')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bestellungInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="bestellung.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${bestellungInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: bestellungInstance, field: 'partner', 'error')}">
	<label for="partner">
		<g:message code="bestellung.partner.label" default="Kunde" />
		</label>
	<g:select name="partner.id" from="${org.strotmann.partner.adapter.Partner.partners}" value="${bestellungInstance.partnerId}" optionKey="id" class="many-to-one" noSelection="['null': '']"/>
</div>

