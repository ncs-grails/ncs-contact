

class PersonToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ personToPersonInstanceList: PersonToPerson.list( params ), personToPersonInstanceTotal: PersonToPerson.count() ]
    }

    def show = {
        def personToPersonInstance = PersonToPerson.get( params.id )

        if(!personToPersonInstance) {
            flash.message = "PersonToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ personToPersonInstance : personToPersonInstance ] }
    }

    def delete = {
        def personToPersonInstance = PersonToPerson.get( params.id )
        if(personToPersonInstance) {
            try {
                personToPersonInstance.delete()
                flash.message = "PersonToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "PersonToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "PersonToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def personToPersonInstance = PersonToPerson.get( params.id )

        if(!personToPersonInstance) {
            flash.message = "PersonToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ personToPersonInstance : personToPersonInstance ]
        }
    }

    def update = {
        def personToPersonInstance = PersonToPerson.get( params.id )
        if(personToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(personToPersonInstance.version > version) {
                    
                    personToPersonInstance.errors.rejectValue("version", "personToPerson.optimistic.locking.failure", "Another user has updated this PersonToPerson while you were editing.")
                    render(view:'edit',model:[personToPersonInstance:personToPersonInstance])
                    return
                }
            }
            personToPersonInstance.properties = params
            if(!personToPersonInstance.hasErrors() && personToPersonInstance.save()) {
                flash.message = "PersonToPerson ${params.id} updated"
                redirect(action:show,id:personToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[personToPersonInstance:personToPersonInstance])
            }
        }
        else {
            flash.message = "PersonToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def personToPersonInstance = new PersonToPerson()
        personToPersonInstance.properties = params
        return ['personToPersonInstance':personToPersonInstance]
    }

    def save = {
        def personToPersonInstance = new PersonToPerson(params)
        if(!personToPersonInstance.hasErrors() && personToPersonInstance.save()) {
            flash.message = "PersonToPerson ${personToPersonInstance.id} created"
            redirect(action:show,id:personToPersonInstance.id)
        }
        else {
            render(view:'create',model:[personToPersonInstance:personToPersonInstance])
        }
    }
}
