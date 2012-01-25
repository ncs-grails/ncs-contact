class Person {

	Gender gender = null
	Date birthDate = null
	Date deathDate = null
	Image image = null
	SocialSecurityNumber ssn
	
	Date dateCreated
	Date lastUpdated = null

	void setPreferredName(Name name) {
		// do nothing
	}

    int age() {
        Calendar today = Calendar.getInstance()
        Calendar reference = Calendar.getInstance()
        reference.setTime(birthDate)
        int age = today.get(Calendar.YEAR) - reference.get(Calendar.YEAR)
        reference.add(Calendar.YEAR, age);
        if (today.before(reference)) { age-- }
        return age;
    }

    Name getPreferredName() {
        def prefNames = Name.findAll("FROM Name AS n WHERE n.person.id = :personID AND n.nameType.name = :nameType", [personID: id, nameType: "Preferred"])
        if (prefNames != null) {
            return prefNames[0]
        } else {
            return null
        }
        
    }

	String toString() {
	    def preferredName = getPreferredName().toString()
	    if (preferredName != null) {
	        return "Person : " + id + ", " + preferredName
	    } else {
	        return "Person : " + id
	    }
	    
	}
	
	static hasMany = [ 
		names: Name,
		ethnicities : Ethnicity,
		credentials : Credential,
		addresses : AddressToPerson,
		groups : GroupToPerson,
		units : UnitToPerson,
		relatedPersons : PersonToPerson,
		phones : PhoneToPerson,
		uris : UniformResourceToPerson]
    static constraints = {
		names()
		preferredName(nullable: true)
		gender(nullable: true)
		ethnicities(nullable: true)
		credentials(nullable: true)
		birthDate(nullable: true)
		deathDate(nullable: true)
		addresses(nullable: true)
		phones(nullable: true)
		uris(nullable: true)
		groups(nullable: true)
		relatedPersons(nullable: true)
		image(nullable: true)
		ssn(nullable: true)
    }
	static mapping = {
		table "ent_person"
	}
}
