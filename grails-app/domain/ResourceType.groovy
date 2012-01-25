class ResourceType {
	String name
    String prefix
    
	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

    static constraints = {
		name()
		prefix(nullable: true)
    }
	static mapping = {
		table "def_uri_type"
	}
}
