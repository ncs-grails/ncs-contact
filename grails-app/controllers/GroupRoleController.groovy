

class GroupRoleController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ groupRoleInstanceList: GroupRole.list( params ), groupRoleInstanceTotal: GroupRole.count() ]
    }

    def show = {
        def groupRoleInstance = GroupRole.get( params.id )

        if(!groupRoleInstance) {
            flash.message = "GroupRole not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ groupRoleInstance : groupRoleInstance ] }
    }

    def delete = {
        def groupRoleInstance = GroupRole.get( params.id )
        if(groupRoleInstance) {
            try {
                groupRoleInstance.delete()
                flash.message = "GroupRole ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "GroupRole ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "GroupRole not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def groupRoleInstance = GroupRole.get( params.id )

        if(!groupRoleInstance) {
            flash.message = "GroupRole not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ groupRoleInstance : groupRoleInstance ]
        }
    }

    def update = {
        def groupRoleInstance = GroupRole.get( params.id )
        if(groupRoleInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(groupRoleInstance.version > version) {
                    
                    groupRoleInstance.errors.rejectValue("version", "groupRole.optimistic.locking.failure", "Another user has updated this GroupRole while you were editing.")
                    render(view:'edit',model:[groupRoleInstance:groupRoleInstance])
                    return
                }
            }
            groupRoleInstance.properties = params
            if(!groupRoleInstance.hasErrors() && groupRoleInstance.save()) {
                flash.message = "GroupRole ${params.id} updated"
                redirect(action:show,id:groupRoleInstance.id)
            }
            else {
                render(view:'edit',model:[groupRoleInstance:groupRoleInstance])
            }
        }
        else {
            flash.message = "GroupRole not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def groupRoleInstance = new GroupRole()
        groupRoleInstance.properties = params
        return ['groupRoleInstance':groupRoleInstance]
    }

    def save = {
        def groupRoleInstance = new GroupRole(params)
        if(!groupRoleInstance.hasErrors() && groupRoleInstance.save()) {
            flash.message = "GroupRole ${groupRoleInstance.id} created"
            redirect(action:show,id:groupRoleInstance.id)
        }
        else {
            render(view:'create',model:[groupRoleInstance:groupRoleInstance])
        }
    }
}
