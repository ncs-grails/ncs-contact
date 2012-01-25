

class TitleController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ titleInstanceList: Title.list( params ), titleInstanceTotal: Title.count() ]
    }

    def show = {
        def titleInstance = Title.get( params.id )

        if(!titleInstance) {
            flash.message = "Title not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ titleInstance : titleInstance ] }
    }

    def delete = {
        def titleInstance = Title.get( params.id )
        if(titleInstance) {
            try {
                titleInstance.delete()
                flash.message = "Title ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Title ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Title not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def titleInstance = Title.get( params.id )

        if(!titleInstance) {
            flash.message = "Title not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ titleInstance : titleInstance ]
        }
    }

    def update = {
        def titleInstance = Title.get( params.id )
        if(titleInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(titleInstance.version > version) {
                    
                    titleInstance.errors.rejectValue("version", "title.optimistic.locking.failure", "Another user has updated this Title while you were editing.")
                    render(view:'edit',model:[titleInstance:titleInstance])
                    return
                }
            }
            titleInstance.properties = params
            if(!titleInstance.hasErrors() && titleInstance.save()) {
                flash.message = "Title ${params.id} updated"
                redirect(action:show,id:titleInstance.id)
            }
            else {
                render(view:'edit',model:[titleInstance:titleInstance])
            }
        }
        else {
            flash.message = "Title not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def titleInstance = new Title()
        titleInstance.properties = params
        return ['titleInstance':titleInstance]
    }

    def save = {
        def titleInstance = new Title(params)
        if(!titleInstance.hasErrors() && titleInstance.save()) {
            flash.message = "Title ${titleInstance.id} created"
            redirect(action:show,id:titleInstance.id)
        }
        else {
            render(view:'create',model:[titleInstance:titleInstance])
        }
    }
}
