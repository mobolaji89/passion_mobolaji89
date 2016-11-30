get '/' do
  # Look in app/views/index.erb
  p ENV["CLIENT_ID"]
  erb :index
end
