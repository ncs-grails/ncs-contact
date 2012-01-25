class Gender {
	String name

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}
	
    static constraints = {
		name(maxSize:6)
    }
	static mapping = {
		table "def_gender"
	}
}
