class Phone {

	String countryCode = "1"
	String phoneNumber
	String extension

	Date dateCreated
	Date lastUpdated = null

    // Essentially PrettyPhoneNumber
	String toString() {
	    String prettyPhoneNumber
	    if (phoneNumber.length() == 10) {
	        if (countryCode == "1") {
    	        prettyPhoneNumber = "(" + phoneNumber.substring(0,3) + ") "
	        } else {
	            prettyPhoneNumber = "" + phoneNumber.substring(0,3) + "-"
	        }

	        prettyPhoneNumber += phoneNumber.substring(3,6) + "-"
	        prettyPhoneNumber += phoneNumber.substring(6,10)
	    } else {
	        prettyPhoneNumber = phoneNumber
	    }
	    
	    if (countryCode != "1") {
    	    prettyPhoneNumber = "+011 (" + countryCode + ") " + prettyPhoneNumber
	    }
    
		if (extension != null && extension.length() > 0) {
		    if (countryCode == "1") {
    			return prettyPhoneNumber + " x" + extension		        
		    }

		} else {
			return prettyPhoneNumber
		}
	}

    static constraints = {
		countryCode(size:1..5)
		phoneNumber(size:3..10)
		extension(nullable:true, maxSize:16, blank:false)
    }
	static mapping = {
		table "dest_phone"
	}
}
