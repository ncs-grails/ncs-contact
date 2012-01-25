class PhoneToPerson {
	Phone phone
	PhoneType phoneType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate
	DateRange dateRange

	Date dateCreated
	Date lastUpdated = null
	
	String toString() {
	    return phoneType.name + " : " + phone.toString()
	}

	static belongsTo = [person : Person]
	static hasMany = [source : Source]
    static constraints = {
		phone()
		phoneType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
		dateRange(nullable: true)
    }
	static mapping = {
		table "rel_person_phone"
	}
}
