

class PhoneTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ phoneTypeInstanceList: PhoneType.list( params ), phoneTypeInstanceTotal: PhoneType.count() ]
    }

    def show = {
        def phoneTypeInstance = PhoneType.get( params.id )

        if(!phoneTypeInstance) {
            flash.message = "PhoneType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ phoneTypeInstance : phoneTypeInstance ] }
    }

    def delete = {
        def phoneTypeInstance = PhoneType.get( params.id )
        if(phoneTypeInstance) {
            try {
                phoneTypeInstance.delete()
                flash.message = "PhoneType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PhoneType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PhoneType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def phoneTypeInstance = PhoneType.get( params.id )

        if(!phoneTypeInstance) {
            flash.message = "PhoneType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ phoneTypeInstance : phoneTypeInstance ]
        }
    }

    def update = {
        def phoneTypeInstance = PhoneType.get( params.id )
        if(phoneTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(phoneTypeInstance.version > version) {
                    
                    phoneTypeInstance.errors.rejectValue("version", "phoneType.optimistic.locking.failure", "Another user has updated this PhoneType while you were editing.")
                    render(view:'edit',model:[phoneTypeInstance:phoneTypeInstance])
                    return
                }
            }
            phoneTypeInstance.properties = params
            if(!phoneTypeInstance.hasErrors() && phoneTypeInstance.save()) {
                flash.message = "PhoneType ${params.id} updated"
                redirect(action:show,id:phoneTypeInstance.id)
            }
            else {
                render(view:'edit',model:[phoneTypeInstance:phoneTypeInstance])
            }
        }
        else {
            flash.message = "PhoneType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def phoneTypeInstance = new PhoneType()
        phoneTypeInstance.properties = params
        return ['phoneTypeInstance':phoneTypeInstance]
    }

    def save = {
        def phoneTypeInstance = new PhoneType(params)
        if(!phoneTypeInstance.hasErrors() && phoneTypeInstance.save()) {
            flash.message = "PhoneType ${phoneTypeInstance.id} created"
            redirect(action:show,id:phoneTypeInstance.id)
        }
        else {
            render(view:'create',model:[phoneTypeInstance:phoneTypeInstance])
        }
    }
}
