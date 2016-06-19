class CarriageType < ActiveRecord::Base

  has_many :carriage

  validates :name, presence: true
end
