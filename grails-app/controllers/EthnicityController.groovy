

class EthnicityController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ ethnicityInstanceList: Ethnicity.list( params ), ethnicityInstanceTotal: Ethnicity.count() ]
    }

    def show = {
        def ethnicityInstance = Ethnicity.get( params.id )

        if(!ethnicityInstance) {
            flash.message = "Ethnicity not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ ethnicityInstance : ethnicityInstance ] }
    }

    def delete = {
        def ethnicityInstance = Ethnicity.get( params.id )
        if(ethnicityInstance) {
            try {
                ethnicityInstance.delete()
                flash.message = "Ethnicity ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Ethnicity ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Ethnicity not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def ethnicityInstance = Ethnicity.get( params.id )

        if(!ethnicityInstance) {
            flash.message = "Ethnicity not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ ethnicityInstance : ethnicityInstance ]
        }
    }

    def update = {
        def ethnicityInstance = Ethnicity.get( params.id )
        if(ethnicityInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(ethnicityInstance.version > version) {
                    
                    ethnicityInstance.errors.rejectValue("version", "ethnicity.optimistic.locking.failure", "Another user has updated this Ethnicity while you were editing.")
                    render(view:'edit',model:[ethnicityInstance:ethnicityInstance])
                    return
                }
            }
            ethnicityInstance.properties = params
            if(!ethnicityInstance.hasErrors() && ethnicityInstance.save()) {
                flash.message = "Ethnicity ${params.id} updated"
                redirect(action:show,id:ethnicityInstance.id)
            }
            else {
                render(view:'edit',model:[ethnicityInstance:ethnicityInstance])
            }
        }
        else {
            flash.message = "Ethnicity not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def ethnicityInstance = new Ethnicity()
        ethnicityInstance.properties = params
        return ['ethnicityInstance':ethnicityInstance]
    }

    def save = {
        def ethnicityInstance = new Ethnicity(params)
        if(!ethnicityInstance.hasErrors() && ethnicityInstance.save()) {
            flash.message = "Ethnicity ${ethnicityInstance.id} created"
            redirect(action:show,id:ethnicityInstance.id)
        }
        else {
            render(view:'create',model:[ethnicityInstance:ethnicityInstance])
        }
    }
}
