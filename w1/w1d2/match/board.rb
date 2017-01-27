require_relative "card.rb"

class Board

  attr_reader :grid, :track_pair

  def initialize(board_size, player_one, player_two)
    @grid = Array.new(board_size) {Array.new(board_size)}
    @board_size = board_size
    @player_one, @player_two = player_one, player_two
    @num_cards = (1..(@board_size * @board_size) / 2).to_a * 2
    @track_pair = {}
  end

  def populate
    (0...@board_size).each do |row|
      (0...@board_size).each do |col|
        value = @num_cards.pop #shuffle!
        pos = [row, col]
        self[pos] = Card.new(value)
      end
    end
    @grid
   end

   def place_position(pos)
     selected_card = self[pos]
     selected_card.reveal
     @track_pair[pos] = selected_card.value
   end

   def check_if_pair?
     @track_pair.values[0] == @track_pair.values[1] ? true : false
   end

   def remove_pair
     self[@track_pair.keys[0]] = nil
     self[@track_pair.keys[1]] = nil
     @track_pair.clear
   end

   def hide_pair
     card_one = self[@track_pair.keys[0]]
     card_two = self[@track_pair.keys[1]]
     card_one.hide
     card_two.hide
     @track_pair.clear
   end

   def display_board
     display_grid = []
     @grid.each do |row|
       row_grid = []
       row.each do |card|
         if card.nil?
           row_grid << ' '
         elsif card.face_up
           row_grid << "#{card.value}"
         elsif !card.face_up
           row_grid << "#{card.star.to_sym}"
         end
       end
       display_grid << row_grid
     end

     render_grid(display_grid)
   end

   def render_grid(grid)
     grid.each do |row|
       p row
     end
   end

   def win?
     @grid.flatten.all?{|el| el.nil?}
   end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row , col = pos
    @grid[row][col] = mark
  end

end
