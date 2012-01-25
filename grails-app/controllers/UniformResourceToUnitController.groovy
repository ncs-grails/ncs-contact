

class UniformResourceToUnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ uniformResourceToUnitInstanceList: UniformResourceToUnit.list( params ), uniformResourceToUnitInstanceTotal: UniformResourceToUnit.count() ]
    }

    def show = {
        def uniformResourceToUnitInstance = UniformResourceToUnit.get( params.id )

        if(!uniformResourceToUnitInstance) {
            flash.message = "UniformResourceToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ uniformResourceToUnitInstance : uniformResourceToUnitInstance ] }
    }

    def delete = {
        def uniformResourceToUnitInstance = UniformResourceToUnit.get( params.id )
        if(uniformResourceToUnitInstance) {
            try {
                uniformResourceToUnitInstance.delete()
                flash.message = "UniformResourceToUnit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "UniformResourceToUnit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "UniformResourceToUnit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def uniformResourceToUnitInstance = UniformResourceToUnit.get( params.id )

        if(!uniformResourceToUnitInstance) {
            flash.message = "UniformResourceToUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ uniformResourceToUnitInstance : uniformResourceToUnitInstance ]
        }
    }

    def update = {
        def uniformResourceToUnitInstance = UniformResourceToUnit.get( params.id )
        if(uniformResourceToUnitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(uniformResourceToUnitInstance.version > version) {
                    
                    uniformResourceToUnitInstance.errors.rejectValue("version", "uniformResourceToUnit.optimistic.locking.failure", "Another user has updated this UniformResourceToUnit while you were editing.")
                    render(view:'edit',model:[uniformResourceToUnitInstance:uniformResourceToUnitInstance])
                    return
                }
            }
            uniformResourceToUnitInstance.properties = params
            if(!uniformResourceToUnitInstance.hasErrors() && uniformResourceToUnitInstance.save()) {
                flash.message = "UniformResourceToUnit ${params.id} updated"
                redirect(action:show,id:uniformResourceToUnitInstance.id)
            }
            else {
                render(view:'edit',model:[uniformResourceToUnitInstance:uniformResourceToUnitInstance])
            }
        }
        else {
            flash.message = "UniformResourceToUnit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def uniformResourceToUnitInstance = new UniformResourceToUnit()
        uniformResourceToUnitInstance.properties = params
        return ['uniformResourceToUnitInstance':uniformResourceToUnitInstance]
    }

    def save = {
        def uniformResourceToUnitInstance = new UniformResourceToUnit(params)
        if(!uniformResourceToUnitInstance.hasErrors() && uniformResourceToUnitInstance.save()) {
            flash.message = "UniformResourceToUnit ${uniformResourceToUnitInstance.id} created"
            redirect(action:show,id:uniformResourceToUnitInstance.id)
        }
        else {
            render(view:'create',model:[uniformResourceToUnitInstance:uniformResourceToUnitInstance])
        }
    }
}
