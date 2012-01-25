class PhoneType {
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
		table "def_phone_type"
	}
}
