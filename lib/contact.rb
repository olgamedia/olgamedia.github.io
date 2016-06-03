class Contact
	include DataMapper::Resource
	property :id, Serial
	property :email, String
	property :phone, String
	property :address, String
end