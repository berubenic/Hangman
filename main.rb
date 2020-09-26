# frozen_string_literal:true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/player'
require_relative 'lib/board'

dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.read_dictionary
dictionary.keep_5_to_12_words

game = Game.new(dictionary.possible_words)
game.choose_secret_word
game.lowercase_secret_word
game.secret_word_array

board = Board.new
board.replace_secret_word_with_underscores(game.secret_word.length)
board.display_underscores

player = Player.new
player.guess_letter

game.compare_guess_to_secret_word(player.guess)
