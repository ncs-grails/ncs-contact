class UserToSource {
	Source source
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

	static belongsTo = [user : User]
	static hasMany = [source : Source]
    static constraints = {
		source()
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_user_source"
	}
}
