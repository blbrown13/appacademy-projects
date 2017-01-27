class Card

  attr_reader :value, :star, :face_up

  def initialize(value, face_up = false)
    @value, @face_up = value, face_up
    @star = :*
  end

  def hide
    flip_card
    @star
  end

  def reveal
    flip_card
    @value
  end

  def flip_card
    @face_up = @face_up == true ? false : true
  end

end
