class UniformResourceToPerson {
	UniformResource uri
	ResourceType uriType
	int preferredOrder = 0
	Date startDate = new Date()
	Date endDate

	Date dateCreated
	Date lastUpdated = null

    String toString() {
        if (uri.url.startsWith("mailto:")) {
            return uriType.name + " : " + uri.url.replace("mailto:", "")
        } else {
            return uriType.name + " : " + uri.url
        }
    }
    String toHTML() {
        if (uri.url.startsWith("mailto:")) {
            return  "<a href=" + uri + " title=" + uriType.name + ">" + uri.url.replace("mailto:", "") + "</a>"
        } else {
            return  "<a href=" + uri + " title=" + uriType.name + ">" + uri.url + "</a>"
        }
    }

	static belongsTo = [person : Person]
	static hasMany = [source : Source]
    static constraints = {
		uri()
		uriType()
		preferredOrder(min:0)
		startDate(nullable: true)
		endDate(nullable: true)
    }
	static mapping = {
		table "rel_person_uri"
	}
    
}
