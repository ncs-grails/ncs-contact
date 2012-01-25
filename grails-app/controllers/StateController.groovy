

class StateController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ stateInstanceList: State.list( params ), stateInstanceTotal: State.count() ]
    }

    def show = {
        def stateInstance = State.get( params.id )

        if(!stateInstance) {
            flash.message = "State not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ stateInstance : stateInstance ] }
    }

    def delete = {
        def stateInstance = State.get( params.id )
        if(stateInstance) {
            try {
                stateInstance.delete()
                flash.message = "State ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "State ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "State not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def stateInstance = State.get( params.id )

        if(!stateInstance) {
            flash.message = "State not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ stateInstance : stateInstance ]
        }
    }

    def update = {
        def stateInstance = State.get( params.id )
        if(stateInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(stateInstance.version > version) {
                    
                    stateInstance.errors.rejectValue("version", "state.optimistic.locking.failure", "Another user has updated this State while you were editing.")
                    render(view:'edit',model:[stateInstance:stateInstance])
                    return
                }
            }
            stateInstance.properties = params
            if(!stateInstance.hasErrors() && stateInstance.save()) {
                flash.message = "State ${params.id} updated"
                redirect(action:show,id:stateInstance.id)
            }
            else {
                render(view:'edit',model:[stateInstance:stateInstance])
            }
        }
        else {
            flash.message = "State not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def stateInstance = new State()
        stateInstance.properties = params
        return ['stateInstance':stateInstance]
    }

    def save = {
        def stateInstance = new State(params)
        if(!stateInstance.hasErrors() && stateInstance.save()) {
            flash.message = "State ${stateInstance.id} created"
            redirect(action:show,id:stateInstance.id)
        }
        else {
            render(view:'create',model:[stateInstance:stateInstance])
        }
    }
}
