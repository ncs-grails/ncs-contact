class GroupCategory {

	String name

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

	static hasMany = [ groups: Group ]

    static constraints = {
		name(maxSize:50)
    }
	static mapping = {
		table "def_group_category"
	}
}
