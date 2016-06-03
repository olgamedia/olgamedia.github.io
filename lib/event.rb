class Event
	include DataMapper::Resource
	property :id, Serial
	property :title, String
	property :date, String
	property :fee, String
	property :summary, Text
	property :address, String
	property :link, String
	property :linkText, String
end