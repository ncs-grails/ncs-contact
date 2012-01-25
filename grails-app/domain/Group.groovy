class Group {
	/* This is a Group, but group is a reserved word, so... */

	String name
	String nickName
	GroupCategory category

	Date dateCreated
	Date lastUpdated = null

	String toString () {
		if (nickName != null) {
			return nickName
		} else {
			return name
		}
	}

    static hasMany = [ members : GroupToPerson ]
    static constraints = {
		name(maxSize:50)
		nickName(maxSize:50, nullable: true)
		category()
    }
	static mapping = {
		table "ent_group"
	}
}
