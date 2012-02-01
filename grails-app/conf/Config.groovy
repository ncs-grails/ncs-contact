grails.config.locations = [ 
	"file:/etc/grails/active-directory.groovy",
	"file:/etc/grails/shibboleth.groovy",
	"file:/etc/grails/mock-config.groovy",
	"file:/etc/grails/logging-config.groovy",
	"file:/etc/grails/mail-config.groovy",
	"file:/etc/grails/zpfour-config.groovy",
	"file:/etc/grails/${appName}-config.groovy" ]

grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

