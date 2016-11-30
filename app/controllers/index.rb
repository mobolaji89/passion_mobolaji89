get '/' do
  # Look in app/views/index.erb
  #p ENV["CLIENT_ID"]
  @title = 'Photos'
  @photos = recent_photos
  erb :index
end
