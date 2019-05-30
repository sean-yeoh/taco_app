class Taco < ApplicationRecord
  validates :notes, presence: true
  before_save :calculate_price_cents
  monetize :price_cents
  monetize :meat_price_cents
  monetize :sides_price_cents
  monetize :single_side_price_cents

  def meat_price_cents
    300
  end

  def sides_price_cents
    [:rice, :salsa, :coleslaw].select { |side| self.send(side) }.size * single_side_price_cents
  end

  def single_side_price_cents
    50
  end

  def calculate_price_cents
    self.price_cents = meat_price_cents + sides_price_cents
  end
end
