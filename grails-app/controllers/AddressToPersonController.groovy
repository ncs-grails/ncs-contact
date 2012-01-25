

class AddressToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ addressToPersonInstanceList: AddressToPerson.list( params ), addressToPersonInstanceTotal: AddressToPerson.count() ]
    }

    def show = {
        def addressToPersonInstance = AddressToPerson.get( params.id )

        if(!addressToPersonInstance) {
            flash.message = "AddressToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ addressToPersonInstance : addressToPersonInstance ] }
    }

    def delete = {
        def addressToPersonInstance = AddressToPerson.get( params.id )
        if(addressToPersonInstance) {
            try {
                addressToPersonInstance.delete()
                flash.message = "AddressToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "AddressToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "AddressToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def addressToPersonInstance = AddressToPerson.get( params.id )

        if(!addressToPersonInstance) {
            flash.message = "AddressToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ addressToPersonInstance : addressToPersonInstance ]
        }
    }

    def update = {
        def addressToPersonInstance = AddressToPerson.get( params.id )
        if(addressToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(addressToPersonInstance.version > version) {
                    
                    addressToPersonInstance.errors.rejectValue("version", "addressToPerson.optimistic.locking.failure", "Another user has updated this AddressToPerson while you were editing.")
                    render(view:'edit',model:[addressToPersonInstance:addressToPersonInstance])
                    return
                }
            }
            addressToPersonInstance.properties = params
            if(!addressToPersonInstance.hasErrors() && addressToPersonInstance.save()) {
                flash.message = "AddressToPerson ${params.id} updated"
                redirect(action:show,id:addressToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[addressToPersonInstance:addressToPersonInstance])
            }
        }
        else {
            flash.message = "AddressToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def addressInstance = new Address(state: State.findByAbbreviation("MN"), country: Country.findByAbbreviation("US"))
        def addressToPersonInstance = new AddressToPerson(deliveryAddress: addressInstance)

        addressToPersonInstance.properties = params
        return ['addressToPersonInstance':addressToPersonInstance, 'addressInstance':addressInstance]
    }

    def save = {
        def addressToPersonInstance = new AddressToPerson(params["addressToPerson"])
        def addressInstance = new Address(params["address"])
        
        addressToPersonInstance.deliveryAddress = addressInstance
        
        if (!addressToPersonInstance.hasErrors() && !addressInstance.hasErrors() && addressInstance.save()) {
            addressToPersonInstance.deliveryAddress = addressInstance
            if(addressToPersonInstance.save()) {
                flash.message = "AddressToPerson ${addressToPersonInstance.id} created"
               redirect(action:show,id:addressToPersonInstance.id)
            } else {
                render(view:'create',model:[addressToPersonInstance:addressToPersonInstance, addressInstance:addressInstance])
            }
        } else {
            render(view:'create',model:[addressToPersonInstance:addressToPersonInstance, addressInstance:addressInstance])
            
        }
    }
}
