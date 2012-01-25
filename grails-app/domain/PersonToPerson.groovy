class PersonToPerson {

    Person relatedPerson
	PersonRelation relationship
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

    String toString() {
        return relationship.toString() + " : " + relatedPerson.getPreferredName()
    }
	static belongsTo = [person : Person]
	static hasMany = [source : Source]
    static constraints = {
		relatedPerson()
		relationship()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_person_person"
	}
}
