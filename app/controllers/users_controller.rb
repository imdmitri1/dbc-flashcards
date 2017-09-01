

get '/users/new' do
  #html form for new user
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password=(params[:user][:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    redirect '/users/new'
  end
end


get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  #if it's sucessful, give them a session cookie
  #redirect to their profile
  #if it's unsuccessful, go back to the login page
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    redirect '/users/login'
  end
end

post '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
