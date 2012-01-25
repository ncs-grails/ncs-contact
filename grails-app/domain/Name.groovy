class Name {
	
	Title title
	String firstName
	String middleName
	String lastName
	String suffix
	NameType nameType

	Date dateCreated
	Date lastUpdated = null

    // Essentially the PrettyName function
	String toString() {
	    String retString = ""
	    if (title != null) {
	        retString += title.abbreviation + ". "
	    }
	    if (firstName != null) {
	        retString += firstName
	    }
	    if (middleName != null) {
	        if (firstName != null) {
	            if (firstName.length() == 1) {
	                retString += " " + middleName + "."
	            } else {
	                retString += " " + middleName.substring(0,1) + "."
	            }
	        }
	    }
	    if (lastName != null) {
	        retString += " " + lastName
	    }
	    if (suffix != null) {
	        retString += " " + suffix
	    }
	    
		return retString.trim().replace("  ", " ")
	}

	// Child of Person
	static belongsTo = [person: Person]
    static constraints = {
		title(nullable: true)
		firstName(maxSize: 30, nullable: true)
		middleName(maxSize: 20, nullable: true)
		lastName(maxSize: 30, nullable: true)
		suffix(maxSize: 10, nullable: true)
    }
	static mapping = {
		table "ent_name"
	}
}
