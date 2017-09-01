

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

get '/users/:id' do
  erb :'users/show'
end

get '/users/login' do
  erb :'users/login'
end
