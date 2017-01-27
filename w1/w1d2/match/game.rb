require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'player.rb'

class Game

  def initialize(*players, board_size)
    @player_one, @player_two = players[0], players[1]
    @current_player = @player_one
    @board = Board.new(board_size, @player_one, @player_two)
  end

  def play
    system('clear')
    puts "Let's play Match!\n"
    sleep 1
    @board.populate

    until @board.win?
      puts "#{@current_player.name}'s turn\n"
      @board.display_board
      take_turn
      switch_players
      sleep 2
      system("clear")
    end

    get_winner
  end

  def get_winner
    if @player_one.points > @player_two.points
      puts "#{player_one.name} wins!"
    elsif @player_two.points > @player_one.points
      puts "#{player_two.name} wins!"
    else
      puts "Tie"
    end
  end

  def take_turn
    2.times do |m|
      # add: until move is not duplicate choose move
      move = @current_player.choose_move
      @board.place_position(move)
      @board.display_board
    end

    if @board.check_if_pair?
      @board.remove_pair
      @current_player.points += 1
    else
      @board.hide_pair
    end
  end

  # def valid_move?(pos,moves)
  #   p pos
  #   p @board
  #   p @board[pos]
  #   if move.include?(pos)
  #     puts "That card has already been chosen"
  #     return false
  #   end
  #   true
  # end

  def switch_players
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

end

p1 = Player.new('Brandon')
p2 = Player.new('John')

game = Game.new(p1, p2, 2)

game.play
