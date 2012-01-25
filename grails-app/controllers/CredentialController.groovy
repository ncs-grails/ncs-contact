

class CredentialController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ credentialInstanceList: Credential.list( params ), credentialInstanceTotal: Credential.count() ]
    }

    def show = {
        def credentialInstance = Credential.get( params.id )

        if(!credentialInstance) {
            flash.message = "Credential not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ credentialInstance : credentialInstance ] }
    }

    def delete = {
        def credentialInstance = Credential.get( params.id )
        if(credentialInstance) {
            try {
                credentialInstance.delete()
                flash.message = "Credential ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Credential ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Credential not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def credentialInstance = Credential.get( params.id )

        if(!credentialInstance) {
            flash.message = "Credential not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ credentialInstance : credentialInstance ]
        }
    }

    def update = {
        def credentialInstance = Credential.get( params.id )
        if(credentialInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(credentialInstance.version > version) {
                    
                    credentialInstance.errors.rejectValue("version", "credential.optimistic.locking.failure", "Another user has updated this Credential while you were editing.")
                    render(view:'edit',model:[credentialInstance:credentialInstance])
                    return
                }
            }
            credentialInstance.properties = params
            if(!credentialInstance.hasErrors() && credentialInstance.save()) {
                flash.message = "Credential ${params.id} updated"
                redirect(action:show,id:credentialInstance.id)
            }
            else {
                render(view:'edit',model:[credentialInstance:credentialInstance])
            }
        }
        else {
            flash.message = "Credential not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def credentialInstance = new Credential()
        credentialInstance.properties = params
        return ['credentialInstance':credentialInstance]
    }

    def save = {
        def credentialInstance = new Credential(params)
        if(!credentialInstance.hasErrors() && credentialInstance.save()) {
            flash.message = "Credential ${credentialInstance.id} created"
            redirect(action:show,id:credentialInstance.id)
        }
        else {
            render(view:'create',model:[credentialInstance:credentialInstance])
        }
    }
}
