

class NameTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ nameTypeInstanceList: NameType.list( params ), nameTypeInstanceTotal: NameType.count() ]
    }

    def show = {
        def nameTypeInstance = NameType.get( params.id )

        if(!nameTypeInstance) {
            flash.message = "NameType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ nameTypeInstance : nameTypeInstance ] }
    }

    def delete = {
        def nameTypeInstance = NameType.get( params.id )
        if(nameTypeInstance) {
            try {
                nameTypeInstance.delete()
                flash.message = "NameType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "NameType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "NameType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def nameTypeInstance = NameType.get( params.id )

        if(!nameTypeInstance) {
            flash.message = "NameType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ nameTypeInstance : nameTypeInstance ]
        }
    }

    def update = {
        def nameTypeInstance = NameType.get( params.id )
        if(nameTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(nameTypeInstance.version > version) {
                    
                    nameTypeInstance.errors.rejectValue("version", "nameType.optimistic.locking.failure", "Another user has updated this NameType while you were editing.")
                    render(view:'edit',model:[nameTypeInstance:nameTypeInstance])
                    return
                }
            }
            nameTypeInstance.properties = params
            if(!nameTypeInstance.hasErrors() && nameTypeInstance.save()) {
                flash.message = "NameType ${params.id} updated"
                redirect(action:show,id:nameTypeInstance.id)
            }
            else {
                render(view:'edit',model:[nameTypeInstance:nameTypeInstance])
            }
        }
        else {
            flash.message = "NameType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def nameTypeInstance = new NameType()
        nameTypeInstance.properties = params
        return ['nameTypeInstance':nameTypeInstance]
    }

    def save = {
        def nameTypeInstance = new NameType(params)
        if(!nameTypeInstance.hasErrors() && nameTypeInstance.save()) {
            flash.message = "NameType ${nameTypeInstance.id} created"
            redirect(action:show,id:nameTypeInstance.id)
        }
        else {
            render(view:'create',model:[nameTypeInstance:nameTypeInstance])
        }
    }
}
