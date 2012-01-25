class State {

	String name
	String abbreviation

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}
    static constraints = {
		name(maxSize:30)
		abbreviation(size:2..2)
    }
	static mapping = {
		table "def_state"
	}
}
