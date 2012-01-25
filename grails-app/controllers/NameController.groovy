

class NameController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ nameInstanceList: Name.list( params ), nameInstanceTotal: Name.count() ]
    }

    def show = {
        def nameInstance = Name.get( params.id )

        if(!nameInstance) {
            flash.message = "Name not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ nameInstance : nameInstance ] }
    }

    def delete = {
        def nameInstance = Name.get( params.id )
        if(nameInstance) {
            try {
                nameInstance.delete()
                flash.message = "Name ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Name ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Name not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def nameInstance = Name.get( params.id )

        if(!nameInstance) {
            flash.message = "Name not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ nameInstance : nameInstance ]
        }
    }

    def update = {
        def nameInstance = Name.get( params.id )
        if(nameInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(nameInstance.version > version) {
                    
                    nameInstance.errors.rejectValue("version", "name.optimistic.locking.failure", "Another user has updated this Name while you were editing.")
                    render(view:'edit',model:[nameInstance:nameInstance])
                    return
                }
            }
            nameInstance.properties = params
            if(!nameInstance.hasErrors() && nameInstance.save()) {
                flash.message = "Name ${params.id} updated"
                redirect(action:show,id:nameInstance.id)
            }
            else {
                render(view:'edit',model:[nameInstance:nameInstance])
            }
        }
        else {
            flash.message = "Name not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def nameInstance = new Name()
        nameInstance.properties = params
        return ['nameInstance':nameInstance]
    }

    def save = {
        def nameInstance = new Name(params)
        if(!nameInstance.hasErrors() && nameInstance.save()) {
            flash.message = "Name ${nameInstance.id} created"
            redirect(action:show,id:nameInstance.id)
        }
        else {
            render(view:'create',model:[nameInstance:nameInstance])
        }
    }
}
