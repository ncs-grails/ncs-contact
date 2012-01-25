class NameType {
	String name

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

    static constraints = {
		name(maxSize:30)
    }
	static mapping = {
		table "def_name_type"
	}
}
