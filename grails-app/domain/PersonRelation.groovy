class PersonRelation {

	String name
    PersonRelation inverseRelation
    
	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}
    static constraints = {
		name(maxSize:50)
		inverseRelation(nullable: true)
    }
	static mapping = {
		table "def_person_relation"
	}

}
