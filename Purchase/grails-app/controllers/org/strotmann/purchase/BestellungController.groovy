package org.strotmann.purchase

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BestellungController {
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
		def index(Integer max) {
			params.max = Math.min(max ?: 100, 1000)
			respond Bestellung.list(params), model:[purchaseOrderInstanceCount: Bestellung.count()]
		}
	
		def show(Bestellung purchaseOrderInstance) {
			
			respond purchaseOrderInstance
		}
	
		def create() {
			respond new Bestellung(params)
		}
	
		@Transactional
		def save(Bestellung purchaseOrderInstance) {
			if (purchaseOrderInstance == null) {
				notFound()
				return
			}
			
			Long partnerId
			
			if (params.partner.id == 'null')
				partnerId = 0
			
			else
				partnerId = params.partner.id.toLong()
			
			if (purchaseOrderInstance.hasErrors()) {
				respond purchaseOrderInstance.errors, view:'create'
				return
			}
	
			purchaseOrderInstance.save flush:true
			purchaseOrderInstance.saveSupplierRole(partnerId, 0)
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.created.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])
					redirect purchaseOrderInstance
				}
				'*' { respond purchaseOrderInstance, [status: CREATED] }
			}
		}
	
		def edit(Bestellung purchaseOrderInstance) {
			respond purchaseOrderInstance
		}
	
		@Transactional
		def update(Bestellung purchaseOrderInstance) {
			
			if (purchaseOrderInstance == null) {
				notFound()
				return
			}
			
			long oldPartnerId = purchaseOrderInstance.partnerId
			long partnerId
			
			if (params.partner.id == 'null')
				partnerId = 0
			else
				partnerId = params.partner.id.toLong()
			
			
			if (purchaseOrderInstance.hasErrors()) {
				respond purchaseOrderInstance.errors, view:'edit'
				return
			}
	
			purchaseOrderInstance.save flush:true
			
			if (oldPartnerId != partnerId)
				purchaseOrderInstance.saveSupplierRole(partnerId, oldPartnerId)
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.updated.message', args: [message(code: 'PurchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])
					redirect purchaseOrderInstance
				}
				'*'{ respond purchaseOrderInstance, [status: OK] }
			}
		}
	
		@Transactional
		def delete(Bestellung purchaseOrderInstance) {
	
			if (purchaseOrderInstance == null) {
				notFound()
				return
			}
	
			purchaseOrderInstance.delete flush:true
			purchaseOrderInstance.deleteSupplierRole()
	
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'PurchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])
					redirect action:"index", method:"GET"
				}
				'*'{ render status: NO_CONTENT }
			}
		}
		
		def toPartner(Bestellung purchaseOrderInstance) {
			//Anmeldung bei Partner setzen
			
			if (purchaseOrderInstance.loginPartner())
				println "Anmeldung bei Partner erfolgreich"
			else
				println "Anmeldung bei Partner fehlgeschlagen"
			String s =request.getRequestURL()
			//s enthält: http://localhost:8080/Sale/grails/bestellung/toPartner.dispatch
			String[] splits = s.split("/")
			String uri = "http://"+splits[2]+"/"+splits[3]+"/"+"Bestellung"
			purchaseOrderInstance.saveRueckUri(uri)
			def partnerUri = purchaseOrderInstance.partnerUri
			def partnerId = purchaseOrderInstance.partnerId
			def partnerArt = purchaseOrderInstance.partnerArt
			redirect(uri: "${partnerUri}/${partnerArt}/show/${partnerId}")
		}
	
		protected void notFound() {
			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
					redirect action: "index", method: "GET"
				}
				'*'{ render status: NOT_FOUND }
			}
		}
}
