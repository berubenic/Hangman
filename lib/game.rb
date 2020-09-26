# frozen_string_literal:true

# Holds the game logic
class Game
  attr_reader :secret_word

  def initialize(possible_words)
    @secret_word = nil
    @possible_words = possible_words
  end

  def choose_secret_word
    @secret_word = @possible_words.sample
  end

  def lowercase_secret_word
    @secret_word.downcase!
  end

  def secret_word_array
    @secret_word = @secret_word.split('')
    p @secret_word
  end
end
