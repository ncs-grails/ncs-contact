

class AddressToUnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ addressToUnitInstanceList: AddressToUnit.list( params ), addressToUnitInstanceTotal: AddressToUnit.count() ]
    }

    def show = {
        def addressToUnitInstance = AddressToUnit.get( params.id )

        if(!addressToUnitInstance) {
            flash.message = "AddressToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ addressToUnitInstance : addressToUnitInstance ] }
    }

    def delete = {
        def addressToUnitInstance = AddressToUnit.get( params.id )
        if(addressToUnitInstance) {
            try {
                addressToUnitInstance.delete()
                flash.message = "AddressToUnit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "AddressToUnit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "AddressToUnit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def addressToUnitInstance = AddressToUnit.get( params.id )

        if(!addressToUnitInstance) {
            flash.message = "AddressToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ addressToUnitInstance : addressToUnitInstance ]
        }
    }

    def update = {
        def addressToUnitInstance = AddressToUnit.get( params.id )
        if(addressToUnitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(addressToUnitInstance.version > version) {
                    
                    addressToUnitInstance.errors.rejectValue("version", "addressToUnit.optimistic.locking.failure", "Another user has updated this AddressToUnit while you were editing.")
                    render(view:'edit',model:[addressToUnitInstance:addressToUnitInstance])
                    return
                }
            }
            addressToUnitInstance.properties = params
            if(!addressToUnitInstance.hasErrors() && addressToUnitInstance.save()) {
                flash.message = "AddressToUnit ${params.id} updated"
                redirect(action:show,id:addressToUnitInstance.id)
            }
            else {
                render(view:'edit',model:[addressToUnitInstance:addressToUnitInstance])
            }
        }
        else {
            flash.message = "AddressToUnit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def addressToUnitInstance = new AddressToUnit()
        addressToUnitInstance.properties = params
        return ['addressToUnitInstance':addressToUnitInstance]
    }

    def save = {
        def addressToUnitInstance = new AddressToUnit(params)
        if(!addressToUnitInstance.hasErrors() && addressToUnitInstance.save()) {
            flash.message = "AddressToUnit ${addressToUnitInstance.id} created"
            redirect(action:show,id:addressToUnitInstance.id)
        }
        else {
            render(view:'create',model:[addressToUnitInstance:addressToUnitInstance])
        }
    }
}
