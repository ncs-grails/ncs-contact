

class PhoneToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ phoneToPersonInstanceList: PhoneToPerson.list( params ), phoneToPersonInstanceTotal: PhoneToPerson.count() ]
    }

    def show = {
        def phoneToPersonInstance = PhoneToPerson.get( params.id )

        if(!phoneToPersonInstance) {
            flash.message = "PhoneToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ phoneToPersonInstance : phoneToPersonInstance ] }
    }

    def delete = {
        def phoneToPersonInstance = PhoneToPerson.get( params.id )
        if(phoneToPersonInstance) {
            try {
                phoneToPersonInstance.delete()
                flash.message = "PhoneToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PhoneToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PhoneToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def phoneToPersonInstance = PhoneToPerson.get( params.id )

        if(!phoneToPersonInstance) {
            flash.message = "PhoneToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ phoneToPersonInstance : phoneToPersonInstance ]
        }
    }

    def update = {
        def phoneToPersonInstance = PhoneToPerson.get( params.id )
        if(phoneToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(phoneToPersonInstance.version > version) {
                    
                    phoneToPersonInstance.errors.rejectValue("version", "phoneToPerson.optimistic.locking.failure", "Another user has updated this PhoneToPerson while you were editing.")
                    render(view:'edit',model:[phoneToPersonInstance:phoneToPersonInstance])
                    return
                }
            }
            phoneToPersonInstance.properties = params
            if(!phoneToPersonInstance.hasErrors() && phoneToPersonInstance.save()) {
                flash.message = "PhoneToPerson ${params.id} updated"
                redirect(action:show,id:phoneToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[phoneToPersonInstance:phoneToPersonInstance])
            }
        }
        else {
            flash.message = "PhoneToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {

        def phoneInstance = new Phone(countryCode:1)
        phoneInstance.properties = params
        def phoneToPersonInstance = new PhoneToPerson(params)
        phoneToPersonInstance.phone = phoneInstance
        
        return ['phoneToPersonInstance':phoneToPersonInstance]
    }

    def save = {
        def phoneInstance = new Phone(params["phone"])
        def phoneToPersonInstance = new PhoneToPerson(params)

        if (!phoneToPersonInstance.hasErrors() && !phoneInstance.hasErrors() && phoneInstance.save()) {
             phoneToPersonInstance.phone = phoneInstance
        
            if(phoneToPersonInstance.save()) {
                flash.message = "PhoneToPerson ${phoneToPersonInstance.id} created"
                redirect(action:show,id:phoneToPersonInstance.id)
            } else {
                render(view:'create',model:[phoneToPersonInstance:phoneToPersonInstance])
            }
        } else {
            render(view:'create',model:[phoneToPersonInstance:phoneToPersonInstance])
        }

    }
}
