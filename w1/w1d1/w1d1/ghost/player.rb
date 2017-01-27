class Player

  def initialize

  end


  def guess
    begin
      puts "Choose a letter:"
      guess = gets.chomp
    rescue
      retry if alert_invalid_guess
    end

    guess
  end


  def alert_invalid_guess
    puts 'Not a valid guess, try again!'
  end

end
