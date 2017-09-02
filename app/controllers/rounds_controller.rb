
get '/rounds/:round_id/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  @card = @round.remaining_cards.sample
  erb :show
end

post '/rounds/:round_id/decks/:deck_id/cards/:card_id' do
  # make a guess for this card, in this round
  correct_answer = Card.find(params[:card_id]).answer
  #this for if there is no guess for the card yet:
  if params[:answer] == correct_answer
    @guess = Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "true", round_id: params[:round_id], attempt: 1)
  else
     @guess = Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "false", round_id: params[:round_id], attempt: 1)
  end
  redirect "/rounds/#{params[:round_id]}/decks/#{params[:deck_id]}"
end
