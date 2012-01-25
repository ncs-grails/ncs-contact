class Ethnicity {
	String name;

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}
	
    static constraints = {
		name(maxSize:50)
    }
	static mapping = {
		table "def_ethnicity"
	}
}
