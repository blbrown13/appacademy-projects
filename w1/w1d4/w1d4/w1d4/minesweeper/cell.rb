class Cell

  def initialize
    @has_bomb = Cell.random_bomb
    @flagged = false
    @revealed = false
  end

  def self.random_bomb
    # random # 1-10, < 2 make a bomn
    # return true
  end


end
