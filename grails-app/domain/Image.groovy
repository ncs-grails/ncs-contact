class Image {
	byte[] content
	String contentType

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return contentType
	}

    static constraints = {
		contentType()
		content(maxSize: 65536 /* 64K */)
    }
	static mapping = {
		table "prop_image"
	}
}
