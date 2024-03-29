class BootStrap {

     def init = { servletContext ->

      /*

		// Name Types
		def preferred = new NameType(name:"Preferred").save()
		def official = new NameType(name:"Official").save()
		
		// Genders
		def male = new Gender(name: "Male").save()
		def female = new Gender(name: "Female").save()

        // Address Types
		AddressType homeAddress = new AddressType(name: "Home Address").save()
		AddressType workAddress = new AddressType(name: "Work Address").save()
		
		// Countries
		new Country(abbreviation:"AC", name: "Ascension Island").save()
        new Country(abbreviation:"AD", name: "Andorra").save()
        new Country(abbreviation:"AE", name: "United Arab Emirates").save()
        new Country(abbreviation:"AF", name: "Afghanistan").save()
        new Country(abbreviation:"AG", name: "Antigua and Barbuda").save()
        new Country(abbreviation:"AI", name: "Anguilla").save()
        new Country(abbreviation:"AL", name: "Albania").save()
        new Country(abbreviation:"AM", name: "Armenia").save()
        new Country(abbreviation:"AN", name: "Netherlands Antilles").save()
        new Country(abbreviation:"AO", name: "Angola").save()
        new Country(abbreviation:"AQ", name: "Antarctica").save()
        new Country(abbreviation:"AR", name: "Argentina").save()
        new Country(abbreviation:"AS", name: "American Samoa").save()
        new Country(abbreviation:"AT", name: "Austria").save()
        new Country(abbreviation:"AU", name: "Australia").save()
        new Country(abbreviation:"AW", name: "Aruba").save()
        new Country(abbreviation:"AZ", name: "Azerbaijan").save()
        new Country(abbreviation:"BA", name: "Bosnia and Herzegovina").save()
        new Country(abbreviation:"BB", name: "Barbados").save()
        new Country(abbreviation:"BD", name: "Bangladesh").save()
        new Country(abbreviation:"BE", name: "Belgium").save()
        new Country(abbreviation:"BF", name: "Burkina Faso").save()
        new Country(abbreviation:"BG", name: "Bulgaria").save()
        new Country(abbreviation:"BH", name: "Bahrain").save()
        new Country(abbreviation:"BI", name: "Burundi").save()
        new Country(abbreviation:"BJ", name: "Benin").save()
        new Country(abbreviation:"BM", name: "Bermuda").save()
        new Country(abbreviation:"BN", name: "Brunei Darussalam").save()
        new Country(abbreviation:"BO", name: "Bolivia").save()
        new Country(abbreviation:"BR", name: "Brazil").save()
        new Country(abbreviation:"BS", name: "Bahamas").save()
        new Country(abbreviation:"BT", name: "Bhutan").save()
        new Country(abbreviation:"BV", name: "Bouvet Island").save()
        new Country(abbreviation:"BW", name: "Botswana").save()
        new Country(abbreviation:"BY", name: "Belarus").save()
        new Country(abbreviation:"BZ", name: "Belize").save()
        new Country(abbreviation:"CA", name: "Canada").save()
        new Country(abbreviation:"CC", name: "Cocos (Keeling) Islands").save()
        new Country(abbreviation:"CD", name: "Congo, Democratic Republic of the").save()
        new Country(abbreviation:"CF", name: "Central African Republic").save()
        new Country(abbreviation:"CG", name: "Congo, Republic of").save()
        new Country(abbreviation:"CH", name: "Switzerland").save()
        new Country(abbreviation:"CI", name: "Cote d'Ivoire").save()
        new Country(abbreviation:"CK", name: "Cook Islands").save()
        new Country(abbreviation:"CL", name: "Chile").save()
        new Country(abbreviation:"CM", name: "Cameroon").save()
        new Country(abbreviation:"CN", name: "China").save()
        new Country(abbreviation:"CO", name: "Colombia").save()
        new Country(abbreviation:"CR", name: "Costa Rica").save()
        new Country(abbreviation:"CU", name: "Cuba").save()
        new Country(abbreviation:"CV", name: "Cap Verde").save()
        new Country(abbreviation:"CX", name: "Christmas Island").save()
        new Country(abbreviation:"CY", name: "Cyprus").save()
        new Country(abbreviation:"CZ", name: "Czech Republic").save()
        new Country(abbreviation:"DE", name: "Germany").save()
        new Country(abbreviation:"DJ", name: "Djibouti").save()
        new Country(abbreviation:"DK", name: "Denmark").save()
        new Country(abbreviation:"DM", name: "Dominica").save()
        new Country(abbreviation:"DO", name: "Dominican Republic").save()
        new Country(abbreviation:"DZ", name: "Algeria").save()
        new Country(abbreviation:"EC", name: "Ecuador").save()
        new Country(abbreviation:"EE", name: "Estonia").save()
        new Country(abbreviation:"EG", name: "Egypt").save()
        new Country(abbreviation:"EH", name: "Western Sahara").save()
        new Country(abbreviation:"ER", name: "Eritrea").save()
        new Country(abbreviation:"ES", name: "Spain").save()
        new Country(abbreviation:"ET", name: "Ethiopia").save()
        new Country(abbreviation:"FI", name: "Finland").save()
        new Country(abbreviation:"FJ", name: "Fiji").save()
        new Country(abbreviation:"FK", name: "Falkland Islands (Malvina)").save()
        new Country(abbreviation:"FM", name: "Micronesia, Federal State of").save()
        new Country(abbreviation:"FO", name: "Faroe Islands").save()
        new Country(abbreviation:"FR", name: "France").save()
        new Country(abbreviation:"GA", name: "Gabon").save()
        new Country(abbreviation:"GD", name: "Grenada").save()
        new Country(abbreviation:"GE", name: "Georgia").save()
        new Country(abbreviation:"GF", name: "French Guiana").save()
        new Country(abbreviation:"GG", name: "Guernsey").save()
        new Country(abbreviation:"GH", name: "Ghana").save()
        new Country(abbreviation:"GI", name: "Gibraltar").save()
        new Country(abbreviation:"GL", name: "Greenland").save()
        new Country(abbreviation:"GM", name: "Gambia").save()
        new Country(abbreviation:"GN", name: "Guinea").save()
        new Country(abbreviation:"GP", name: "Guadeloupe").save()
        new Country(abbreviation:"GQ", name: "Equatorial Guinea").save()
        new Country(abbreviation:"GR", name: "Greece").save()
        new Country(abbreviation:"GS", name: "South Georgia and the South Sandwich Islands").save()
        new Country(abbreviation:"GT", name: "Guatemala").save()
        new Country(abbreviation:"GU", name: "Guam").save()
        new Country(abbreviation:"GW", name: "Guinea-Bissau").save()
        new Country(abbreviation:"GY", name: "Guyana").save()
        new Country(abbreviation:"HK", name: "Hong Kong").save()
        new Country(abbreviation:"HM", name: "Heard and McDonald Islands").save()
        new Country(abbreviation:"HN", name: "Honduras").save()
        new Country(abbreviation:"HR", name: "Croatia/Hrvatska").save()
        new Country(abbreviation:"HT", name: "Haiti").save()
        new Country(abbreviation:"HU", name: "Hungary").save()
        new Country(abbreviation:"ID", name: "Indonesia").save()
        new Country(abbreviation:"IE", name: "Ireland").save()
        new Country(abbreviation:"IL", name: "Israel").save()
        new Country(abbreviation:"IM", name: "Isle of Man").save()
        new Country(abbreviation:"IN", name: "India").save()
        new Country(abbreviation:"IO", name: "British Indian Ocean Territory").save()
        new Country(abbreviation:"IQ", name: "Iraq").save()
        new Country(abbreviation:"IR", name: "Iran (Islamic Republic of)").save()
        new Country(abbreviation:"IS", name: "Iceland").save()
        new Country(abbreviation:"IT", name: "Italy").save()
        new Country(abbreviation:"JE", name: "Jersey").save()
        new Country(abbreviation:"JM", name: "Jamaica").save()
        new Country(abbreviation:"JO", name: "Jordan").save()
        new Country(abbreviation:"JP", name: "Japan").save()
        new Country(abbreviation:"KE", name: "Kenya").save()
        new Country(abbreviation:"KG", name: "Kyrgyzstan").save()
        new Country(abbreviation:"KH", name: "Cambodia").save()
        new Country(abbreviation:"KI", name: "Kiribati").save()
        new Country(abbreviation:"KM", name: "Comoros").save()
        new Country(abbreviation:"KN", name: "Saint Kitts and Nevis").save()
        new Country(abbreviation:"KP", name: "Korea, Democratic People's Republic").save()
        new Country(abbreviation:"KR", name: "Korea, Republic of").save()
        new Country(abbreviation:"KW", name: "Kuwait").save()
        new Country(abbreviation:"KY", name: "Cayman Islands").save()
        new Country(abbreviation:"KZ", name: "Kazakhstan").save()
        new Country(abbreviation:"LA", name: "Lao People's Democratic Republic").save()
        new Country(abbreviation:"LB", name: "Lebanon").save()
        new Country(abbreviation:"LC", name: "Saint Lucia").save()
        new Country(abbreviation:"LI", name: "Liechtenstein").save()
        new Country(abbreviation:"LK", name: "Sri Lanka").save()
        new Country(abbreviation:"LR", name: "Liberia").save()
        new Country(abbreviation:"LS", name: "Lesotho").save()
        new Country(abbreviation:"LT", name: "Lithuania").save()
        new Country(abbreviation:"LU", name: "Luxembourg").save()
        new Country(abbreviation:"LV", name: "Latvia").save()
        new Country(abbreviation:"LY", name: "Libyan Arab Jamahiriya").save()
        new Country(abbreviation:"MA", name: "Morocco").save()
        new Country(abbreviation:"MC", name: "Monaco").save()
        new Country(abbreviation:"MD", name: "Moldova, Republic of").save()
        new Country(abbreviation:"MG", name: "Madagascar").save()
        new Country(abbreviation:"MH", name: "Marshall Islands").save()
        new Country(abbreviation:"MK", name: "Macedonia, Former Yugoslav Republic").save()
        new Country(abbreviation:"ML", name: "Mali").save()
        new Country(abbreviation:"MM", name: "Myanmar").save()
        new Country(abbreviation:"MN", name: "Mongolia").save()
        new Country(abbreviation:"MO", name: "Macau").save()
        new Country(abbreviation:"MP", name: "Northern Mariana Islands").save()
        new Country(abbreviation:"MQ", name: "Martinique").save()
        new Country(abbreviation:"MR", name: "Mauritania").save()
        new Country(abbreviation:"MS", name: "Montserrat").save()
        new Country(abbreviation:"MT", name: "Malta").save()
        new Country(abbreviation:"MU", name: "Mauritius").save()
        new Country(abbreviation:"MV", name: "Maldives").save()
        new Country(abbreviation:"MW", name: "Malawi").save()
        new Country(abbreviation:"MX", name: "Mexico").save()
        new Country(abbreviation:"MY", name: "Malaysia").save()
        new Country(abbreviation:"MZ", name: "Mozambique").save()
        new Country(abbreviation:"NA", name: "Namibia").save()
        new Country(abbreviation:"NC", name: "New Caledonia").save()
        new Country(abbreviation:"NE", name: "Niger").save()
        new Country(abbreviation:"NF", name: "Norfolk Island").save()
        new Country(abbreviation:"NG", name: "Nigeria").save()
        new Country(abbreviation:"NI", name: "Nicaragua").save()
        new Country(abbreviation:"NL", name: "Netherlands").save()
        new Country(abbreviation:"NO", name: "Norway").save()
        new Country(abbreviation:"NP", name: "Nepal").save()
        new Country(abbreviation:"NR", name: "Nauru").save()
        new Country(abbreviation:"NU", name: "Niue").save()
        new Country(abbreviation:"NZ", name: "New Zealand").save()
        new Country(abbreviation:"OM", name: "Oman").save()
        new Country(abbreviation:"PA", name: "Panama").save()
        new Country(abbreviation:"PE", name: "Peru").save()
        new Country(abbreviation:"PF", name: "French Polynesia").save()
        new Country(abbreviation:"PG", name: "Papua New Guinea").save()
        new Country(abbreviation:"PH", name: "Philippines").save()
        new Country(abbreviation:"PK", name: "Pakistan").save()
        new Country(abbreviation:"PL", name: "Poland").save()
        new Country(abbreviation:"PM", name: "St. Pierre and Miquelon").save()
        new Country(abbreviation:"PN", name: "Pitcairn Island").save()
        new Country(abbreviation:"PR", name: "Puerto Rico").save()
        new Country(abbreviation:"PS", name: "Palestinian Territories").save()
        new Country(abbreviation:"PT", name: "Portugal").save()
        new Country(abbreviation:"PW", name: "Palau").save()
        new Country(abbreviation:"PY", name: "Paraguay").save()
        new Country(abbreviation:"QA", name: "Qatar").save()
        new Country(abbreviation:"RE", name: "Reunion Island").save()
        new Country(abbreviation:"RO", name: "Romania").save()
        new Country(abbreviation:"RU", name: "Russian Federation").save()
        new Country(abbreviation:"RW", name: "Rwanda").save()
        new Country(abbreviation:"SA", name: "Saudi Arabia").save()
        new Country(abbreviation:"SB", name: "Solomon Islands").save()
        new Country(abbreviation:"SC", name: "Seychelles").save()
        new Country(abbreviation:"SD", name: "Sudan").save()
        new Country(abbreviation:"SE", name: "Sweden").save()
        new Country(abbreviation:"SG", name: "Singapore").save()
        new Country(abbreviation:"SH", name: "St. Helena").save()
        new Country(abbreviation:"SI", name: "Slovenia").save()
        new Country(abbreviation:"SJ", name: "Svalbard and Jan Mayen Islands").save()
        new Country(abbreviation:"SK", name: "Slovak Republic").save()
        new Country(abbreviation:"SL", name: "Sierra Leone").save()
        new Country(abbreviation:"SM", name: "San Marino").save()
        new Country(abbreviation:"SN", name: "Senegal").save()
        new Country(abbreviation:"SO", name: "Somalia").save()
        new Country(abbreviation:"SR", name: "Suriname").save()
        new Country(abbreviation:"ST", name: "Sao Tome and Principe").save()
        new Country(abbreviation:"SV", name: "El Salvador").save()
        new Country(abbreviation:"SY", name: "Syrian Arab Republic").save()
        new Country(abbreviation:"SZ", name: "Swaziland").save()
        new Country(abbreviation:"TC", name: "Turks and Caicos Islands").save()
        new Country(abbreviation:"TD", name: "Chad").save()
        new Country(abbreviation:"TF", name: "French Southern Territories").save()
        new Country(abbreviation:"TG", name: "Togo").save()
        new Country(abbreviation:"TH", name: "Thailand").save()
        new Country(abbreviation:"TJ", name: "Tajikistan").save()
        new Country(abbreviation:"TK", name: "Tokelau").save()
        new Country(abbreviation:"TM", name: "Turkmenistan").save()
        new Country(abbreviation:"TN", name: "Tunisia").save()
        new Country(abbreviation:"TO", name: "Tonga").save()
        new Country(abbreviation:"TP", name: "East Timor").save()
        new Country(abbreviation:"TR", name: "Turkey").save()
        new Country(abbreviation:"TT", name: "Trinidad and Tobago").save()
        new Country(abbreviation:"TV", name: "Tuvalu").save()
        new Country(abbreviation:"TW", name: "Taiwan").save()
        new Country(abbreviation:"TZ", name: "Tanzania").save()
        new Country(abbreviation:"UA", name: "Ukraine").save()
        new Country(abbreviation:"UG", name: "Uganda").save()
        new Country(abbreviation:"UK", name: "United Kingdom").save()
        new Country(abbreviation:"UM", name: "US Minor Outlying Islands").save()
        Country us = new Country(abbreviation:"US", name: "United States").save()
        new Country(abbreviation:"UY", name: "Uruguay").save()
        new Country(abbreviation:"UZ", name: "Uzbekistan").save()
        new Country(abbreviation:"VA", name: "Holy See (City Vatican State)").save()
        new Country(abbreviation:"VC", name: "Saint Vincent and the Grenadines").save()
        new Country(abbreviation:"VE", name: "Venezuela").save()
        new Country(abbreviation:"VG", name: "Virgin Islands (British)").save()
        new Country(abbreviation:"VI", name: "Virgin Islands (USA)").save()
        new Country(abbreviation:"VN", name: "Vietnam").save()
        new Country(abbreviation:"VU", name: "Vanuatu").save()
        new Country(abbreviation:"WF", name: "Wallis and Futuna Islands").save()
        new Country(abbreviation:"WS", name: "Western Samoa").save()
        new Country(abbreviation:"YE", name: "Yemen").save()
        new Country(abbreviation:"YT", name: "Mayotte").save()
        new Country(abbreviation:"YU", name: "Yugoslavia").save()
        new Country(abbreviation:"ZA", name: "South Africa").save()
        new Country(abbreviation:"ZM", name: "Zambia").save()
        new Country(abbreviation:"ZW", name: "Zimbabwe").save()

        // States
        new State(abbreviation:"AA", name: "Armed Forces Americas").save()
        new State(abbreviation:"AE", name: "Armed Forces Europe").save()
        new State(abbreviation:"AK", name: "Alaska").save()
        new State(abbreviation:"AL", name: "Alabama").save()
        new State(abbreviation:"AP", name: "Armed Forces Pacific").save()
        new State(abbreviation:"AR", name: "Arkansas").save()
        new State(abbreviation:"AS", name: "American Samoa").save()
        new State(abbreviation:"AZ", name: "Arizona").save()
        new State(abbreviation:"CA", name: "California").save()
        new State(abbreviation:"CO", name: "Colorado").save()
        new State(abbreviation:"CT", name: "Connecticut").save()
        new State(abbreviation:"DC", name: "District Of Columbia").save()
        new State(abbreviation:"DE", name: "Delaware").save()
        new State(abbreviation:"FL", name: "Florida").save()
        new State(abbreviation:"FM", name: "Federated States Of Micronesia").save()
        new State(abbreviation:"GA", name: "Georgia").save()
        new State(abbreviation:"GU", name: "Guam").save()
        new State(abbreviation:"HI", name: "Hawaii").save()
        new State(abbreviation:"IA", name: "Iowa").save()
        new State(abbreviation:"ID", name: "Idaho").save()
        new State(abbreviation:"IL", name: "Illinois").save()
        new State(abbreviation:"IN", name: "Indiana").save()
        new State(abbreviation:"KS", name: "Kansas").save()
        new State(abbreviation:"KY", name: "Kentucky").save()
        new State(abbreviation:"LA", name: "Louisiana").save()
        new State(abbreviation:"MA", name: "Massachusetts").save()
        new State(abbreviation:"MD", name: "Maryland").save()
        new State(abbreviation:"ME", name: "Maine").save()
        new State(abbreviation:"MH", name: "Marshall Islands").save()
        new State(abbreviation:"MI", name: "Michigan").save()
        State mn = new State(abbreviation:"MN", name: "Minnesota").save()
        new State(abbreviation:"MO", name: "Missouri").save()
        new State(abbreviation:"MP", name: "Northern Mariana Islands").save()
        new State(abbreviation:"MS", name: "Mississippi").save()
        new State(abbreviation:"MT", name: "Montana").save()
        new State(abbreviation:"NC", name: "North Carolina").save()
        new State(abbreviation:"ND", name: "North Dakota").save()
        new State(abbreviation:"NE", name: "Nebraska").save()
        new State(abbreviation:"NH", name: "New Hampshire").save()
        new State(abbreviation:"NJ", name: "New Jersey").save()
        new State(abbreviation:"NM", name: "New Mexico").save()
        new State(abbreviation:"NV", name: "Nevada").save()
        new State(abbreviation:"NY", name: "New York").save()
        new State(abbreviation:"OH", name: "Ohio").save()
        new State(abbreviation:"OK", name: "Oklahoma").save()
        new State(abbreviation:"OR", name: "Oregon").save()
        new State(abbreviation:"PA", name: "Pennsylvania").save()
        new State(abbreviation:"PR", name: "Puerto Rico").save()
        new State(abbreviation:"PW", name: "Palau").save()
        new State(abbreviation:"RI", name: "Rhode Island").save()
        new State(abbreviation:"SC", name: "South Carolina").save()
        new State(abbreviation:"SD", name: "South Dakota").save()
        new State(abbreviation:"TN", name: "Tennessee").save()
        new State(abbreviation:"TX", name: "Texas").save()
        new State(abbreviation:"UT", name: "Utah").save()
        new State(abbreviation:"VA", name: "Virginia").save()
        new State(abbreviation:"VI", name: "Virgin Islands").save()
        new State(abbreviation:"VT", name: "Vermont").save()
        new State(abbreviation:"WA", name: "Washington").save()
        new State(abbreviation:"WI", name: "Wisconsin").save()
        new State(abbreviation:"WV", name: "West Virginia").save()
        new State(abbreviation:"WY", name: "Wyoming").save()

		// Titles
        new Title(abbreviation:"Asst", name: "Assistant", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Br", name: "Brother", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"CMSgt", name: "Chief Master Sergeant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Col", name: "Colonel", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Dean", name: "Dean", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Dr", name: "Doctor", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Fr", name: "Father", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"Gen", name: "General", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"GySgt", name: "Gunnery Sergeant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Hon", name: "Honorary", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"Judge", name: "Judge", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"Lt", name: "Lieutenant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Maj", name: "Major", social:0, civil:0, military:1, religious:0).save()
        Title mr = new Title(abbreviation:"Mr", name: "Mister", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Mrs", name: "Misses", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Ms", name: "Miss", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"MSgt", name: "Master Sergeant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Pastor", name: "Pastor", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"Pbr", name: "Preist", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"Prof", name: "Professor", social:1, civil:0, military:0, religious:0).save()
        new Title(abbreviation:"Rabbi", name: "Rabbi", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"Rep", name: "Representative", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"Rev", name: "Reverend", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"Sen", name: "Senator", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"SgtMjr", name: "Sargent Major", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Sheriff", name: "Sheriff", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"SMSgt", name: "Senior Master Sergeant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Sr", name: "Sister", social:0, civil:0, military:0, religious:1).save()
        new Title(abbreviation:"SSgt", name: "Staff Sergeant", social:0, civil:0, military:1, religious:0).save()
        new Title(abbreviation:"Supt", name: "Superintendent", social:0, civil:1, military:0, religious:0).save()
        new Title(abbreviation:"TSgt", name: "Technical Sergeant", social:0, civil:0, military:1, religious:0).save()



        // Ethinicities
        new Ethnicity(name:"Refused").save()
        new Ethnicity(name:"Asian").save()
        new Ethnicity(name:"American Indian or Alaskan").save()
        new Ethnicity(name:"Black").save()
        new Ethnicity(name:"Hispanic").save()
        new Ethnicity(name:"Pacific Islander").save()
        new Ethnicity(name:"White").save()
        new Ethnicity(name:"Black, Hispanic Not Answered").save()
        new Ethnicity(name:"White, Hispanic Not Answered").save()
        new Ethnicity(name:"Don't know").save()

        // Sources
        new Source(name: "NCS Team").save()
        new Source(name: "NCS Participant").save()
        new Source(name: "NCS Recruitment Source").save()
        
        // ResourceTypes
        ResourceType emailUri = new ResourceType(name: "Email Address", prefix:"mailto:").save()
        new ResourceType(name: "Email CC Address", prefix:"mailto:").save()
        ResourceType webUri = new ResourceType(name: "Home Page", prefix:"http://").save()
        new ResourceType(name: "Facebook Page", prefix:"http://www.facebook.com/").save()
        new ResourceType(name: "MySpace Page", prefix:"http://www.myspace.com/").save()

        // Group Categories
        GroupCategory groupCategoryStudy = new GroupCategory(name: "Study").save()
        GroupCategory groupCategoryMailList = new GroupCategory(name: "Mailing List").save()
        
        // Groups
        new Group(name:"National Children's Study", nickName:"NCS", category:groupCategoryStudy).save()
        new Group(name:"Community Advisory Board", nickName:"CAB", category:groupCategoryStudy).save()
        new Group(name:"Institutional Avisory Board", nickName:"IAB", category:groupCategoryStudy).save()

        // Group groupCommTeam = new Group(name:"National Children's Study UMN Communications Team", nickName:"NCS UMN CommTeam", category:groupCategoryMailList).save()
        // new Group(name:"National Children's Study UMN Consultants", nickName:"NCS UMN Consultants", category:groupCategoryMailList).save()
        // new Group(name:"National Children's Study UMN Friends", nickName:"NCS UMN Friends", category:groupCategoryMailList).save()
        // new Group(name:"National Children's Study UMN Site Adminitrators", nickName:"NCS UMN SiteAdmin", category:groupCategoryMailList).save()
        
        // Group Roles
        GroupRole groupRoleMember = new GroupRole(name:"Member").save()
        new GroupRole(name:"Communications Coordinator").save()
        new GroupRole(name:"Principal Investigator").save()
        new GroupRole(name:"Co-Investigator").save()
        new GroupRole(name:"Co-Chair").save()
        new GroupRole(name:"Staff").save()
        new GroupRole(name:"Consultant").save()
        new GroupRole(name:"Contractor").save()
        new GroupRole(name:"Media Contact").save()
        
        // Unit Roles
        new OrganizationalRole(name:"Faculty").save()
        new OrganizationalRole(name:"Staff").save()
        new OrganizationalRole(name:"Student").save()
        new OrganizationalRole(name:"Professor").save()
        new OrganizationalRole(name:"Department Head").save()
        new OrganizationalRole(name:"Division Head").save()
        new OrganizationalRole(name:"Dean").save()
        new OrganizationalRole(name:"President").save()
        
        // Relationships
        new PersonRelation(name:"Supervisor").save()
        new PersonRelation(name:"Subordinate").save()
        new PersonRelation(name:"Colleague").save()
        new PersonRelation(name:"Spouse").save()
        new PersonRelation(name:"Son").save()
        new PersonRelation(name:"Daughter").save()
        new PersonRelation(name:"Father").save()
        new PersonRelation(name:"Mother").save()
        
        PhoneType homePhone = new PhoneType(name:"Home").save()
        PhoneType cellPhone = new PhoneType(name:"Mobile").save()
        PhoneType workPhone = new PhoneType(name:"Work").save()
        new PhoneType(name:"Work Mobile").save()
        new PhoneType(name:"TTY").save()
        new PhoneType(name:"Fax").save()
        new PhoneType(name:"Modem").save()
        
        // Credentials
        new Credential(abbreviation:"B.A.", name: "bachelor of arts").save()
        new Credential(abbreviation:"B.S.", name: "bachelor of science").save()
        new Credential(abbreviation:"M.A.", name: "master of arts").save()
        new Credential(abbreviation:"M.S.", name: "master of science").save()
        new Credential(abbreviation:"M.D.", name: "doctor of medicine").save()
        new Credential(abbreviation:"M.P.H.", name: "master of public health").save()
        new Credential(abbreviation:"M.B.A.", name: "master of business administration").save()
        new Credential(abbreviation:"Ph.D.", name: "doctor of philosophy").save()
        new Credential(abbreviation:"R.N.", name: "registered nurse ").save()
        new Credential(abbreviation:"M.P.P.", name: "master of public policy").save()
        new Credential(abbreviation:"M.S.N.", name: "master of science in nursing").save()
        new Credential(abbreviation:"Dr.P.H.", name: "doctor of public hygiene").save()
        new Credential(abbreviation:"Sc.D.", name: "doctor of science").save()
        new Credential(abbreviation:"B.S.N.", name: "bachelor of science in nursing").save()
        new Credential(abbreviation:"C.I.H.", name: "certified industrial hygienist").save()
        new Credential(abbreviation:"R.D.", name: "registered dietician").save()
        new Credential(abbreviation:"L.P.", name: "licensed psychoanalyst").save()

        // Organizations and Units
        new Organization(name: "University of Minnesota", nickName: "U of MN")
            .addToUnits(name:"Environmental Health Sciences", , nickName: "EnHS")
            .addToUnits(name:"School of Public Health", , nickName: "SPH").save()

        new Organization(name: "Abbott Northwestern Hospital", nickName: "Abbott")
            .addToUnits(new OrganizationalUnit(name:"Virginia Piper Cancer Institute", , nickName: "VPCI")).save()


        // Unit to Unit Relations
        new UnitRelation(name:"Parent").save()
        new UnitRelation(name:"Department").save()
        new UnitRelation(name:"School").save()
        new UnitRelation(name:"Division").save()

        Address twoHundredOak = new Address(streetAddress: "200 Oak St SE", 
            city: "Minneapolis", state: mn, zipcode:"55455", zip4:"2008", county:"Hennepin", 
            country:us).save()

        Address buchanan = new Address(streetAddress: "3323 Buchanan St NE", 
            city: "Minneapolis", state: mn, zipcode:"55418", zip4:"1449", county:"Hennepin", 
            country:us).save()

        Phone ajzWorkPhone = new Phone(phoneNumber: "6126253460").save()
        Phone ajzCellPhone = new Phone(phoneNumber: "6122963127").save()

        UniformResource ajzUmnEdu = new UniformResource(url:"mailto:ajz@umn.edu").save()
        UniformResource ajzGmail = new UniformResource(url:"mailto:aaron.zirbes@gmail.edu").save()

        // People
        new Person(gender:male, birthDate: new Date(312012000000))
            .addToGroups(role:groupRoleMember, group:groupCommTeam)
            .addToNames(title:mr, firstName:"Aaron", 
                middleName:"James", lastName:"Zirbes", nameType:preferred)
            .addToAddresses(deliveryAddress: twoHundredOak, addressType: workAddress)
            .addToPhones(phone: ajzWorkPhone, phoneType: workPhone)
            .addToUris(uriType: emailUri, uri: ajzUmnEdu)
            .addToUris(uriType: emailUri, uri: ajzGmail)
            .addToPhones(phone: ajzCellPhone, phoneType: cellPhone)
            .addToAddresses(deliveryAddress: buchanan, addressType: homeAddress).save()
	


        new Person(gender:female)
            .addToGroups(role:groupRoleMember, group:groupCommTeam)
            .addToNames(title:Title.findByName("Mrs"), firstName:"Nancy", middleName:"M", lastName:"Nachriener", nameType:preferred).save()

        new Person(gender:female)
            .addToNames(title:Title.findByName("Ms"), firstName:"Jill", middleName:"E", lastName:"Cordes", nameType:preferred).save()

        new Person(gender:female)
            .addToNames(title:Title.findByName("Ms"), firstName:"Gabe", lastName:"Meyer", nameType:preferred)
            .addToNames(title:Title.findByName("Ms"), firstName:"Gabrielle", middleName:"R", lastName:"Meyer", nameType:official).save()

        new Person(gender:male)
            .addToNames(title:Title.findByName("Mr"), firstName:"Frank", middleName:"X", lastName:"Strahan", nameType:preferred)
            .addToNames(title:Title.findByName("Mr"), firstName:"Francis", middleName:"Xavier", lastName:"Strahan", nameType:official).save()
  
  
  		// Users
  		new User(username: "ajz", userRealName: "Aaron J. Zirbes", email: "ajz@umn.edu", enabled: true).save()
  		new User(username: "jec", userRealName: "Jill E. Cordes", email: "jec@cccs.umn.edu", enabled: true).save()
  		new User(username: "grm", userRealName: "Gabrielle R. Meyer", email: "grm@cccs.umn.edu", enabled: true).save()
  		new User(username: "nmn", userRealName: "Nancy M. Nachriener", email: "nmn@umn.edu", enabled: true).save()
  		new User(username: "msg", userRealName: "Mindy S. Geisser", email: "msg@cccs.umn.edu", enabled: true).save()
  		new User(username: "ngp", userRealName: "Natalya G. Portnov", email: "ngp@cccs.umn.edu", enabled: true).save()

      */
        
     }
     def destroy = {
     }
} 
