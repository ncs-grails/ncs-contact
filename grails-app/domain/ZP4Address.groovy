class ZP4Address {

	String certified
	String addressFinal
	String addressLine2Final
	String addressLeftovers
	String cityFinal
	String cityPreferred
	String urbanizationFinal
	String stateFinal
	String zipFinal
	String errorsBinary
	String errorNumbersDetailed
	String errorMessage

	String toString() {
		if (addressFinal != null && cityFinal != null && stateFinal != null) {
			return addressFinal + ", " + cityFinal + ", " + stateFinal
		} else if (cityFinal != null && state != null) {
			return cityFinal + ", " + stateFinal
		} else if (stateFinal != null) {
			return stateFinal
		} else {
			return certified
		}
	}


    static constraints = {
		certified()
		addressFinal()
		addressLine2Final()
		addressLeftovers()
		cityFinal()
		cityPreferred()
		urbanizationFinal()
		stateFinal()
		zipFinal()
		errorsBinary()
		errorNumbersDetailed()
		errorMessage()
    }
}
