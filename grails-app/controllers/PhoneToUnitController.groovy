

class PhoneToUnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ phoneToUnitInstanceList: PhoneToUnit.list( params ), phoneToUnitInstanceTotal: PhoneToUnit.count() ]
    }

    def show = {
        def phoneToUnitInstance = PhoneToUnit.get( params.id )

        if(!phoneToUnitInstance) {
            flash.message = "PhoneToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ phoneToUnitInstance : phoneToUnitInstance ] }
    }

    def delete = {
        def phoneToUnitInstance = PhoneToUnit.get( params.id )
        if(phoneToUnitInstance) {
            try {
                phoneToUnitInstance.delete()
                flash.message = "PhoneToUnit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PhoneToUnit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PhoneToUnit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def phoneToUnitInstance = PhoneToUnit.get( params.id )

        if(!phoneToUnitInstance) {
            flash.message = "PhoneToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ phoneToUnitInstance : phoneToUnitInstance ]
        }
    }

    def update = {
        def phoneToUnitInstance = PhoneToUnit.get( params.id )
        if(phoneToUnitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(phoneToUnitInstance.version > version) {
                    
                    phoneToUnitInstance.errors.rejectValue("version", "phoneToUnit.optimistic.locking.failure", "Another user has updated this PhoneToUnit while you were editing.")
                    render(view:'edit',model:[phoneToUnitInstance:phoneToUnitInstance])
                    return
                }
            }
            phoneToUnitInstance.properties = params
            if(!phoneToUnitInstance.hasErrors() && phoneToUnitInstance.save()) {
                flash.message = "PhoneToUnit ${params.id} updated"
                redirect(action:show,id:phoneToUnitInstance.id)
            }
            else {
                render(view:'edit',model:[phoneToUnitInstance:phoneToUnitInstance])
            }
        }
        else {
            flash.message = "PhoneToUnit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def phoneToUnitInstance = new PhoneToUnit()
        phoneToUnitInstance.properties = params
        return ['phoneToUnitInstance':phoneToUnitInstance]
    }

    def save = {
        def phoneToUnitInstance = new PhoneToUnit(params)
        if(!phoneToUnitInstance.hasErrors() && phoneToUnitInstance.save()) {
            flash.message = "PhoneToUnit ${phoneToUnitInstance.id} created"
            redirect(action:show,id:phoneToUnitInstance.id)
        }
        else {
            render(view:'create',model:[phoneToUnitInstance:phoneToUnitInstance])
        }
    }
}
