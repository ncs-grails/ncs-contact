class AddressService {

    static scope = "singleton"
    boolean transactional = false

	//public static Zp4Address standardize(Address a) {
	def standardize(Address a) {

		def z = new ZP4Address(certified:"F")
		if (a.country.abbreviation == "US") {
			def base = "http://zp4.cccs.umn.edu/?"
			def params = ["address":a.streetAddress, "address2":a.streetAddress2, "urb": a.urbanization, "city": a.city, "state": a.state.abbreviation , "zip": a.zipcode ]

			def queryList = []
			params.each() { key, value ->
				if (value) {
					queryList.add(key + "=" + URLEncoder.encode(value))
				}
			}

			def queryString = queryList.join("&")

			def url = new URL(base)
			def connection = url.openConnection()
			connection.setRequestMethod("POST")
			connection.doOutput = true

			def writer = new OutputStreamWriter(connection.outputStream)
			writer.write(queryString)
			writer.flush()
			writer.close()
			connection.connect()

			if (connection.responseCode == 200) {

				def xml = connection.content.text
				def zp4 = new XmlSlurper().parseText(xml)

				z.certified = zp4.Certified as String
				z.addressFinal = zp4.Address.AddressFinal as String
				z.addressLine2Final = zp4.Address.AddressLine2Final as String
				z.addressLeftovers = zp4.Address.AddressLeftovers as String
				z.cityFinal = zp4.City.CityFinal as String
				z.cityPreferred = zp4.City.CityPreferred as String
				z.urbanizationFinal = zp4.UrbanizationFinal as String
				z.stateFinal = zp4.StateFinal as String
				z.zipFinal = zp4.ZIP.ZIPFinal as String
				z.errorsBinary = zp4.Error.ErrorsBinary as String
				z.errorNumbersDetailed = zp4.Error.ErrorNumbersDetailed as String
				z.errorMessage = zp4.Error.ErrorMessage as String

			} else {
				log.error("GeocoderService.geocodeAirport FAILED")
				log.error(url)
				log.error(connection.responseCode)
				log.error(connection.responseMessage)
			}
		}
		
		def fatalErrors = ['1.1','2.1','3.1','4.1','6.1','6.2','7.1','7.2','7.3']
		
		def errorNumbers = errorNumbersDetailed.split(',')
		// If the error Numbers doesn't contain any fatal errors...
		if (errorNumbers.disjoint(fatalErrors)) {
			// Update Address
			a.streetAddress = addressFinal
			a.streetAddress2 = addressLine2Final
			a.city = cityFinal
			a.state = state
			a.zipcode = zipcode
			a.zip4 = zip4
			a.country = country
			a.zp4Cleaned = true
			
		} else {
			a.zp4Cleaned = false
		}
		
		//return z
	}
}
