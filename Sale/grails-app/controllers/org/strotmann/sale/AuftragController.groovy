package org.strotmann.sale



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuftragController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 100, 1000)
        respond Auftrag.list(params), model:[salesOrderInstanceCount: Auftrag.count()]
    }

    def show(Auftrag salesOrderInstance) {
		
		respond salesOrderInstance
    }

    def create() {
        respond new Auftrag(params)
    }

    @Transactional
    def save(Auftrag salesOrderInstance) {
        if (salesOrderInstance == null) {
            notFound()
            return
        }
		
		Long partnerId
		
		if (params.partner.id == 'null') 
			partnerId = 0
		
		else 
			partnerId = params.partner.id.toLong()
		
        if (salesOrderInstance.hasErrors()) {
            respond salesOrderInstance.errors, view:'create'
            return
        }

        salesOrderInstance.save flush:true
		salesOrderInstance.saveCustomerRole(partnerId, 0)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'salesOrder.label', default: 'SalesOrder'), salesOrderInstance.id])
                redirect salesOrderInstance
            }
            '*' { respond salesOrderInstance, [status: CREATED] }
        }
    }

    def edit(Auftrag salesOrderInstance) {
		respond salesOrderInstance
    }

    @Transactional
    def update(Auftrag salesOrderInstance) {
		
        if (salesOrderInstance == null) {
            notFound()
            return
        }
		
		long oldPartnerId = salesOrderInstance.partnerId
		long partnerId
		
		if (params.partner.id == 'null') 
			partnerId = 0
		else 
			partnerId = params.partner.id.toLong()
		
		
        if (salesOrderInstance.hasErrors()) {
            respond salesOrderInstance.errors, view:'edit'
            return
        }

        salesOrderInstance.save flush:true
		
		if (oldPartnerId != partnerId)
			salesOrderInstance.saveCustomerRole(partnerId, oldPartnerId)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SalesOrder.label', default: 'SalesOrder'), salesOrderInstance.id])
                redirect salesOrderInstance
            }
            '*'{ respond salesOrderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Auftrag salesOrderInstance) {

        if (salesOrderInstance == null) {
            notFound()
            return
        }

        salesOrderInstance.delete flush:true
		salesOrderInstance.deleteCustomerRole()

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SalesOrder.label', default: 'SalesOrder'), salesOrderInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	def toPartner(Auftrag salesOrderInstance) {
			//Anmeldung bei Partner setzen
			
			if (salesOrderInstance.loginPartner())
				println "Anmeldung bei Partner erfolgreich"
			else
				println "Anmeldung bei Partner fehlgeschlagen"
			String s =request.getRequestURL()
			//s enthält: http://localhost:8080/Sale/grails/auftrag/toPartner.dispatch
			String[] splits = s.split("/")
			String uri = "http://"+splits[2]+"/"+splits[3]+"/"+"Auftrag"
			salesOrderInstance.saveRueckUri(uri)
			def partnerUri = salesOrderInstance.partnerUri
			def partnerId = salesOrderInstance.partnerId
			def partnerArt = salesOrderInstance.partnerArt
			redirect(uri: "${partnerUri}/${partnerArt}/show/${partnerId}")
		}

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'SalesOrder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
