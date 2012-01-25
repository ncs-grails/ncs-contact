

class UserToSourceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ userToSourceInstanceList: UserToSource.list( params ), userToSourceInstanceTotal: UserToSource.count() ]
    }

    def show = {
        def userToSourceInstance = UserToSource.get( params.id )

        if(!userToSourceInstance) {
            flash.message = "UserToSource not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ userToSourceInstance : userToSourceInstance ] }
    }

    def delete = {
        def userToSourceInstance = UserToSource.get( params.id )
        if(userToSourceInstance) {
            try {
                userToSourceInstance.delete()
                flash.message = "UserToSource ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UserToSource ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UserToSource not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def userToSourceInstance = UserToSource.get( params.id )

        if(!userToSourceInstance) {
            flash.message = "UserToSource not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ userToSourceInstance : userToSourceInstance ]
        }
    }

    def update = {
        def userToSourceInstance = UserToSource.get( params.id )
        if(userToSourceInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(userToSourceInstance.version > version) {
                    
                    userToSourceInstance.errors.rejectValue("version", "userToSource.optimistic.locking.failure", "Another user has updated this UserToSource while you were editing.")
                    render(view:'edit',model:[userToSourceInstance:userToSourceInstance])
                    return
                }
            }
            userToSourceInstance.properties = params
            if(!userToSourceInstance.hasErrors() && userToSourceInstance.save()) {
                flash.message = "UserToSource ${params.id} updated"
                redirect(action:show,id:userToSourceInstance.id)
            }
            else {
                render(view:'edit',model:[userToSourceInstance:userToSourceInstance])
            }
        }
        else {
            flash.message = "UserToSource not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def userToSourceInstance = new UserToSource()
        userToSourceInstance.properties = params
        return ['userToSourceInstance':userToSourceInstance]
    }

    def save = {
        def userToSourceInstance = new UserToSource(params)
        if(!userToSourceInstance.hasErrors() && userToSourceInstance.save()) {
            flash.message = "UserToSource ${userToSourceInstance.id} created"
            redirect(action:show,id:userToSourceInstance.id)
        }
        else {
            render(view:'create',model:[userToSourceInstance:userToSourceInstance])
        }
    }
}
