<%@ page import="org.strotmann.vertragsdienst.Vertragsstand" %>



<div class="fieldcontain ${hasErrors(bean: vertragsstandInstance, field: 'gueltigAb', 'error')} required">
	<label for="gueltigAb">
		<g:message code="vertragsstand.gueltigAb.label" default="Gueltig Ab" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="gueltigAb" precision="day"  value="${vertragsstandInstance?.gueltigAb}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: vertragsstandInstance, field: 'beitrag', 'error')} required">
	<label for="beitrag">
		<g:message code="vertragsstand.beitrag.label" default="Beitrag" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="beitrag" value="${fieldValue(bean: vertragsstandInstance, field: 'beitrag')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: vertragsstandInstance, field: 'zahlungsweise', 'error')} required">
	<label for="zahlungsweise">
		<g:message code="vertragsstand.zahlungsweise.label" default="Zahlungsweise" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="zahlungsweise" from="${vertragsstandInstance.constraints.zahlungsweise.inList}" required="" value="${vertragsstandInstance?.zahlungsweise}" valueMessagePrefix="vertragsstand.zahlungsweise"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vertragsstandInstance, field: 'versicherungsvertrag', 'error')} required">
	<label for="versicherungsvertrag">
		<g:message code="vertragsstand.versicherungsvertrag.label" default="Versicherungsvertrag" />
		<span class="required-indicator">*</span>
	</label>
	<g:if test="${flash.versicherungsvertrag}">
		<g:select id="versicherungsvertrag" name="versicherungsvertrag.id" from="${flash.versicherungsvertrag}" optionKey="id" required="" value="${vertragsstandInstance?.versicherungsvertrag?.id}" class="many-to-one"/>
	</g:if>
	<g:else>
		<g:select id="versicherungsvertrag" name="versicherungsvertrag.id" from="${vertragsstandInstance?.versicherungsvertrag}" optionKey="id" required="" value="${vertragsstandInstance?.versicherungsvertrag?.id}" class="many-to-one"/>
	</g:else>
</div>

