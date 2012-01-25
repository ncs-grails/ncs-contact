

class SourceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ sourceInstanceList: Source.list( params ), sourceInstanceTotal: Source.count() ]
    }

    def show = {
        def sourceInstance = Source.get( params.id )

        if(!sourceInstance) {
            flash.message = "Source not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ sourceInstance : sourceInstance ] }
    }

    def delete = {
        def sourceInstance = Source.get( params.id )
        if(sourceInstance) {
            try {
                sourceInstance.delete()
                flash.message = "Source ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Source ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Source not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def sourceInstance = Source.get( params.id )

        if(!sourceInstance) {
            flash.message = "Source not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ sourceInstance : sourceInstance ]
        }
    }

    def update = {
        def sourceInstance = Source.get( params.id )
        if(sourceInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(sourceInstance.version > version) {
                    
                    sourceInstance.errors.rejectValue("version", "source.optimistic.locking.failure", "Another user has updated this Source while you were editing.")
                    render(view:'edit',model:[sourceInstance:sourceInstance])
                    return
                }
            }
            sourceInstance.properties = params
            if(!sourceInstance.hasErrors() && sourceInstance.save()) {
                flash.message = "Source ${params.id} updated"
                redirect(action:show,id:sourceInstance.id)
            }
            else {
                render(view:'edit',model:[sourceInstance:sourceInstance])
            }
        }
        else {
            flash.message = "Source not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def sourceInstance = new Source()
        sourceInstance.properties = params
        return ['sourceInstance':sourceInstance]
    }

    def save = {
        def sourceInstance = new Source(params)
        if(!sourceInstance.hasErrors() && sourceInstance.save()) {
            flash.message = "Source ${sourceInstance.id} created"
            redirect(action:show,id:sourceInstance.id)
        }
        else {
            render(view:'create',model:[sourceInstance:sourceInstance])
        }
    }
}
