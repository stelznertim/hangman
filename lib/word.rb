class Word

  attr_accessor :dash_row
  attr_reader :word, :file

  MINIMUM_WORD_SIZE = 5
  MAXIMUM_WORD_SIZE = 12

  def initialize
    @file = File.open('5desk.txt') # no instance needed
    @word = get_word_from_file(file)
    @dash_row = Array.new(@word.length, ' _')
  end

  def format_file(file)
    file.readlines.map(&:chomp).filter { |line| line.length.between?(MINIMUM_WORD_SIZE, MAXIMUM_WORD_SIZE) }
  end

  def get_word_from_file(file)
    words = format_file(file)
    words[rand(words.length)].downcase
  end

  def show_dash_row
    word.length.times do |index|
      print dash_row[index]
    end
    puts ''
  end

  def update_dash_row(guess, indexes)
    indexes.each do |index|
      dash_row[index] = guess
    end
    dash_row
  end

  def word_finished?
    dash_row.count(' _').zero?
  end

  def load_word(word, dash_row)
    @word = word
    @dash_row = dash_row
  end
end
