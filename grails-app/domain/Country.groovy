class Country {
	String name
	String abbreviation
	
	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

    static constraints = {
		name(maxSize:30)
		abbreviation(maxSize:2)
    }
	static mapping = {
		table "def_country"
	}
}
