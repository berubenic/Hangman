require_relative 'lib/game.rb'
require_relative 'lib/dictionary.rb'

new_game = Dictionary.new
new_game.load_dictionary
new_game.read_dictionary
new_game.keep_5_to_12_words
