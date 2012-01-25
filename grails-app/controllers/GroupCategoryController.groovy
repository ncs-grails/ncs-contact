

class GroupCategoryController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ groupCategoryInstanceList: GroupCategory.list( params ), groupCategoryInstanceTotal: GroupCategory.count() ]
    }

    def show = {
        def groupCategoryInstance = GroupCategory.get( params.id )

        if(!groupCategoryInstance) {
            flash.message = "GroupCategory not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ groupCategoryInstance : groupCategoryInstance ] }
    }

    def delete = {
        def groupCategoryInstance = GroupCategory.get( params.id )
        if(groupCategoryInstance) {
            try {
                groupCategoryInstance.delete()
                flash.message = "GroupCategory ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "GroupCategory ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "GroupCategory not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def groupCategoryInstance = GroupCategory.get( params.id )

        if(!groupCategoryInstance) {
            flash.message = "GroupCategory not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ groupCategoryInstance : groupCategoryInstance ]
        }
    }

    def update = {
        def groupCategoryInstance = GroupCategory.get( params.id )
        if(groupCategoryInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(groupCategoryInstance.version > version) {
                    
                    groupCategoryInstance.errors.rejectValue("version", "groupCategory.optimistic.locking.failure", "Another user has updated this GroupCategory while you were editing.")
                    render(view:'edit',model:[groupCategoryInstance:groupCategoryInstance])
                    return
                }
            }
            groupCategoryInstance.properties = params
            if(!groupCategoryInstance.hasErrors() && groupCategoryInstance.save()) {
                flash.message = "GroupCategory ${params.id} updated"
                redirect(action:show,id:groupCategoryInstance.id)
            }
            else {
                render(view:'edit',model:[groupCategoryInstance:groupCategoryInstance])
            }
        }
        else {
            flash.message = "GroupCategory not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def groupCategoryInstance = new GroupCategory()
        groupCategoryInstance.properties = params
        return ['groupCategoryInstance':groupCategoryInstance]
    }

    def save = {
        def groupCategoryInstance = new GroupCategory(params)
        if(!groupCategoryInstance.hasErrors() && groupCategoryInstance.save()) {
            flash.message = "GroupCategory ${groupCategoryInstance.id} created"
            redirect(action:show,id:groupCategoryInstance.id)
        }
        else {
            render(view:'create',model:[groupCategoryInstance:groupCategoryInstance])
        }
    }
}
