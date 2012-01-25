

class AddressTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ addressTypeInstanceList: AddressType.list( params ), addressTypeInstanceTotal: AddressType.count() ]
    }

    def show = {
        def addressTypeInstance = AddressType.get( params.id )

        if(!addressTypeInstance) {
            flash.message = "AddressType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ addressTypeInstance : addressTypeInstance ] }
    }

    def delete = {
        def addressTypeInstance = AddressType.get( params.id )
        if(addressTypeInstance) {
            try {
                addressTypeInstance.delete()
                flash.message = "AddressType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "AddressType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "AddressType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def addressTypeInstance = AddressType.get( params.id )

        if(!addressTypeInstance) {
            flash.message = "AddressType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ addressTypeInstance : addressTypeInstance ]
        }
    }

    def update = {
        def addressTypeInstance = AddressType.get( params.id )
        if(addressTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(addressTypeInstance.version > version) {
                    
                    addressTypeInstance.errors.rejectValue("version", "addressType.optimistic.locking.failure", "Another user has updated this AddressType while you were editing.")
                    render(view:'edit',model:[addressTypeInstance:addressTypeInstance])
                    return
                }
            }
            addressTypeInstance.properties = params
            if(!addressTypeInstance.hasErrors() && addressTypeInstance.save()) {
                flash.message = "AddressType ${params.id} updated"
                redirect(action:show,id:addressTypeInstance.id)
            }
            else {
                render(view:'edit',model:[addressTypeInstance:addressTypeInstance])
            }
        }
        else {
            flash.message = "AddressType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def addressTypeInstance = new AddressType()
        addressTypeInstance.properties = params
        return ['addressTypeInstance':addressTypeInstance]
    }

    def save = {
        def addressTypeInstance = new AddressType(params)
        if(!addressTypeInstance.hasErrors() && addressTypeInstance.save()) {
            flash.message = "AddressType ${addressTypeInstance.id} created"
            redirect(action:show,id:addressTypeInstance.id)
        }
        else {
            render(view:'create',model:[addressTypeInstance:addressTypeInstance])
        }
    }
}
