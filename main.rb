# frozen_string_literal:true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/player'

dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.read_dictionary
dictionary.keep_5_to_12_words

new_game = Game.new(dictionary.possible_words)
new_game.choose_secret_word
new_game.lowercase_secret_word

player = Player.new
player.guess_letter
