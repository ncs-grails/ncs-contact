

class GenderController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ genderInstanceList: Gender.list( params ), genderInstanceTotal: Gender.count() ]
    }

    def show = {
        def genderInstance = Gender.get( params.id )

        if(!genderInstance) {
            flash.message = "Gender not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ genderInstance : genderInstance ] }
    }

    def delete = {
        def genderInstance = Gender.get( params.id )
        if(genderInstance) {
            try {
                genderInstance.delete()
                flash.message = "Gender ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Gender ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Gender not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def genderInstance = Gender.get( params.id )

        if(!genderInstance) {
            flash.message = "Gender not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ genderInstance : genderInstance ]
        }
    }

    def update = {
        def genderInstance = Gender.get( params.id )
        if(genderInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(genderInstance.version > version) {
                    
                    genderInstance.errors.rejectValue("version", "gender.optimistic.locking.failure", "Another user has updated this Gender while you were editing.")
                    render(view:'edit',model:[genderInstance:genderInstance])
                    return
                }
            }
            genderInstance.properties = params
            if(!genderInstance.hasErrors() && genderInstance.save()) {
                flash.message = "Gender ${params.id} updated"
                redirect(action:show,id:genderInstance.id)
            }
            else {
                render(view:'edit',model:[genderInstance:genderInstance])
            }
        }
        else {
            flash.message = "Gender not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def genderInstance = new Gender()
        genderInstance.properties = params
        return ['genderInstance':genderInstance]
    }

    def save = {
        def genderInstance = new Gender(params)
        if(!genderInstance.hasErrors() && genderInstance.save()) {
            flash.message = "Gender ${genderInstance.id} created"
            redirect(action:show,id:genderInstance.id)
        }
        else {
            render(view:'create',model:[genderInstance:genderInstance])
        }
    }
}
