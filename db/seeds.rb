module Parser

  def self.parse(filename, deck_id)
    questions = []
    answers = []
    File.foreach(filename) do |row|
      if row.include?("?")
        questions << row.chomp
      elsif row != "\n"
        answers << row.chomp
      end
    end
    self.parse_cards(questions, answers, deck_id)
  end

  def self.parse_cards(questions, answers, deck_id)
    cards = []
    questions.each_index do |index|
      cards << Card.create!({
        question: questions[index],
        answer: answers[index],
        deck_id: deck_id
        })
    end
    cards
  end
end

Parser.parse("nighthawk_flashcard_data.txt", 1)
Parser.parse("otter_flashcard_data.txt", 2)
Parser.parse("raccoon_flashcard_data.txt", 3)

Deck.create!(name: "nighthawk flashcards", creator_id:1)
Deck.create!(name: "otter flashcards", creator_id:1)
Deck.create!(name: "raccoon flashcards", creator_id:1)

User.create!(username: "bob", email: "bob@bob.com", hashed_pw: "bob")
