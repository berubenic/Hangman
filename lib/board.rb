# frozen_string_literal:true

class Board
  def initialize
    @underscores = []
  end

  def replace_secret_word_with_underscores(length)
    length.times { @underscores.push('_ ') }
  end

  def display_underscores
    p @underscores.join
  end
end
