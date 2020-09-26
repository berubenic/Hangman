# frozen_string_literal:true

# Holds the game logic
class Game
  def initialize(possible_words)
    @secret_word = nil
    @possible_words = possible_words
  end

  def choose_secret_word
    @secret_word = @possible_words.sample
  end

  def lowercase_secret_word
    @secret_word.downcase!
    p @secret_word
  end
end
