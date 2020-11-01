# frozen_string_literal:true

# Opens the file that contains list of words
class Dictionary
  attr_reader :possible_words

  def initialize
    @dictionary = nil
    @possible_words = []
  end

  def load_dictionary
    @dictionary = File.open '5desk.txt'
  end

  def read_dictionary
    @dictionary = @dictionary.read.split
  end

  def keep_5_to_12_words
    @dictionary.each do |word|
      @possible_words.push(word) if word.length <= 12 && word.length >= 5
    end
  end
end
