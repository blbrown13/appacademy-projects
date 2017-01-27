require_relative 'player.rb'

class Game

  def initialize(player_1, player_2, dictionary)
    @player_1, @player_2 = player_1, player_2
    @current_player = player_1
    @fragment = ''
    @dictionary_name = dictionary
  end

  def play_round
    until game_over?
      take_turn(@current_player)
      @current_player = next_player!
    end
  end

  private

  attr_accessor :current_player, :fragment

  def next_player!
    current_player == @player_1 ? @player_2 : @player_1
  end

  def take_turn(player)
    player.guess = guess until valid_play?(guess)
  end

  def valid_play?(string)
    is_letter?(string) && dictionary.include?(fragment + guess)
  end

  def is_letter?(string)
    ('a'..'z').to_a.include?(string)
  end

  def game_over?
    dictionary.include?(fragment)
  end

end
