class DateRange {
	Integer startMonth
	Integer startDay
	Integer endMonth
	Integer endDay

	String toString() {
		return startMonth + "/" + startDay + " - " + endMonth + endDay
	}

    static constraints = {
		startMonth(min:1,max:12)
		startDay(min:1,max:31)
		endMonth(min:1,max:12)
		endDay(min:1,max:31)
    }
	static mapping = {
		table "prop_date_range"
	}
}
