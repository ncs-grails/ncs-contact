

class PersonController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ personInstanceList: Person.list( params ), personInstanceTotal: Person.count() ]
    }

    def show = {
        redirect(action:"person", controller:"navigate", params:params)
        
        /*
        def personInstance = Person.get( params.id )

        if(!personInstance) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ personInstance : personInstance ] }
        */
    }

    def delete = {
        def personInstance = Person.get( params.id )
        if(personInstance) {
            try {
                personInstance.delete()
                flash.message = "Person ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Person ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def personInstance = Person.get( params.id )

        if(!personInstance) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ personInstance : personInstance ]
        }
    }

    def update = {
        def personInstance = Person.get( params.id )
        if(personInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(personInstance.version > version) {
                    
                    personInstance.errors.rejectValue("version", "person.optimistic.locking.failure", "Another user has updated this Person while you were editing.")
                    render(view:'edit',model:[personInstance:personInstance])
                    return
                }
            }
            personInstance.properties = params
            if(!personInstance.hasErrors() && personInstance.save()) {
                flash.message = "Person ${params.id} updated"
                redirect(action:show,id:personInstance.id)
            }
            else {
                render(view:'edit',model:[personInstance:personInstance])
            }
        }
        else {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

	def select_image = {
		def personInstance = Person.get( params.id )
		if(!personInstance) {
            flash.message = "Person not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ personInstance : personInstance ] }
	}

	def upload_image = {

		def personInstance = Person.get( params.id )

		// Get the image file from the multi-part request
		def f = request.getFile('image')

		// List of OK mime-types
		def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		if (! okcontents.contains(f.getContentType())) {
			flash.message = "Image must be one of: ${okcontents}"
			render(view:'select_image', model:[personInstance:personInstance])
			return;

		}

		// Save the image and mime type
		Image image = new Image(contentType:f.getContentType(), content: f.getBytes())

		// Validation works, will check if the image is too big
		if (!image.save()) {
			render(view:'select_image', model:[personInstance:personInstance])
			return;

		} else {
			personInstance.image = image
			flash.message = "Image (${image.contentType}, ${image.content.size()} bytes) uploaded."
			redirect(action:'show', params:params)
		}
    
	}

    def create = {
        def personInstance = new Person(birthDate: null)
		def nameInstance = new Name()
		// Each person should have at least one name
        
        return ['personInstance':personInstance, 'nameInstance':nameInstance]
    }

    def save = {
        def personInstance = new Person(params)
		def nameInstance = new Name(params)
		
	    personInstance.addToNames(nameInstance)
	
        if(!personInstance.hasErrors() && !nameInstance.hasErrors() && personInstance.save() ) {
            flash.message = "Person ${personInstance.id} created"
            redirect(action:show,id:personInstance.id)
        }
        else {
            render(view:'create',model:[personInstance:personInstance])
        }
		
    }
}
