

class UnitRelationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ unitRelationInstanceList: UnitRelation.list( params ), unitRelationInstanceTotal: UnitRelation.count() ]
    }

    def show = {
        def unitRelationInstance = UnitRelation.get( params.id )

        if(!unitRelationInstance) {
            flash.message = "UnitRelation not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ unitRelationInstance : unitRelationInstance ] }
    }

    def delete = {
        def unitRelationInstance = UnitRelation.get( params.id )
        if(unitRelationInstance) {
            try {
                unitRelationInstance.delete()
                flash.message = "UnitRelation ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UnitRelation ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UnitRelation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def unitRelationInstance = UnitRelation.get( params.id )

        if(!unitRelationInstance) {
            flash.message = "UnitRelation not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ unitRelationInstance : unitRelationInstance ]
        }
    }

    def update = {
        def unitRelationInstance = UnitRelation.get( params.id )
        if(unitRelationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(unitRelationInstance.version > version) {
                    
                    unitRelationInstance.errors.rejectValue("version", "unitRelation.optimistic.locking.failure", "Another user has updated this UnitRelation while you were editing.")
                    render(view:'edit',model:[unitRelationInstance:unitRelationInstance])
                    return
                }
            }
            unitRelationInstance.properties = params
            if(!unitRelationInstance.hasErrors() && unitRelationInstance.save()) {
                flash.message = "UnitRelation ${params.id} updated"
                redirect(action:show,id:unitRelationInstance.id)
            }
            else {
                render(view:'edit',model:[unitRelationInstance:unitRelationInstance])
            }
        }
        else {
            flash.message = "UnitRelation not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def unitRelationInstance = new UnitRelation()
        unitRelationInstance.properties = params
        return ['unitRelationInstance':unitRelationInstance]
    }

    def save = {
        def unitRelationInstance = new UnitRelation(params)
        if(!unitRelationInstance.hasErrors() && unitRelationInstance.save()) {
            flash.message = "UnitRelation ${unitRelationInstance.id} created"
            redirect(action:show,id:unitRelationInstance.id)
        }
        else {
            render(view:'create',model:[unitRelationInstance:unitRelationInstance])
        }
    }
}
