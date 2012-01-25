class Address {

	String streetAddress
	String streetAddress2
	String urbanization
	String city
	State state
	String province
	Integer zipcode
	Integer zip4
	String postalCode
	String county
	Country country

	Date zp4Cleaned

	Date dateCreated
	Date lastUpdated = null

    // Basically PrettyAddress
	String toString() {
		if (streetAddress2 != null && city != null && state != null) {
			return streetAddress2 + ", " + city + ", " + state.abbreviation
		} else if (streetAddress != null && city != null && state != null) {
			return streetAddress + ", " + city + ", " + state.abbreviation
		} else if (city != null && state != null) {
			return city + ", " + state.abbreviation
		} else if (state != null) {
			return state
		} else {
			return id
		}
	}

	static constraints = {
		streetAddress(nullable: true, maxSize:40)
		streetAddress2(nullable: true, maxSize:40)
		urbanization(nullable: true, maxSize:40)
		city(nullable: true, maxSize:30)
		province(nullable: true, maxSize:30)
		state(nullable: true)
		zipcode(nullable: true, max:99999, min:0)
		zip4(nullable: true, max:9999, min:0)
		postalCode(nullable: true, maxSize:16)
		county(nullable: true, maxSize:30)
		zp4Cleaned(nullable:true)
	}
	static mapping = {
		table "dest_address"
	}
}
