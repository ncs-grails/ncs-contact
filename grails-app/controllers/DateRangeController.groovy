

class DateRangeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ dateRangeInstanceList: DateRange.list( params ), dateRangeInstanceTotal: DateRange.count() ]
    }

    def show = {
        def dateRangeInstance = DateRange.get( params.id )

        if(!dateRangeInstance) {
            flash.message = "DateRange not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ dateRangeInstance : dateRangeInstance ] }
    }

    def delete = {
        def dateRangeInstance = DateRange.get( params.id )
        if(dateRangeInstance) {
            try {
                dateRangeInstance.delete()
                flash.message = "DateRange ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "DateRange ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "DateRange not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def dateRangeInstance = DateRange.get( params.id )

        if(!dateRangeInstance) {
            flash.message = "DateRange not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ dateRangeInstance : dateRangeInstance ]
        }
    }

    def update = {
        def dateRangeInstance = DateRange.get( params.id )
        if(dateRangeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(dateRangeInstance.version > version) {
                    
                    dateRangeInstance.errors.rejectValue("version", "dateRange.optimistic.locking.failure", "Another user has updated this DateRange while you were editing.")
                    render(view:'edit',model:[dateRangeInstance:dateRangeInstance])
                    return
                }
            }
            dateRangeInstance.properties = params
            if(!dateRangeInstance.hasErrors() && dateRangeInstance.save()) {
                flash.message = "DateRange ${params.id} updated"
                redirect(action:show,id:dateRangeInstance.id)
            }
            else {
                render(view:'edit',model:[dateRangeInstance:dateRangeInstance])
            }
        }
        else {
            flash.message = "DateRange not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def dateRangeInstance = new DateRange()
        dateRangeInstance.properties = params
        return ['dateRangeInstance':dateRangeInstance]
    }

    def save = {
        def dateRangeInstance = new DateRange(params)
        if(!dateRangeInstance.hasErrors() && dateRangeInstance.save()) {
            flash.message = "DateRange ${dateRangeInstance.id} created"
            redirect(action:show,id:dateRangeInstance.id)
        }
        else {
            render(view:'create',model:[dateRangeInstance:dateRangeInstance])
        }
    }
}
