

class UniformResourceController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ uniformResourceInstanceList: UniformResource.list( params ), uniformResourceInstanceTotal: UniformResource.count() ]
    }

    def show = {
        def uniformResourceInstance = UniformResource.get( params.id )

        if(!uniformResourceInstance) {
            flash.message = "UniformResource not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ uniformResourceInstance : uniformResourceInstance ] }
    }

    def delete = {
        def uniformResourceInstance = UniformResource.get( params.id )
        if(uniformResourceInstance) {
            try {
                uniformResourceInstance.delete()
                flash.message = "UniformResource ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UniformResource ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UniformResource not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def uniformResourceInstance = UniformResource.get( params.id )

        if(!uniformResourceInstance) {
            flash.message = "UniformResource not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ uniformResourceInstance : uniformResourceInstance ]
        }
    }

    def update = {
        def uniformResourceInstance = UniformResource.get( params.id )
        if(uniformResourceInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(uniformResourceInstance.version > version) {
                    
                    uniformResourceInstance.errors.rejectValue("version", "uniformResource.optimistic.locking.failure", "Another user has updated this UniformResource while you were editing.")
                    render(view:'edit',model:[uniformResourceInstance:uniformResourceInstance])
                    return
                }
            }
            uniformResourceInstance.properties = params
            if(!uniformResourceInstance.hasErrors() && uniformResourceInstance.save()) {
                flash.message = "UniformResource ${params.id} updated"
                redirect(action:show,id:uniformResourceInstance.id)
            }
            else {
                render(view:'edit',model:[uniformResourceInstance:uniformResourceInstance])
            }
        }
        else {
            flash.message = "UniformResource not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def uniformResourceInstance = new UniformResource()
        uniformResourceInstance.properties = params
        return ['uniformResourceInstance':uniformResourceInstance]
    }

    def save = {
        def uniformResourceInstance = new UniformResource(params)
        if(!uniformResourceInstance.hasErrors() && uniformResourceInstance.save()) {
            flash.message = "UniformResource ${uniformResourceInstance.id} created"
            redirect(action:show,id:uniformResourceInstance.id)
        }
        else {
            render(view:'create',model:[uniformResourceInstance:uniformResourceInstance])
        }
    }
}
