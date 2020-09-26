# frozen_string_literal:true

class Player
  attr_reader :guess

  def intialize
    @guess = nil
  end

  def guess_letter
    puts 'Guess a letter from a-z. :)'
    @guess = gets.chomp.downcase
  end
end
