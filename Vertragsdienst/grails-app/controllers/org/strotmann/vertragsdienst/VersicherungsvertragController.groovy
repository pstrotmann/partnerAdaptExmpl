package org.strotmann.vertragsdienst

import static org.springframework.http.HttpStatus.*

import org.strotmann.vertragsdienst.Versicherungsvertrag;

import grails.transaction.Transactional

@Transactional(readOnly = true)
class VersicherungsvertragController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Versicherungsvertrag.list(params), model:[versicherungsvertragInstanceCount: Versicherungsvertrag.count()]
    }

    def show(Versicherungsvertrag versicherungsvertragInstance) {
        respond versicherungsvertragInstance
    }

    def create() {
        respond new Versicherungsvertrag(params)
    }

    @Transactional
    def save(Versicherungsvertrag versicherungsvertragInstance) {
        if (versicherungsvertragInstance == null) {
            notFound()
            return
        }
		
		Long partnerId
		
		if (params.partner.id == 'null')
			partnerId = 0
		else
			partnerId = params.partner.id.toLong()

        if (versicherungsvertragInstance.hasErrors()) {
            respond versicherungsvertragInstance.errors, view:'create'
            return
        }

        versicherungsvertragInstance.save flush:true
		println "partnerId=${partnerId}"
		versicherungsvertragInstance.saveVersicherungsnehmerRole(partnerId, 0)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'versicherungsvertrag.label', default: 'Versicherungsvertrag'), versicherungsvertragInstance.id])
                redirect versicherungsvertragInstance
            }
            '*' { respond versicherungsvertragInstance, [status: CREATED] }
        }
    }

    def edit(Versicherungsvertrag versicherungsvertragInstance) {
        respond versicherungsvertragInstance
    }

    @Transactional
    def update(Versicherungsvertrag versicherungsvertragInstance) {
        
		if (versicherungsvertragInstance == null) {
            notFound()
            return
        }
		
		long oldPartnerId = versicherungsvertragInstance.partnerId
		long partnerId
		
		if (params.partner.id == 'null')
			partnerId = 0
		else
			partnerId = params.partner.id.toLong()

        if (versicherungsvertragInstance.hasErrors()) {
            respond versicherungsvertragInstance.errors, view:'edit'
            return
        }

        versicherungsvertragInstance.save flush:true
		if (oldPartnerId != partnerId)
			versicherungsvertragInstance.saveVersicherungsnehmerRole(partnerId, oldPartnerId)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Versicherungsvertrag.label', default: 'Versicherungsvertrag'), versicherungsvertragInstance.id])
                redirect versicherungsvertragInstance
            }
            '*'{ respond versicherungsvertragInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Versicherungsvertrag versicherungsvertragInstance) {

        if (versicherungsvertragInstance == null) {
            notFound()
            return
        }

        versicherungsvertragInstance.delete flush:true
		versicherungsvertragInstance.deleteVersicherungsnehmerRole()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Versicherungsvertrag.label', default: 'Versicherungsvertrag'), versicherungsvertragInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def toPartner(Versicherungsvertrag versicherungsvertragInstance) {
		//Anmeldung bei Partner setzen
		
		if (versicherungsvertragInstance.loginPartner())
			println "Anmeldung bei Partner erfolgreich"
		else
			println "Anmeldung bei Partner fehlgeschlagen"
		String s =request.getRequestURL()
		//s enthält: http://localhost:8080/Vertragsdienst/grails/versicherungsvertrag/toPartner.dispatch
		String[] splits = s.split("/")
		String uri = "http://"+splits[2]+"/"+splits[3]+"/"+"Versicherungsvertrag"
		versicherungsvertragInstance.saveRueckUri(uri)
		def partnerUri = versicherungsvertragInstance.partnerUri
		def partnerId = versicherungsvertragInstance.partnerId
		def partnerArt = versicherungsvertragInstance.partnerArt
		redirect(uri: "${partnerUri}/${partnerArt}/show/${partnerId}")
	}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'versicherungsvertrag.label', default: 'Versicherungsvertrag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
