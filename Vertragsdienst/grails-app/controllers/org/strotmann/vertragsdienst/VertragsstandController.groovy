package org.strotmann.vertragsdienst



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VertragsstandController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vertragsstand.list(params), model:[vertragsstandInstanceCount: Vertragsstand.count()]
    }

    def show(Vertragsstand vertragsstandInstance) {
        respond vertragsstandInstance
    }

    def create() {
		flash.versicherungsvertrag = Versicherungsvertrag.get(params.versicherungsvertrag.id)
        respond new Vertragsstand(params)
    }

    @Transactional
    def save(Vertragsstand vertragsstandInstance) {
        if (vertragsstandInstance == null) {
            notFound()
            return
        }

        if (vertragsstandInstance.hasErrors()) {
            respond vertragsstandInstance.errors, view:'create'
            return
        }

        vertragsstandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vertragsstand.label', default: 'Vertragsstand'), vertragsstandInstance.id])
                redirect vertragsstandInstance
            }
            '*' { respond vertragsstandInstance, [status: CREATED] }
        }
    }

    def edit(Vertragsstand vertragsstandInstance) {
        respond vertragsstandInstance
    }

    @Transactional
    def update(Vertragsstand vertragsstandInstance) {
        if (vertragsstandInstance == null) {
            notFound()
            return
        }

        if (vertragsstandInstance.hasErrors()) {
            respond vertragsstandInstance.errors, view:'edit'
            return
        }

        vertragsstandInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vertragsstand.label', default: 'Vertragsstand'), vertragsstandInstance.id])
                redirect vertragsstandInstance
            }
            '*'{ respond vertragsstandInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vertragsstand vertragsstandInstance) {

        if (vertragsstandInstance == null) {
            notFound()
            return
        }

        vertragsstandInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vertragsstand.label', default: 'Vertragsstand'), vertragsstandInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vertragsstand.label', default: 'Vertragsstand'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
