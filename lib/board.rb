# frozen_string_literal:true

class Board
  def initialize(secret_word)
    @secret_word = secret_word
    @word_table = nil
  end

  def replace_secret_word
    @word_table = @secret_word.each { |c| c.replace '_' }
  end

  def display_underscores
    p @word_table.join(' ')
  end
end
