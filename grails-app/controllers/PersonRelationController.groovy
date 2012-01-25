

class PersonRelationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ personRelationInstanceList: PersonRelation.list( params ), personRelationInstanceTotal: PersonRelation.count() ]
    }

    def show = {
        def personRelationInstance = PersonRelation.get( params.id )

        if(!personRelationInstance) {
            flash.message = "PersonRelation not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ personRelationInstance : personRelationInstance ] }
    }

    def delete = {
        def personRelationInstance = PersonRelation.get( params.id )
        if(personRelationInstance) {
            try {
                personRelationInstance.delete()
                flash.message = "PersonRelation ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PersonRelation ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PersonRelation not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def personRelationInstance = PersonRelation.get( params.id )

        if(!personRelationInstance) {
            flash.message = "PersonRelation not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ personRelationInstance : personRelationInstance ]
        }
    }

    def update = {
        def personRelationInstance = PersonRelation.get( params.id )
        if(personRelationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(personRelationInstance.version > version) {
                    
                    personRelationInstance.errors.rejectValue("version", "personRelation.optimistic.locking.failure", "Another user has updated this PersonRelation while you were editing.")
                    render(view:'edit',model:[personRelationInstance:personRelationInstance])
                    return
                }
            }
            personRelationInstance.properties = params
            if(!personRelationInstance.hasErrors() && personRelationInstance.save()) {
                flash.message = "PersonRelation ${params.id} updated"
                redirect(action:show,id:personRelationInstance.id)
            }
            else {
                render(view:'edit',model:[personRelationInstance:personRelationInstance])
            }
        }
        else {
            flash.message = "PersonRelation not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def personRelationInstance = new PersonRelation()
        personRelationInstance.properties = params
        return ['personRelationInstance':personRelationInstance]
    }

    def save = {
        def personRelationInstance = new PersonRelation(params)
        if(!personRelationInstance.hasErrors() && personRelationInstance.save()) {
            flash.message = "PersonRelation ${personRelationInstance.id} created"
            redirect(action:show,id:personRelationInstance.id)
        }
        else {
            render(view:'create',model:[personRelationInstance:personRelationInstance])
        }
    }
}
