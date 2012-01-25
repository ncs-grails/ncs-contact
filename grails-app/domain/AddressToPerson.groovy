class AddressToPerson {

	Address deliveryAddress
	AddressType addressType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate
	DateRange dateRange

	Date dateCreated
	Date lastUpdated = null

    String toString() {
        return addressType.name + " : " + deliveryAddress.toString()
    }

	static belongsTo = [person : Person]
	static hasMany = [source : Source]
    static constraints = {
		deliveryAddress()
		addressType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
		dateRange(nullable: true)
    }
	static mapping = {
		table "rel_person_address"
	}

}
