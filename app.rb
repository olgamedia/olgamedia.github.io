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
	erb :index
end

get "/edit" do
	protected!
	erb :edit
end

post "/event/add" do
	protected!
	@@events.push(params[:event])
	redirect "/edit"
end

get "/event/remove/:id" do
	protected!
	@@events.delete_at(params[:id].to_i)
	redirect "/edit"
end


get "/logout" do
	throw(:halt, [401, "Successfully logged out\n"])
end