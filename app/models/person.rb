class Person < ApplicationRecord
  has_many :cars, dependent: :destroy
  validates_presence_of :first_name, :last_name, :email 
end
