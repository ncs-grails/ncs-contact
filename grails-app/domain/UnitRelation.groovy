class UnitRelation {

    String name
    UnitRelation inverseRelation

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}
    static constraints = {
		name(maxSize:64)
		inverseRelation(nullable:true)
    }
	static mapping = {
		table "def_unit_relation"
	}
}
