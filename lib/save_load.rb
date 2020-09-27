# frozen_string_literal:true

require 'yaml'
# handles saving and loading
module SaveLoad
  def define_game_state
    game_state = {
      'guess' => @guess,
      'secret_word' => @secret_word,
      'underscores' => @underscores,
      'incorrect_guesses' => @incorrect_guesses,
      'incorrect_letters' => @incorrect_letters,
      'game_over' => @game_over
    }
    save_game(game_state)
  end

  def save_game(game_state)
    save_file = File.open('hangman_save.yml', 'w')
    YAML.dump(game_state, save_file)
    save_file.close
    exit
  end

  def load_game
    save_file = YAML.load(File.read('hangman_save.yml'))
    @guess = save_file['guess']
    @secret_word = save_file['secret_word']
    @underscores = save_file['underscores']
    @incorrect_guesses = save_file['incorrect_guesses']
    @incorrect_letters = save_file['incorrect_letters']
    @game_over = save_file['game_over']
    display_result
  end
end
