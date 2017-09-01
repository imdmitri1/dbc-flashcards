
get '/rounds/:round_id/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id]).cards
# @card =
# if card.guesses.true_false == true

  erb :"partials/_question_show", locals: {card: @card}, layout: false
end

post '/rounds/:round_id/cards/:card_id/guesses' do
  # make a guess for this card, in this round
  correct_answer = Card.find_by(id: params[:card_id]).answer
  if params[:answer] == correct_answer
    Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "true", round_id: params[:round_id])
  else
     Guess.create(card_id: params[:card_id], guess: params[:answer], true_false: "true", round_id: params[:round_id])
  end
    redirect '/round/:deck_id'
end
