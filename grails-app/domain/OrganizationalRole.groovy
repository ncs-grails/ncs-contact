class OrganizationalRole {

    String name

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

    static constraints = {
		name(maxSize:64)
    }
	static mapping = {
		table "def_unit_role"
	}
}
