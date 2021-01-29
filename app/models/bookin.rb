class Bookin < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers
end
