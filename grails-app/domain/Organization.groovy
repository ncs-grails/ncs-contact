class Organization {

	String name
    String nickName


	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return name
	}

	static hasMany = [units : OrganizationalUnit]
    static constraints = {
		name(maxSize:128)
		nickName(maxSize:30, nullable:true)
    }
	static mapping = {
		table "ent_organization"
	}
}
