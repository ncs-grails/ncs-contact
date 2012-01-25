

class UnitToUnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ unitToUnitInstanceList: UnitToUnit.list( params ), unitToUnitInstanceTotal: UnitToUnit.count() ]
    }

    def show = {
        def unitToUnitInstance = UnitToUnit.get( params.id )

        if(!unitToUnitInstance) {
            flash.message = "UnitToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ unitToUnitInstance : unitToUnitInstance ] }
    }

    def delete = {
        def unitToUnitInstance = UnitToUnit.get( params.id )
        if(unitToUnitInstance) {
            try {
                unitToUnitInstance.delete()
                flash.message = "UnitToUnit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UnitToUnit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UnitToUnit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def unitToUnitInstance = UnitToUnit.get( params.id )

        if(!unitToUnitInstance) {
            flash.message = "UnitToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ unitToUnitInstance : unitToUnitInstance ]
        }
    }

    def update = {
        def unitToUnitInstance = UnitToUnit.get( params.id )
        if(unitToUnitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(unitToUnitInstance.version > version) {
                    
                    unitToUnitInstance.errors.rejectValue("version", "unitToUnit.optimistic.locking.failure", "Another user has updated this UnitToUnit while you were editing.")
                    render(view:'edit',model:[unitToUnitInstance:unitToUnitInstance])
                    return
                }
            }
            unitToUnitInstance.properties = params
            if(!unitToUnitInstance.hasErrors() && unitToUnitInstance.save()) {
                flash.message = "UnitToUnit ${params.id} updated"
                redirect(action:show,id:unitToUnitInstance.id)
            }
            else {
                render(view:'edit',model:[unitToUnitInstance:unitToUnitInstance])
            }
        }
        else {
            flash.message = "UnitToUnit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def unitToUnitInstance = new UnitToUnit()
        unitToUnitInstance.properties = params
        return ['unitToUnitInstance':unitToUnitInstance]
    }

    def save = {
        def unitToUnitInstance = new UnitToUnit(params)
        if(!unitToUnitInstance.hasErrors() && unitToUnitInstance.save()) {
            flash.message = "UnitToUnit ${unitToUnitInstance.id} created"
            redirect(action:show,id:unitToUnitInstance.id)
        }
        else {
            render(view:'create',model:[unitToUnitInstance:unitToUnitInstance])
        }
    }
}
