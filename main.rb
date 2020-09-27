# frozen_string_literal:true

require_relative 'lib/game'
require_relative 'lib/dictionary'

# Load dictionary
dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.read_dictionary
dictionary.keep_5_to_12_words

# Initial setup
game = Game.new(dictionary.possible_words)
game.ask_to_load
