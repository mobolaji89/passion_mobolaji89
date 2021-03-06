enable :sessions

CALLBACK_URL = "http://localhost:9393/auth/callback"

Instagram.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.client_secret = ENV['CLIENT_SECRET']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

get "/instagram" do
  '<a href="/auth/connect">Connect with Instagram</a>'
end

get "/auth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/auth/callback" do
  p response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/feed"
end

get "/feed" do
  erb :'/feed/instagram'
end

get "/user_recent_media" do
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  erb :"/feed/instagram"
end
