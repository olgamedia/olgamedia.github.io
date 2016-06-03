def authorized?
  @auth ||=  Rack::Auth::Basic::Request.new(request.env)
  @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ["admin","pass"]
end

def protected!
  unless authorized?
    response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
    throw(:halt, [401, "Oops... we need your login name & password\n"])
  end
end

get "/" do
	@events = Event.all
	@contact = Contact.first_or_create(email: "Olga@OlgaMedia.com", phone: "+1.408-489-0852", address: "262 Meadow Pine Place, San Jose, CA 95125, USA")
	erb :index
end

get "/edit" do
	protected!
	@events = Event.all
	@contact = Contact.first_or_create(email: "Olga@OlgaMedia.com", phone: "+1.408-489-0852", address: "262 Meadow Pine Place, San Jose, CA 95125, USA")
	erb :edit, cache: false
end

post "/event/add" do
	protected!
	Event.create(params[:event])
	redirect "/edit"
end

get "/event/remove/:id" do
	protected!
	Event.get(params[:id].to_i).destroy!
	redirect "/edit"
end


get "/logout" do
	throw(:halt, [401, "Successfully logged out\n"])
end