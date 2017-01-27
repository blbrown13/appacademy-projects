class Player

  attr_accessor :points
  attr_reader :name

  def initialize(name)
    @name = name
    @points = 0
  end

  def choose_move
    # remember indices are not accounted for
    puts "\nChoose card in format: x,y"
    move = gets.chomp
    move = move.split(',').map(&:to_i)
  end


end
