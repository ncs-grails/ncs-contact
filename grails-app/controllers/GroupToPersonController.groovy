

class GroupToPersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ groupToPersonInstanceList: GroupToPerson.list( params ), groupToPersonInstanceTotal: GroupToPerson.count() ]
    }

    def show = {
        def groupToPersonInstance = GroupToPerson.get( params.id )

        if(!groupToPersonInstance) {
            flash.message = "GroupToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ groupToPersonInstance : groupToPersonInstance ] }
    }

    def delete = {
        def groupToPersonInstance = GroupToPerson.get( params.id )
        if(groupToPersonInstance) {
            try {
                groupToPersonInstance.delete()
                flash.message = "GroupToPerson ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "GroupToPerson ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "GroupToPerson not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def groupToPersonInstance = GroupToPerson.get( params.id )

        if(!groupToPersonInstance) {
            flash.message = "GroupToPerson not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ groupToPersonInstance : groupToPersonInstance ]
        }
    }

    def update = {
        def groupToPersonInstance = GroupToPerson.get( params.id )
        if(groupToPersonInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(groupToPersonInstance.version > version) {
                    
                    groupToPersonInstance.errors.rejectValue("version", "groupToPerson.optimistic.locking.failure", "Another user has updated this GroupToPerson while you were editing.")
                    render(view:'edit',model:[groupToPersonInstance:groupToPersonInstance])
                    return
                }
            }
            groupToPersonInstance.properties = params
            if(!groupToPersonInstance.hasErrors() && groupToPersonInstance.save()) {
                flash.message = "GroupToPerson ${params.id} updated"
                redirect(action:show,id:groupToPersonInstance.id)
            }
            else {
                render(view:'edit',model:[groupToPersonInstance:groupToPersonInstance])
            }
        }
        else {
            flash.message = "GroupToPerson not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def groupToPersonInstance = new GroupToPerson()
        groupToPersonInstance.properties = params
        return ['groupToPersonInstance':groupToPersonInstance]
    }

    def save = {
        def groupToPersonInstance = new GroupToPerson(params)
        if(!groupToPersonInstance.hasErrors() && groupToPersonInstance.save()) {
            flash.message = "GroupToPerson ${groupToPersonInstance.id} created"
            redirect(action:show,id:groupToPersonInstance.id)
        }
        else {
            render(view:'create',model:[groupToPersonInstance:groupToPersonInstance])
        }
    }
}
