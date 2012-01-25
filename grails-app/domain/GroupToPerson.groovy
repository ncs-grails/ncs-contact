class GroupToPerson {

	GroupRole role
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

    String toString() {
        return role.name + " of " + group.toString()
    }

    String memberDesc() {
        return person.getPreferredName().toString() + ", " + role.name
    }

	static belongsTo = [person : Person, group: Group]
	static hasMany = [source : Source]
    static constraints = {
		group()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_person_group"
	}
}
