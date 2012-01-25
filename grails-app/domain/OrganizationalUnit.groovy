class OrganizationalUnit {
	String name
    String nickName
    // flag that this is an umbrella unit for the entire organization
    Boolean umbrella = false
    
	Date dateCreated
	Date lastUpdated = null

	String toString() {
		return organization.name + ", " + name
	}

	static belongsTo = [organization: Organization]
	static hasMany = [
		addresses : AddressToUnit,
		people : UnitToPerson,
		relatedUnits : UnitToUnit,
		phones : PhoneToUnit,
		uris : UniformResourceToUnit]
    static constraints = {
		name(maxSize: 96)
		nickName(maxSize: 36, nullable:true)
		relatedUnits(nullable: true)
		addresses(nullable: true)
		phones(nullable: true)
		uris(nullable: true)
    }
	static mapping = {
		table "ent_organizational_unit"
	}
}
