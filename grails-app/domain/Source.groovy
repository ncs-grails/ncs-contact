class Source {
	
	String name

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

    static constraints = {
		name(nullable:false, blank:false)
    }
	static mapping = {
		table "prop_source"
	}
}
