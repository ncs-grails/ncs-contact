

class OrganizationalUnitController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ organizationalUnitInstanceList: OrganizationalUnit.list( params ), organizationalUnitInstanceTotal: OrganizationalUnit.count() ]
    }

    def show = {
        def organizationalUnitInstance = OrganizationalUnit.get( params.id )

        if(!organizationalUnitInstance) {
            flash.message = "OrganizationalUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ organizationalUnitInstance : organizationalUnitInstance ] }
    }

    def delete = {
        def organizationalUnitInstance = OrganizationalUnit.get( params.id )
        if(organizationalUnitInstance) {
            try {
                organizationalUnitInstance.delete()
                flash.message = "OrganizationalUnit ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "OrganizationalUnit ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "OrganizationalUnit not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def organizationalUnitInstance = OrganizationalUnit.get( params.id )

        if(!organizationalUnitInstance) {
            flash.message = "OrganizationalUnit not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ organizationalUnitInstance : organizationalUnitInstance ]
        }
    }

    def update = {
        def organizationalUnitInstance = OrganizationalUnit.get( params.id )
        if(organizationalUnitInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(organizationalUnitInstance.version > version) {
                    
                    organizationalUnitInstance.errors.rejectValue("version", "organizationalUnit.optimistic.locking.failure", "Another user has updated this OrganizationalUnit while you were editing.")
                    render(view:'edit',model:[organizationalUnitInstance:organizationalUnitInstance])
                    return
                }
            }
            organizationalUnitInstance.properties = params
            if(!organizationalUnitInstance.hasErrors() && organizationalUnitInstance.save()) {
                flash.message = "OrganizationalUnit ${params.id} updated"
                redirect(action:show,id:organizationalUnitInstance.id)
            }
            else {
                render(view:'edit',model:[organizationalUnitInstance:organizationalUnitInstance])
            }
        }
        else {
            flash.message = "OrganizationalUnit not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def organizationalUnitInstance = new OrganizationalUnit()
        organizationalUnitInstance.properties = params
        return ['organizationalUnitInstance':organizationalUnitInstance]
    }

    def save = {
        def organizationalUnitInstance = new OrganizationalUnit(params)
        if(!organizationalUnitInstance.hasErrors() && organizationalUnitInstance.save()) {
            flash.message = "OrganizationalUnit ${organizationalUnitInstance.id} created"
            redirect(action:show,id:organizationalUnitInstance.id)
        }
        else {
            render(view:'create',model:[organizationalUnitInstance:organizationalUnitInstance])
        }
    }
}
