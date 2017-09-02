
get '/rounds/:round_id/decks/:deck_id' do

  @round = Round.find(params[:round_id])
  @card = @round.remaining_cards.sample
  erb :show
end

post '/rounds/:round_id/cards/:card_id/guesses' do
  # make a guess for this card, in this round
  correct_answer = Card.find(params[:card_id]).answer
  if params[:answer] == correct_answer
    @guess = Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "true", round_id: params[:round_id])
  else
     @guess = Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "false", round_id: params[:round_id])
  end
  redirect "/rounds/#{@guess.round_id}/decks/#{@correct_answer.deck_id}"
end
