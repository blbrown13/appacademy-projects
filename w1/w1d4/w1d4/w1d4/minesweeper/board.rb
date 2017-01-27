class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(9) {Array.new(9) {'cell'}}
    # creates cell class
  end

  def display_board
    grid.each do |rows|
      puts "#{rows.join(" ")}"
    end
  end



end

# board = Board.new
# board.display_board


# @bomb_count
