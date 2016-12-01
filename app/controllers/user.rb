get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(email: params[:email], password: params[:password])
  @user.save
  if @user.save
    redirect '/'
  else
    erb :'users/new'
  end
end
