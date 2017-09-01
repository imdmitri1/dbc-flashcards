

get '/users/new' do
  #html form for new user
  erb :'users/new'
end

post '/users' do
  #logic for creating a new user
  #if yes, redirect to something
  #if no, repopulate form
end

