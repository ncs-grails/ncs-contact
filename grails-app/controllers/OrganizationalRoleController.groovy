

class OrganizationalRoleController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ organizationalRoleInstanceList: OrganizationalRole.list( params ), organizationalRoleInstanceTotal: OrganizationalRole.count() ]
    }

    def show = {
        def organizationalRoleInstance = OrganizationalRole.get( params.id )

        if(!organizationalRoleInstance) {
            flash.message = "OrganizationalRole not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ organizationalRoleInstance : organizationalRoleInstance ] }
    }

    def delete = {
        def organizationalRoleInstance = OrganizationalRole.get( params.id )
        if(organizationalRoleInstance) {
            try {
                organizationalRoleInstance.delete()
                flash.message = "OrganizationalRole ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "OrganizationalRole ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "OrganizationalRole not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def organizationalRoleInstance = OrganizationalRole.get( params.id )

        if(!organizationalRoleInstance) {
            flash.message = "OrganizationalRole not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ organizationalRoleInstance : organizationalRoleInstance ]
        }
    }

    def update = {
        def organizationalRoleInstance = OrganizationalRole.get( params.id )
        if(organizationalRoleInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(organizationalRoleInstance.version > version) {
                    
                    organizationalRoleInstance.errors.rejectValue("version", "organizationalRole.optimistic.locking.failure", "Another user has updated this OrganizationalRole while you were editing.")
                    render(view:'edit',model:[organizationalRoleInstance:organizationalRoleInstance])
                    return
                }
            }
            organizationalRoleInstance.properties = params
            if(!organizationalRoleInstance.hasErrors() && organizationalRoleInstance.save()) {
                flash.message = "OrganizationalRole ${params.id} updated"
                redirect(action:show,id:organizationalRoleInstance.id)
            }
            else {
                render(view:'edit',model:[organizationalRoleInstance:organizationalRoleInstance])
            }
        }
        else {
            flash.message = "OrganizationalRole not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def organizationalRoleInstance = new OrganizationalRole()
        organizationalRoleInstance.properties = params
        return ['organizationalRoleInstance':organizationalRoleInstance]
    }

    def save = {
        def organizationalRoleInstance = new OrganizationalRole(params)
        if(!organizationalRoleInstance.hasErrors() && organizationalRoleInstance.save()) {
            flash.message = "OrganizationalRole ${organizationalRoleInstance.id} created"
            redirect(action:show,id:organizationalRoleInstance.id)
        }
        else {
            render(view:'create',model:[organizationalRoleInstance:organizationalRoleInstance])
        }
    }
}
