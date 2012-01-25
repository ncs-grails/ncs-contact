

class PhoneController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 20,  100)
        [ phoneInstanceList: Phone.list( params ), phoneInstanceTotal: Phone.count() ]
    }

    def show = {
        def phoneInstance = Phone.get( params.id )

        if(!phoneInstance) {
            flash.message = "Phone not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ phoneInstance : phoneInstance ] }
    }

    def delete = {
        def phoneInstance = Phone.get( params.id )
        if(phoneInstance) {
            try {
                phoneInstance.delete()
                flash.message = "Phone ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Phone ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Phone not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def phoneInstance = Phone.get( params.id )

        if(!phoneInstance) {
            flash.message = "Phone not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ phoneInstance : phoneInstance ]
        }
    }

    def update = {
        def phoneInstance = Phone.get( params.id )
        if(phoneInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(phoneInstance.version > version) {
                    
                    phoneInstance.errors.rejectValue("version", "phone.optimistic.locking.failure", "Another user has updated this Phone while you were editing.")
                    render(view:'edit',model:[phoneInstance:phoneInstance])
                    return
                }
            }
            phoneInstance.properties = params
            if(!phoneInstance.hasErrors() && phoneInstance.save()) {
                flash.message = "Phone ${params.id} updated"
                redirect(action:show,id:phoneInstance.id)
            }
            else {
                render(view:'edit',model:[phoneInstance:phoneInstance])
            }
        }
        else {
            flash.message = "Phone not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def phoneInstance = new Phone()
        phoneInstance.properties = params
        return ['phoneInstance':phoneInstance]
    }

    def save = {
        def phoneInstance = new Phone(params)
        if(!phoneInstance.hasErrors() && phoneInstance.save()) {
            flash.message = "Phone ${phoneInstance.id} created"
            redirect(action:show,id:phoneInstance.id)
        }
        else {
            render(view:'create',model:[phoneInstance:phoneInstance])
        }
    }
}
