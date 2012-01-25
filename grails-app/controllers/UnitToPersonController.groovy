

class UnitToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ unitToPersonInstanceList: UnitToPerson.list( params ), unitToPersonInstanceTotal: UnitToPerson.count() ]
    }

    def show = {
        def unitToPersonInstance = UnitToPerson.get( params.id )

        if(!unitToPersonInstance) {
            flash.message = "UnitToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ unitToPersonInstance : unitToPersonInstance ] }
    }

    def delete = {
        def unitToPersonInstance = UnitToPerson.get( params.id )
        if(unitToPersonInstance) {
            try {
                unitToPersonInstance.delete()
                flash.message = "UnitToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UnitToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UnitToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def unitToPersonInstance = UnitToPerson.get( params.id )

        if(!unitToPersonInstance) {
            flash.message = "UnitToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ unitToPersonInstance : unitToPersonInstance ]
        }
    }

    def update = {
        def unitToPersonInstance = UnitToPerson.get( params.id )
        if(unitToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(unitToPersonInstance.version > version) {
                    
                    unitToPersonInstance.errors.rejectValue("version", "unitToPerson.optimistic.locking.failure", "Another user has updated this UnitToPerson while you were editing.")
                    render(view:'edit',model:[unitToPersonInstance:unitToPersonInstance])
                    return
                }
            }
            unitToPersonInstance.properties = params
            if(!unitToPersonInstance.hasErrors() && unitToPersonInstance.save()) {
                flash.message = "UnitToPerson ${params.id} updated"
                redirect(action:show,id:unitToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[unitToPersonInstance:unitToPersonInstance])
            }
        }
        else {
            flash.message = "UnitToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def unitToPersonInstance = new UnitToPerson()
        unitToPersonInstance.properties = params
        return ['unitToPersonInstance':unitToPersonInstance]
    }

    def save = {
        def unitToPersonInstance = new UnitToPerson(params)
        if(!unitToPersonInstance.hasErrors() && unitToPersonInstance.save()) {
            flash.message = "UnitToPerson ${unitToPersonInstance.id} created"
            redirect(action:show,id:unitToPersonInstance.id)
        }
        else {
            render(view:'create',model:[unitToPersonInstance:unitToPersonInstance])
        }
    }
}
