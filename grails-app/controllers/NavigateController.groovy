class NavigateController {

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [search:['POST','GET'], index:['POST','GET']]

    def index = {
        // This will list all groups, and Organizations
        
        [ groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
            organizationInstanceList: Organization.list().sort{it.name} ,
            noneSelected: true]
    }

    def mobile = {
        // This will list all groups, and Organizations
        
        [ groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
            organizationInstanceList: Organization.list() ,
            noneSelected: true]
    }

    def search = {
        
        if (params.q) {
            // This lets us search names
            def personInstanceList = Name.findAllByFirstNameLikeOrLastNameLike("%${params.q}%","%${params.q}%").collect{ it.person }

            // This lets us search email addresses
            def uniformResourceList = UniformResource.findAllByUrlLike("%${params.q}%")
                .collect{ UniformResourceToPerson.findAllByUri(it) }
                .flatten().collect{ it.person }.unique()
            
            personInstanceList = personInstanceList.plus(uniformResourceList).unique()
            

            if(!personInstanceList) {
                flash.message = "No matches found not found for '${params.q}'"
                redirect(action:index, params:params)
            }
            else {
                render(view:'index',model:[ 
                    groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
                    organizationInstanceList: Organization.list(),
                    personInstanceList : personInstanceList ])
            }
        } else {
            redirect(action:index)
        }
    }
    
    def group = {

        def groupInstance = Group.get( params.id )

        if(!groupInstance) {
            flash.message = "Group not found with id ${params.id}"
            redirect(action:index)
        }
        else {
            render(view:'index',model:[ groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
                organizationInstanceList: Organization.list(),
                groupInstance : groupInstance ])        
        }
    }
    
    def org = {
        def organizationInstance = Organization.get( params.id )

        if(!organizationInstance) {
            flash.message = "Organization not found with id ${params.id}"
            redirect(action:index)
        }
        else {
            render(view:'index',model:[ 
                groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
                organizationInstanceList: Organization.list(),
                organizationInstance : organizationInstance ])        
        }
    }

    def unit = {
        def unitInstance = OrganizationalUnit.get( params.id )

        if(!unitInstance) {
            flash.message = "Organizational Unit not found with id ${params.id}"
            redirect(action:index)
        }
        else {
            render(view:'index',model:[ 
                groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
                organizationInstanceList: Organization.list(),
                unitInstance : unitInstance ])        
        }
    }

    def person = {

        def personInstance = Person.get( params.id )

        if(!personInstance) {
            flash.message = "Person not found (id ${params.id})"
            redirect(action:index)
        }
        else {
            render(view:'index',model:[ groupCategoryInstanceList: GroupCategory.list().sort{it.name}, 
                organizationInstanceList: Organization.list(),
                personInstance : personInstance ])        
        }
    }
}
