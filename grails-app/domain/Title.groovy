class Title {
	String name
	String abbreviation

    boolean social
    boolean civil
    boolean military
    boolean religious

	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return abbreviation
	}
    static constraints = {
		abbreviation(maxSize:10)
		name(maxSize:30)
        social()
        civil()
        military()
        religious()
    }
	static mapping = {
		table "def_title"
	}
}
