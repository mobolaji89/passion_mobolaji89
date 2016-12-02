get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  if User.authenticate(params[:username_or_email], params[:password])
    @user = User.authenticate(params[:username_or_email], params[:password])
    session[:id] = @user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

get '/sessions/delete' do
  session.clear
  redirect '/'
end
