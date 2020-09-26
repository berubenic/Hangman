# frozen_string_literal:true

class Player
  def intialize
    @guess = nil
  end

  def guess_letter
    puts 'Guess a letter from a-z. :)'
    @answer = gets.chomp.downcase
  end
end
