class SocialSecurityNumber {

	String ssn

	Date dateCreated
	Date lastUpdated = null

	String toString () {
		return ssn
	}

	static belongsTo = [person: Person]
    static constraints = {
		ssn(size:11..11)
    }
	static mapping = {
		table "prop_ssn"
	}

}
