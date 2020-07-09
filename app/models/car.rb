class Car < ApplicationRecord
  belongs_to :person
  validates_presence_of :year, :make, :model, :price
end
