class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    self.average(:price).to_i
  end
end
