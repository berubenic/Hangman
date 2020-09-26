# frozen_string_literal:true

# Holds the game logic
class Game
  attr_reader :secret_word, :game_over

  def initialize(possible_words)
    @secret_word = nil
    @possible_words = possible_words
    @underscores = []
    @incorrect_guesses = 6
    @guess = nil
    @game_over = false
  end

  def choose_secret_word
    @secret_word = @possible_words.sample
  end

  def lowercase_secret_word
    @secret_word.downcase!
  end

  def secret_word_array
    @secret_word = @secret_word.split('')
  end

  def guess_letter
    puts 'Guess a letter from a-z. :)'
    @guess = gets.chomp.downcase
  end

  def compare_guess_to_secret_word
    if @secret_word.include?(@guess)
      index_of_matches
    else
      puts 'You guessed wrong!'
      @incorrect_guesses -= 1
    end
  end

  def index_of_matches
    indexes = (0...@secret_word.length).find_all do |i|
      @secret_word[i] == @guess
    end
    replace_underscore_with_matches(indexes)
  end

  def replace_underscore_with_matches(indexes)
    indexes.each do |i|
      @underscores[i] = @guess
    end
  end

  def replace_secret_word_with_underscores
    length = @secret_word.length
    length.times { @underscores.push('_ ') }
  end

  def display_underscores
    p @underscores.join
  end

  def display_result
    p "#{@incorrect_guesses} incorrect guesses left."
    p @underscores.join
  end

  def verify_next_turn
    @game_over = true if @incorrect_guesses.zero? || @underscores == @secret_word
  end

  def final_statement
    if @incorrect_guesses.zero?
      puts 'You lost!'
    else puts 'You won!'
    end
  end
end
