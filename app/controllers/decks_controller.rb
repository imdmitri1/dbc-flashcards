get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

# DECKS show
# get '/decks/:id' do
# end