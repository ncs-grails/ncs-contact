

class ResourceTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ resourceTypeInstanceList: ResourceType.list( params ), resourceTypeInstanceTotal: ResourceType.count() ]
    }

    def show = {
        def resourceTypeInstance = ResourceType.get( params.id )

        if(!resourceTypeInstance) {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ resourceTypeInstance : resourceTypeInstance ] }
    }

    def delete = {
        def resourceTypeInstance = ResourceType.get( params.id )
        if(resourceTypeInstance) {
            try {
                resourceTypeInstance.delete()
                flash.message = "ResourceType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "ResourceType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def resourceTypeInstance = ResourceType.get( params.id )

        if(!resourceTypeInstance) {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ resourceTypeInstance : resourceTypeInstance ]
        }
    }

    def update = {
        def resourceTypeInstance = ResourceType.get( params.id )
        if(resourceTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(resourceTypeInstance.version > version) {
                    
                    resourceTypeInstance.errors.rejectValue("version", "resourceType.optimistic.locking.failure", "Another user has updated this ResourceType while you were editing.")
                    render(view:'edit',model:[resourceTypeInstance:resourceTypeInstance])
                    return
                }
            }
            resourceTypeInstance.properties = params
            if(!resourceTypeInstance.hasErrors() && resourceTypeInstance.save()) {
                flash.message = "ResourceType ${params.id} updated"
                redirect(action:show,id:resourceTypeInstance.id)
            }
            else {
                render(view:'edit',model:[resourceTypeInstance:resourceTypeInstance])
            }
        }
        else {
            flash.message = "ResourceType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def resourceTypeInstance = new ResourceType()
        resourceTypeInstance.properties = params
        return ['resourceTypeInstance':resourceTypeInstance]
    }

    def save = {
        def resourceTypeInstance = new ResourceType(params)
        if(!resourceTypeInstance.hasErrors() && resourceTypeInstance.save()) {
            flash.message = "ResourceType ${resourceTypeInstance.id} created"
            redirect(action:show,id:resourceTypeInstance.id)
        }
        else {
            render(view:'create',model:[resourceTypeInstance:resourceTypeInstance])
        }
    }
}
