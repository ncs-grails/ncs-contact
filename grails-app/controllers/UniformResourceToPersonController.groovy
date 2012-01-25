

class UniformResourceToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ uniformResourceToPersonInstanceList: UniformResourceToPerson.list( params ), uniformResourceToPersonInstanceTotal: UniformResourceToPerson.count() ]
    }

    def show = {
        def uniformResourceToPersonInstance = UniformResourceToPerson.get( params.id )

        if(!uniformResourceToPersonInstance) {
            flash.message = "UniformResourceToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ uniformResourceToPersonInstance : uniformResourceToPersonInstance ] }
    }

    def delete = {
        def uniformResourceToPersonInstance = UniformResourceToPerson.get( params.id )
        if(uniformResourceToPersonInstance) {
            try {
                uniformResourceToPersonInstance.delete()
                flash.message = "UniformResourceToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UniformResourceToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UniformResourceToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def uniformResourceToPersonInstance = UniformResourceToPerson.get( params.id )

        if(!uniformResourceToPersonInstance) {
            flash.message = "UniformResourceToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ uniformResourceToPersonInstance : uniformResourceToPersonInstance ]
        }
    }

    def update = {
        def uniformResourceToPersonInstance = UniformResourceToPerson.get( params.id )
        if(uniformResourceToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(uniformResourceToPersonInstance.version > version) {
                    
                    uniformResourceToPersonInstance.errors.rejectValue("version", "uniformResourceToPerson.optimistic.locking.failure", "Another user has updated this UniformResourceToPerson while you were editing.")
                    render(view:'edit',model:[uniformResourceToPersonInstance:uniformResourceToPersonInstance])
                    return
                }
            }
            uniformResourceToPersonInstance.properties = params
            if(!uniformResourceToPersonInstance.hasErrors() && uniformResourceToPersonInstance.save()) {
                flash.message = "UniformResourceToPerson ${params.id} updated"
                redirect(action:show,id:uniformResourceToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[uniformResourceToPersonInstance:uniformResourceToPersonInstance])
            }
        }
        else {
            flash.message = "UniformResourceToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def uniformResourceInstance = new UniformResource(params["uri"])
        def uniformResourceToPersonInstance = new UniformResourceToPerson(params)
        uniformResourceToPersonInstance.uri = uniformResourceInstance
        return ['uniformResourceToPersonInstance':uniformResourceToPersonInstance]
    }

    def save = {
        def uniformResourceInstance = new UniformResource(params["uri"])
        def uniformResourceToPersonInstance = new UniformResourceToPerson(params)
        uniformResourceToPersonInstance.uri = uniformResourceInstance
        
        if (!uniformResourceToPersonInstance.hasErrors() && !uniformResourceInstance.hasErrors() && uniformResourceInstance.save()) {
             uniformResourceToPersonInstance.uri = uniformResourceInstance
        
            if(uniformResourceToPersonInstance.save()) {
                flash.message = "UniformResourceToPerson ${uniformResourceToPersonInstance.id} created"
                redirect(action:show,id:uniformResourceToPersonInstance.id)
            } else {
                render(view:'create',model:[uniformResourceToPersonInstance:uniformResourceToPersonInstance])
            }
        } else {
            render(view:'create',model:[uniformResourceToPersonInstance:uniformResourceToPersonInstance])
        }
   }
}
