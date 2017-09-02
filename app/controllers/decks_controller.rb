get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# DECKS show
get '/decks/:id' do
  #show the stats or something for the deck
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end

post '/decks/:id/rounds' do
  @round = Round.create({deck_id: params[:id], user_id: session[:user_id]})
  redirect "/rounds/#{@round.id}/decks/#{params[:id]}"
end