class AddressToUnit {

	Address deliveryAddress
	AddressType addressType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

	static belongsTo = [unit : OrganizationalUnit]
	static hasMany = [source : Source]
    static constraints = {
		deliveryAddress()
		addressType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_unit_address"
	}
}
