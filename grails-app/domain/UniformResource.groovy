class UniformResource {

	String url
	
	Date dateCreated
	Date lastUpdated = null

	String toString () {
		return url
	}

    static constraints = {
		url()
    }
	static mapping = {
		table "dest_uri"
	}
}
