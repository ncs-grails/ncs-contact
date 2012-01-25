class Credential {

	String name
	String abbreviation
	
	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return abbreviation
	}

    static constraints = {
		abbreviation(maxSize:8)
    }
	static mapping = {
		table "def_credential"
	}
}
