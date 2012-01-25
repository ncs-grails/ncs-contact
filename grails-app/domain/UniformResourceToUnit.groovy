class UniformResourceToUnit {
	UniformResource uri
	ResourceType uriType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

	static belongsTo = [unit : OrganizationalUnit]
	static hasMany = [source : Source]
    static constraints = {
		uri()
		uriType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_unit_uri"
	}
}
