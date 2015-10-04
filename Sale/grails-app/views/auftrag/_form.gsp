<%@ page import="org.strotmann.sale.Auftrag" %>


<div class="fieldcontain ${hasErrors(bean: auftragInstance, field: 'wert', 'error')} required">
	<label for="wert">
		<g:message code="auftrag.wert.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wert" value="${fieldValue(bean: auftragInstance, field: 'wert')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: auftragInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="auftrag.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${auftragInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: auftragInstance, field: 'partner', 'error')}">
	<label for="partner">
		<g:message code="auftrag.partner.label" default="Custoumer" />
		</label>
	<g:select name="partner.id" from="${org.strotmann.partner.adapter.Partner.partners}" value="${auftragInstance.partnerId}" optionKey="id" class="many-to-one" noSelection="['null': '']"/>
</div>



