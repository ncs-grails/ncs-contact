

class SocialSecurityNumberController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ socialSecurityNumberInstanceList: SocialSecurityNumber.list( params ), socialSecurityNumberInstanceTotal: SocialSecurityNumber.count() ]
    }

    def show = {
        def socialSecurityNumberInstance = SocialSecurityNumber.get( params.id )

        if(!socialSecurityNumberInstance) {
            flash.message = "SocialSecurityNumber not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ socialSecurityNumberInstance : socialSecurityNumberInstance ] }
    }

    def delete = {
        def socialSecurityNumberInstance = SocialSecurityNumber.get( params.id )
        if(socialSecurityNumberInstance) {
            try {
                socialSecurityNumberInstance.delete()
                flash.message = "SocialSecurityNumber ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "SocialSecurityNumber ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "SocialSecurityNumber not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def socialSecurityNumberInstance = SocialSecurityNumber.get( params.id )

        if(!socialSecurityNumberInstance) {
            flash.message = "SocialSecurityNumber not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ socialSecurityNumberInstance : socialSecurityNumberInstance ]
        }
    }

    def update = {
        def socialSecurityNumberInstance = SocialSecurityNumber.get( params.id )
        if(socialSecurityNumberInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(socialSecurityNumberInstance.version > version) {
                    
                    socialSecurityNumberInstance.errors.rejectValue("version", "socialSecurityNumber.optimistic.locking.failure", "Another user has updated this SocialSecurityNumber while you were editing.")
                    render(view:'edit',model:[socialSecurityNumberInstance:socialSecurityNumberInstance])
                    return
                }
            }
            socialSecurityNumberInstance.properties = params
            if(!socialSecurityNumberInstance.hasErrors() && socialSecurityNumberInstance.save()) {
                flash.message = "SocialSecurityNumber ${params.id} updated"
                redirect(action:show,id:socialSecurityNumberInstance.id)
            }
            else {
                render(view:'edit',model:[socialSecurityNumberInstance:socialSecurityNumberInstance])
            }
        }
        else {
            flash.message = "SocialSecurityNumber not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def socialSecurityNumberInstance = new SocialSecurityNumber()
        socialSecurityNumberInstance.properties = params
        return ['socialSecurityNumberInstance':socialSecurityNumberInstance]
    }

    def save = {
        def socialSecurityNumberInstance = new SocialSecurityNumber(params)
        if(!socialSecurityNumberInstance.hasErrors() && socialSecurityNumberInstance.save()) {
            flash.message = "SocialSecurityNumber ${socialSecurityNumberInstance.id} created"
            redirect(action:show,id:socialSecurityNumberInstance.id)
        }
        else {
            render(view:'create',model:[socialSecurityNumberInstance:socialSecurityNumberInstance])
        }
    }
}
