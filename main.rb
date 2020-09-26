require_relative 'lib/game.rb'
require_relative 'lib/dictionary.rb'

dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.read_dictionary
dictionary.keep_5_to_12_words

new_game = Game.new(dictionary.possible_words)
new_game.choose_secret_word
