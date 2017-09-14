class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def number_of_unique_items 
    snacks.distinct.count
  end
end
