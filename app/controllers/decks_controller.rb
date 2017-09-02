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

get '/decks/:id/rounds' do
  @round = Round.new
  redirect "/rounds/#{@round.id}/decks/params[:id]"
end