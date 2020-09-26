# frozen_string_literal:true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/player'
require_relative 'lib/board'

# Load dictionary
dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.read_dictionary
dictionary.keep_5_to_12_words

# Initial setup
game = Game.new(dictionary.possible_words)
game.choose_secret_word
game.lowercase_secret_word
game.secret_word_array
game.replace_secret_word_with_underscores
game.display_underscores

# Game starts
until game.game_over == true
  game.guess_letter
  game.compare_guess_to_secret_word
  game.display_result
  game.verify_next_turn
end

# Game Over
game.final_statement
