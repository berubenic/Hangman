# frozen_string_literal:true

# Holds the game logic
class Game
  attr_reader :secret_word

  def initialize(possible_words)
    @secret_word = nil
    @possible_words = possible_words
    @incorrect_guesses = 6
  end

  def choose_secret_word
    @secret_word = @possible_words.sample
    p @secret_word
  end

  def lowercase_secret_word
    @secret_word.downcase!
  end

  def secret_word_array
    @secret_word = @secret_word.split('')
  end

  def compare_guess_to_secret_word(guess)
    if @secret_word.include?(guess)
      get_index_of_matches(guess)
    else @incorrect_guesses -= 1
    end
  end

  def get_index_of_matches(guess)
    indexes = (0...@secret_word.length).find_all do |i|
      @secret_word[i] == guess
    end
    replace_underscore_with_matches(indexes)
  end

  def replace_underscore_with_matches(num); end
end
