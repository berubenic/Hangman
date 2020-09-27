# frozen_string_literal:true

require_relative 'save_load'
require 'yaml'

# Holds the game logic
class Game
  attr_reader :secret_word, :game_over, :guess

  include SaveLoad

  def initialize(possible_words)
    @secret_word = nil
    @possible_words = possible_words
    @underscores = []
    @incorrect_guesses = 6
    @incorrect_letters = []
    @guess = nil
    @game_over = false
  end

  def ask_to_load
    puts 'Do you want to load a saved game? (yes/no)'
    answer = gets.chomp
    if answer == 'yes'
      load_game
    else
      puts "Enter 'save' to save the game between turns"
      choose_secret_word
    end
  end

  private

  def choose_secret_word
    @secret_word = @possible_words.sample
    lowercase_secret_word
  end

  def lowercase_secret_word
    @secret_word.downcase!
    secret_word_array
  end

  def secret_word_array
    @secret_word = @secret_word.split('')
    replace_secret_word_with_underscores
  end

  def replace_secret_word_with_underscores
    length = @secret_word.length
    length.times { @underscores.push('_ ') }
    display_underscores
    player_turn
  end

  def display_underscores
    p @underscores.join
  end

  def player_turn
    if @game_over == false
      guess_letter
    else
      final_statement
    end
  end

  def guess_letter
    puts "\nGuess a letter from a-z. :)"
    @guess = gets.chomp.downcase
    verify_save
  end

  def verify_save
    if @guess == 'save'
      define_game_state
    else compare_guess_to_secret_word
    end
  end

  def compare_guess_to_secret_word
    if @secret_word.include?(@guess)
      index_of_matches
    else
      duplicate_incorrect_letter
    end
  end

  def duplicate_incorrect_letter
    if @incorrect_letters.include?(@guess)
      display_result
    else incorrect_guess
    end
  end

  def incorrect_guess
    puts "\nYou guessed wrong!"
    @incorrect_guesses -= 1
    store_incorrect_guess
  end

  def store_incorrect_guess
    @incorrect_letters.push(@guess)
    display_result
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
    display_result
  end

  def display_result
    puts "\n #{@incorrect_guesses} incorrect guesses left. \n\n"
    puts "Incorrect letters: #{@incorrect_letters.join(' ')} \n\n"
    display_underscores
    verify_next_turn
  end

  def verify_next_turn
    @game_over = true if @incorrect_guesses.zero? || @underscores == @secret_word
    player_turn
  end

  def final_statement
    if @incorrect_guesses.zero?
      puts 'You lost!'
    else puts 'You won!'
    end
  end
end
