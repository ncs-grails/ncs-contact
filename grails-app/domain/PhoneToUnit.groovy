class PhoneToUnit {

	Phone phoneNumber
	PhoneType phoneType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate
	DateRange dateRange

	Date dateCreated
	Date lastUpdated = null

	static belongsTo = [unit : OrganizationalUnit]
	static hasMany = [source : Source]
    static constraints = {
		phoneNumber()
		phoneType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
		dateRange(nullable: true)
    }
	static mapping = {
		table "rel_unit_phone"
	}

}
